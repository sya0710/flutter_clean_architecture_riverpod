import 'dart:developer';

import 'package:isar_community/isar.dart';
import 'package:riverpodlive/core/sync/data/datasources/sync_queue_local.dart';
import 'package:riverpodlive/features/contacts/constants/contact_status_constant.dart';
import 'package:riverpodlive/features/contacts/data/models/contact_model.dart';

/// Removes stale records from both the sync queue and the local entity tables.
///
/// Collection passes:
/// 1. **Synced tasks** older than [_syncedRetention] —
/// already pushed, safe to drop.
/// 2. **Failed tasks** older than [_failedRetention] —
/// gave up; drop to reclaim space.
/// 3. **Soft-deleted contacts** that are confirmed-synced and older than
///    [_deletedContactRetention] — server knows about the deletion.
class SyncGarbageCollector {
  const SyncGarbageCollector({
    required SyncQueueLocal queue,
    required Isar isar,
  }) : _queue = queue,
       _isar = isar;

  final SyncQueueLocal _queue;
  final Isar _isar;

  static const Duration _syncedRetention = Duration(days: 7);
  static const Duration _failedRetention = Duration(days: 30);
  static const Duration _deletedContactRetention = Duration(days: 30);

  /// Run all GC passes.
  /// Safe to call from any isolate as long as [_isar] is open.
  Future<void> collect() async {
    final now = DateTime.now();
    log('[SyncGC] Starting garbage collection…');

    final syncedDeleted = await _queue.deleteCompleted(
      olderThan: now.subtract(_syncedRetention),
    );

    final failedDeleted = await _queue.deleteStaleFailures(
      olderThan: now.subtract(_failedRetention),
    );

    final contactsDeleted = await _collectStaleDeletedContacts(now);

    log(
      '[SyncGC] Done — synced tasks: $syncedDeleted, '
      'failed tasks: $failedDeleted, stale contacts: $contactsDeleted',
    );
  }

  Future<int> _collectStaleDeletedContacts(DateTime now) async {
    try {
      // Fetch soft-deleted contacts that have already been pushed to the server
      final candidates = await _isar.contactModels
          .filter()
          .statusEqualTo(ContactStatusConstant.deleted)
          .isSyncedEqualTo(true)
          .findAll();

      final threshold = now.subtract(_deletedContactRetention);

      // Filter by updatedAt in Dart because the field is stored as String.
      final idsToDelete = candidates
          .where((c) {
            if (c.updatedAt == null) {
              return true; // no timestamp → treat as stale
            }
            try {
              return DateTime.parse(c.updatedAt!).isBefore(threshold);
            } on FormatException {
              return false;
            }
          })
          .map((c) => c.id)
          .toList();

      if (idsToDelete.isEmpty) return 0;

      await _isar.writeTxn(() async {
        await _isar.contactModels.deleteAll(idsToDelete);
      });
      return idsToDelete.length;
    } on Exception catch (e) {
      log('[SyncGC] Error collecting stale contacts: $e');
      return 0;
    }
  }
}
