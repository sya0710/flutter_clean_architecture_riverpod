/// Represents the type of mutation a SyncTaskModel will push to the server.
enum SyncOperation {
  /// A new record that does not yet exist on the server.
  create,

  /// An existing record that was modified locally.
  update,

  /// A record that was soft-deleted locally and must be removed on the server.
  delete,
}
