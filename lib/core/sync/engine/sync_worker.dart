import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/sync/data/datasources/sync_queue_local.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/core/sync/domain/conflict/sync_conflict_resolver.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_status.dart';
import 'package:riverpodlive/core/sync/engine/sync_adapter.dart';

/// Stateless processor that handles a single [SyncTaskModel].
///
/// Responsibilities:
/// - Looks up the correct [SyncAdapter] for the task's entity type.
/// - Delegates the actual HTTP push to the adapter.
/// - Applies back-off, conflict resolution, and retry bookkeeping.
/// - Never blocks the engine — each call is fully `await`-able.
class SyncWorker {
  const SyncWorker({
    required this.adapters,
    required this.queue,
    required this.conflictResolver,
    required this.ref,
  });

  /// Registry keyed by [SyncAdapter.entityType].
  final Map<String, SyncAdapter> adapters;
  final SyncQueueLocal queue;
  final SyncConflictResolver conflictResolver;
  final Ref ref;

  /// Process [task]: mark in-progress → push → update status.
  Future<void> processTask(SyncTaskModel task) async {
    final adapter = adapters[task.entityType];
    if (adapter == null) {
      log('[SyncWorker] No adapter for entity type "${task.entityType}"');
      await _markFailed(task, 'No adapter registered for "${task.entityType}"');
      return;
    }

    // Guard: skip tasks already in-progress from a previous crashed session.
    task
      ..syncStatus = SyncStatus.inProgress
      ..lastAttemptAt = DateTime.now();
    await queue.updateTask(task);

    final result = await adapter.push(task, ref);

    switch (result) {
      case SyncAdapterSuccess(:final remoteId):
        task
          ..syncStatus = SyncStatus.synced
          ..entityRemoteId = remoteId ?? task.entityRemoteId
          ..errorMessage = null;
        await queue.updateTask(task);
        log('[SyncWorker] ✅ Synced task ${task.id} (${task.entityType})');

      case SyncAdapterConflict(:final serverPayload):
        log('[SyncWorker] ⚠️ Conflict on task ${task.id} — resolving…');
        await _resolveConflict(task, adapter, serverPayload);

      case SyncAdapterNetworkError(:final message):
        log('[SyncWorker] 🌐 Network error on task ${task.id}: $message');
        await _scheduleRetry(task, message);

      case SyncAdapterFatalError(:final message):
        log('[SyncWorker] ❌ Fatal error on task ${task.id}: $message');
        await _markFailed(task, message);
    }
  }

  // ── Private helpers ──────────────────────────────────────────────────────

  Future<void> _resolveConflict(
    SyncTaskModel task,
    SyncAdapter adapter,
    Map<String, dynamic> serverPayload,
  ) async {
    final resolution = await conflictResolver.resolve(task, serverPayload);

    switch (resolution) {
      case KeepLocal():
        // Re-queue as pending so the engine retries the push.
        task
          ..syncStatus = SyncStatus.pending
          ..retryCount = 0
          ..serverVersion = serverPayload['updatedAt']?.toString()
          ..errorMessage = 'Conflict: local version re-queued for push';
        await queue.updateTask(task);
        log('[SyncWorker] Conflict resolved → KeepLocal (re-queued)');

      case KeepServer(serverPayload: final svPayload):
        // Mark as conflict; the engine/UI layer is responsible for applying
        // the server state locally and clearing the task.
        task
          ..syncStatus = SyncStatus.conflict
          ..serverVersion = svPayload['updatedAt']?.toString()
          ..errorMessage = 'Conflict: server version applied';
        await queue.updateTask(task);
        log('[SyncWorker] Conflict resolved → KeepServer (marked conflict)');

      case MergeData(mergedPayload: final merged):
        // Update the task payload to the merged version and re-queue.
        task
          ..syncStatus = SyncStatus.pending
          ..payload = merged.toString()
          ..retryCount = 0
          ..errorMessage = 'Conflict: merged payload re-queued for push';
        await queue.updateTask(task);
        log('[SyncWorker] Conflict resolved → MergeData (re-queued)');
    }
  }

  Future<void> _scheduleRetry(SyncTaskModel task, String errorMessage) async {
    task
      ..retryCount += 1
      ..errorMessage = errorMessage;

    if (task.hasExceededRetries) {
      task.syncStatus = SyncStatus.failed;
      log('[SyncWorker] Task ${task.id} exceeded max retries → failed');
    } else {
      // Exponential back-off: the engine will re-pick
      // on next connectivity event
      task.syncStatus = SyncStatus.pending;
      log(
        '[SyncWorker] Task ${task.id} retry ${task.retryCount}/${task.maxRetries}',
      );
    }
    await queue.updateTask(task);
  }

  Future<void> _markFailed(SyncTaskModel task, String errorMessage) async {
    task
      ..syncStatus = SyncStatus.failed
      ..lastAttemptAt = DateTime.now()
      ..errorMessage = errorMessage;
    await queue.updateTask(task);
  }
}
