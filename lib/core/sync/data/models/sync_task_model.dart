import 'package:isar_community/isar.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_operation.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_priority.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_status.dart';

part 'sync_task_model.g.dart';

/// Isar-persisted record that represents one pending write operation
/// to be pushed to the remote server when connectivity is available.
///
/// Both the entity row and the corresponding [SyncTaskModel] are written
/// inside the **same Isar transaction** so a crash can never leave the queue
/// inconsistent with local storage.
@collection
class SyncTaskModel {
  Id id = Isar.autoIncrement;

  /// Category of entity (e.g. `'contact'`).
  /// Matched against SyncAdapter.entityType.
  @Index(type: IndexType.hash)
  String entityType = '';

  /// Local UUID of the entity (ContactModel.idLocal).
  @Index(type: IndexType.hash)
  String entityLocalId = '';

  /// Server-assigned ID — null until the first successful create.
  String? entityRemoteId;

  /// [SyncOperation] stored as its ordinal int
  /// (Isar doesn't support enums directly).
  int operationIndex = SyncOperation.create.index;

  /// [SyncStatus] stored as ordinal int; indexed for fast pending-query.
  @Index(type: IndexType.value)
  int statusIndex = SyncStatus.pending.index;

  /// [SyncPriority] stored as its ordinal int.
  ///
  /// Lower value = **higher** urgency:
  ///   `critical(0) > high(1) > normal(2) > low(3)`
  ///
  /// The sync engine sorts pending tasks by this value **ascending** so that
  /// critical tasks (e.g. payments) are always processed before lower-priority
  /// ones (e.g. profile updates). Within the same priority level tasks are
  /// ordered by [createdAt] ascending (oldest first).
  ///
  /// Default: [SyncPriority.normal].
  @Index(type: IndexType.value)
  int priorityIndex = SyncPriority.normal.index;

  /// JSON snapshot of the entity captured **at enqueue time**.
  /// Allows the worker to push the exact version the user wrote.
  String payload = '';

  /// How many push attempts have been made.
  int retryCount = 0;

  /// Maximum retries before the task is marked [SyncStatus.failed].
  int maxRetries = 3;

  /// When this task was first enqueued.
  @Index(type: IndexType.value)
  DateTime createdAt = DateTime.now();

  /// Timestamp of the most recent push attempt (null = never attempted).
  DateTime? lastAttemptAt;

  /// Human-readable error from the last failed attempt.
  String? errorMessage;

  /// ISO-8601 `updatedAt` of the entity captured at enqueue time.
  /// Used by the conflict resolver to compare local vs server timestamps.
  String? localVersion;

  /// Last known server `updatedAt` —
  /// updated after a successful sync or conflict.
  String? serverVersion;

  // ── Typed enum accessors ─────────────────────────────────────────────────

  @ignore
  SyncOperation get operation => SyncOperation.values[operationIndex];
  set operation(SyncOperation op) => operationIndex = op.index;

  @ignore
  SyncStatus get syncStatus => SyncStatus.values[statusIndex];
  set syncStatus(SyncStatus s) => statusIndex = s.index;

  @ignore
  SyncPriority get priority => SyncPriority.values[priorityIndex];
  set priority(SyncPriority p) => priorityIndex = p.index;

  // ── Convenience predicates ───────────────────────────────────────────────

  @ignore
  bool get isPending => statusIndex == SyncStatus.pending.index;
  @ignore
  bool get isInProgress => statusIndex == SyncStatus.inProgress.index;
  @ignore
  bool get isSynced => statusIndex == SyncStatus.synced.index;
  @ignore
  bool get isFailed => statusIndex == SyncStatus.failed.index;
  @ignore
  bool get isConflict => statusIndex == SyncStatus.conflict.index;
  @ignore
  bool get hasExceededRetries => retryCount >= maxRetries;

  @override
  String toString() =>
      'SyncTaskModel('
      'id: $id, type: $entityType, localId: $entityLocalId, '
      'op: $operation, priority: ${priority.label}, '
      'status: $syncStatus, retries: $retryCount)';
}
