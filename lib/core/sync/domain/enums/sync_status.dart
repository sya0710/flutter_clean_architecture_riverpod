/// Lifecycle state of a single SyncTaskModel in the offline queue.
enum SyncStatus {
  /// Waiting to be picked up by the engine.
  pending,

  /// Currently being pushed to the server by a SyncWorker.
  inProgress,

  /// Successfully acknowledged by the server.
  synced,

  /// Exceeded SyncTaskModel.maxRetries — will not be retried automatically.
  failed,

  /// A conflict was detected; awaiting manual or automated resolution.
  conflict,
}
