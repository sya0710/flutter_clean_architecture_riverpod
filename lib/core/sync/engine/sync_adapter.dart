import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';

// ── Adapter result (sealed) ───────────────────────────────────────────────

/// The outcome of a single [SyncAdapter.push] attempt.
sealed class SyncAdapterResult {
  const SyncAdapterResult();
}

/// The server accepted the push.
final class SyncAdapterSuccess extends SyncAdapterResult {
  const SyncAdapterSuccess({this.remoteId});

  /// Server-assigned ID returned from create/update. Null for deletes.
  final String? remoteId;
}

/// The server rejected the push with a 409 conflict and returned its
/// current version in [serverPayload].
final class SyncAdapterConflict extends SyncAdapterResult {
  const SyncAdapterConflict(this.serverPayload);

  final Map<String, dynamic> serverPayload;
}

/// A transient network / timeout error — safe to retry with back-off.
final class SyncAdapterNetworkError extends SyncAdapterResult {
  const SyncAdapterNetworkError(this.message);

  final String message;
}

/// A non-retriable error (auth failure, validation error, etc.).
/// The task will be marked SyncStatus.failed immediately.
final class SyncAdapterFatalError extends SyncAdapterResult {
  const SyncAdapterFatalError(this.message);

  final String message;
}

// ── Adapter interface ──────────────────────────────────────────────────────

/// Knows how to push one specific entity type to the remote server.
///
/// Register adapters in the syncAdapterRegistryProvider map, keyed by
/// [entityType]. The SyncWorker looks up the right adapter at runtime.
abstract class SyncAdapter {
  const SyncAdapter();

  /// Matches [SyncTaskModel.entityType] — e.g. `'contact'`.
  String get entityType;

  /// Push the pending task to the server.
  Future<SyncAdapterResult> push(SyncTaskModel task, Ref ref);

  /// Fetch the current server version of an entity by its remote ID.
  /// Returns `null` if the entity no longer exists on the server.
  /// Used during conflict resolution to populate serverPayload.
  Future<Map<String, dynamic>?> fetchFromServer(String remoteId, Ref ref);
}
