import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/core/sync/domain/conflict/sync_conflict_resolver.dart';

/// Default conflict strategy: the side with the **newer timestamp wins**.
///
/// Compares [SyncTaskModel.localVersion] (ISO-8601 string captured at enqueue)
/// against `serverPayload['updatedAt']`.
///
/// - Server newer  → [KeepServer] (server wins).
/// - Local newer / equal → [KeepLocal] (local write wins, will be re-pushed).
/// - Missing timestamps  → [KeepServer] (safe default: server wins).
class LastWriteWinsResolver extends SyncConflictResolver {
  const LastWriteWinsResolver();

  @override
  Future<ConflictResolution> resolve(
    SyncTaskModel localTask,
    Map<String, dynamic> serverPayload,
  ) async {
    final localVersionStr = localTask.localVersion;
    final serverVersionStr = serverPayload['updatedAt']?.toString();

    if (localVersionStr == null || serverVersionStr == null) {
      // No version info — server wins as safe default.
      return KeepServer(serverPayload);
    }

    try {
      final localTime = DateTime.parse(localVersionStr);
      final serverTime = DateTime.parse(serverVersionStr);
      return serverTime.isAfter(localTime)
          ? KeepServer(serverPayload)
          : const KeepLocal();
    } on FormatException {
      // Malformed timestamps — server wins as safe default.
      return KeepServer(serverPayload);
    }
  }
}
