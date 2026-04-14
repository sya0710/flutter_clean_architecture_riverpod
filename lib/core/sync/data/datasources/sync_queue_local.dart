import 'package:isar_community/isar.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_status.dart';

/// Abstract datasource for the offline sync queue backed by Isar.
abstract class SyncQueueLocal {
  /// Persist a single task (wraps its own write transaction).
  Future<void> enqueue(SyncTaskModel task);

  /// Persist multiple tasks in a single write transaction.
  Future<void> enqueueBatch(List<SyncTaskModel> tasks);

  /// Insert a task **inside the caller's already-open write transaction**.
  ///
  /// Use this when you want to atomically write the entity AND its sync task:
  /// ```dart
  /// await isar.writeTxn(() async {
  ///   await isar.contacts.put(contact);
  ///   await queue.enqueueInTxn(isar, task);
  /// });
  /// ```
  Future<void> enqueueInTxn(Isar isar, SyncTaskModel task);

  /// Returns up to [limit] pending tasks ordered by [SyncTaskModel.createdAt].
  Future<List<SyncTaskModel>> getPending({int limit = 50});

  /// Persist any field changes on [task] (retry count, status, error, etc.).
  Future<void> updateTask(SyncTaskModel task);

  /// A lazy stream that fires whenever **any** row in the collection changes.
  ///
  /// Isar's `watchLazy()` uses OS-level file notifications — zero polling,
  /// minimal battery impact.
  Stream<void> watchChanges();

  /// Delete [SyncStatus.synced] tasks whose [SyncTaskModel.createdAt] is
  /// before [olderThan]. Returns the number of records deleted.
  Future<int> deleteCompleted({required DateTime olderThan});

  /// Delete [SyncStatus.failed] tasks whose [SyncTaskModel.lastAttemptAt] is
  /// before [olderThan]. Returns the number of records deleted.
  Future<int> deleteStaleFailures({required DateTime olderThan});

  /// Find the most-recent task for the given entity,
  /// optionally filtered by status.
  Future<SyncTaskModel?> findTask({
    required String entityType,
    required String entityLocalId,
    SyncStatus? status,
  });
}

/// Isar-backed implementation of [SyncQueueLocal].
class SyncQueueLocalImpl implements SyncQueueLocal {
  const SyncQueueLocalImpl(this._isar);

  final Isar _isar;

  @override
  Future<void> enqueue(SyncTaskModel task) async {
    await _isar.writeTxn(() async {
      await _isar.syncTaskModels.put(task);
    });
  }

  @override
  Future<void> enqueueBatch(List<SyncTaskModel> tasks) async {
    if (tasks.isEmpty) return;
    await _isar.writeTxn(() async {
      await _isar.syncTaskModels.putAll(tasks);
    });
  }

  @override
  Future<void> enqueueInTxn(Isar isar, SyncTaskModel task) async {
    // Called inside an already-open writeTxn — no new transaction needed.
    await isar.syncTaskModels.put(task);
  }

  @override
  Future<List<SyncTaskModel>> getPending({int limit = 50}) {
    return _isar.syncTaskModels
        .filter()
        .statusIndexEqualTo(SyncStatus.pending.index)
        .sortByCreatedAt()
        .limit(limit)
        .findAll();
  }

  @override
  Future<void> updateTask(SyncTaskModel task) async {
    await _isar.writeTxn(() async {
      await _isar.syncTaskModels.put(task);
    });
  }

  @override
  Stream<void> watchChanges() => _isar.syncTaskModels.watchLazy();

  @override
  Future<int> deleteCompleted({required DateTime olderThan}) async {
    var count = 0;
    await _isar.writeTxn(() async {
      count = await _isar.syncTaskModels
          .filter()
          .statusIndexEqualTo(SyncStatus.synced.index)
          .createdAtLessThan(olderThan)
          .deleteAll();
    });
    return count;
  }

  @override
  Future<int> deleteStaleFailures({required DateTime olderThan}) async {
    // Filter in Dart because lastAttemptAt is nullable.
    final stale = await _isar.syncTaskModels
        .filter()
        .statusIndexEqualTo(SyncStatus.failed.index)
        .findAll();

    final ids = stale
        .where(
          (SyncTaskModel t) =>
              t.lastAttemptAt != null && t.lastAttemptAt!.isBefore(olderThan),
        )
        .map((SyncTaskModel t) => t.id)
        .toList();

    if (ids.isEmpty) return 0;

    await _isar.writeTxn(() async {
      await _isar.syncTaskModels.deleteAll(ids);
    });
    return ids.length;
  }

  @override
  Future<SyncTaskModel?> findTask({
    required String entityType,
    required String entityLocalId,
    SyncStatus? status,
  }) async {
    var query = _isar.syncTaskModels
        .filter()
        .entityTypeEqualTo(entityType)
        .and()
        .entityLocalIdEqualTo(entityLocalId);

    if (status != null) {
      query = query.and().statusIndexEqualTo(status.index);
    }

    final results = await query.sortByCreatedAtDesc().limit(1).findAll();
    return results.firstOrNull;
  }
}
