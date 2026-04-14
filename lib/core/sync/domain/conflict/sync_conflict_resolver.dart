import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';

// ── Conflict resolution result (sealed) ──────────────────────────────────────

/// The decision returned by a [SyncConflictResolver] after comparing the
/// local pending write with the current server state.
sealed class ConflictResolution {
  const ConflictResolution();
}

/// Re-push the local payload as-is — the local write wins.
final class KeepLocal extends ConflictResolution {
  const KeepLocal();
}

/// Discard the local payload and apply the server's current state locally.
final class KeepServer extends ConflictResolution {
  const KeepServer(this.serverPayload);

  /// The full server-side JSON that must be persisted locally.
  final Map<String, dynamic> serverPayload;
}

/// Push a merged payload to the server (custom merge strategy).
final class MergeData extends ConflictResolution {
  const MergeData(this.mergedPayload);

  /// The merged JSON that should both be persisted locally and pushed to server
  final Map<String, dynamic> mergedPayload;
}

// ── Resolver interface ─────────────────────────────────────────────────────

/// Strategy interface for resolving write conflicts between the local pending
/// task and the current server state.
///
/// Swap implementations via the DI container to change conflict strategy
/// without touching business logic.
// ignore: one_member_abstracts
abstract class SyncConflictResolver {
  const SyncConflictResolver();

  /// Determine which version should win.
  ///
  /// [localTask]      – the pending [SyncTaskModel] in the queue.
  /// [serverPayload]  – the server's current JSON for the same entity.
  Future<ConflictResolution> resolve(
    SyncTaskModel localTask,
    Map<String, dynamic> serverPayload,
  );
}
