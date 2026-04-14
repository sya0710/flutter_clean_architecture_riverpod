/// Execution priority for a SyncTaskModel.
///
/// Lower ordinal = **higher** urgency. The sync engine processes tasks in
/// ascending priority order so that critical operations (e.g. payments) are
/// pushed to the server before lower-priority ones (e.g. profile updates).
///
/// ```
/// critical (0) → high (1) → normal (2) → low (3)
/// ```
enum SyncPriority {
  /// Must be synced before everything else.
  /// Example: payment confirmations, order submissions.
  critical,

  /// Important but not time-critical.
  /// Example: sending a message, deleting a record.
  high,

  /// Default priority for most write operations.
  /// Example: updating a contact, saving a form.
  normal,

  /// Background / best-effort operations.
  /// Example: syncing analytics events, caching preferences.
  low
  ;

  /// Human-readable label used for logs and debugging.
  String get label {
    switch (this) {
      case SyncPriority.critical:
        return 'critical';
      case SyncPriority.high:
        return 'high';
      case SyncPriority.normal:
        return 'normal';
      case SyncPriority.low:
        return 'low';
    }
  }
}
