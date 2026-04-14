import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:riverpodlive/core/sync/data/datasources/sync_queue_local.dart';
import 'package:riverpodlive/core/sync/domain/conflict/last_write_wins_resolver.dart';
import 'package:riverpodlive/core/sync/domain/conflict/sync_conflict_resolver.dart';
import 'package:riverpodlive/core/sync/engine/sync_adapter.dart';
import 'package:riverpodlive/core/sync/engine/sync_engine.dart';
import 'package:riverpodlive/core/sync/engine/sync_garbage_collector.dart';
import 'package:riverpodlive/core/sync/engine/sync_worker.dart';
import 'package:riverpodlive/features/contacts/data/datasources/local/contact_sync_adapter.dart';

// ── Sync queue ─────────────────────────────────────────────────────────────

/// Provides the [SyncQueueLocal] backed by the Isar database.
///
/// Must be read **after** startupProvider has opened the database.
final syncQueueLocalProvider = Provider<SyncQueueLocal>((ref) {
  final isar = ref.read(databaseLocalManagementProvider).database;
  assert(
    isar != null,
    'Isar must be open before accessing syncQueueLocalProvider. '
    'Ensure startupProvider has completed.',
  );
  return SyncQueueLocalImpl(isar!);
});

// ── Conflict resolver ──────────────────────────────────────────────────────

/// Default conflict strategy: newest timestamp wins.
/// Swap this binding to change the global resolution strategy.
final syncConflictResolverProvider = Provider<SyncConflictResolver>((ref) {
  return const LastWriteWinsResolver();
});

// ── Adapter registry ───────────────────────────────────────────────────────

/// Maps entity type strings to their [SyncAdapter] implementations.
/// Register new adapters here when adding new sync-capable entity types.
final syncAdapterRegistryProvider = Provider<Map<String, SyncAdapter>>((ref) {
  return {
    ContactSyncAdapter.type: const ContactSyncAdapter(),
  };
});

// ── Worker ─────────────────────────────────────────────────────────────────

/// Stateless task processor. Shared across all engine instances.
final syncWorkerProvider = Provider<SyncWorker>((ref) {
  return SyncWorker(
    adapters: ref.read(syncAdapterRegistryProvider),
    queue: ref.read(syncQueueLocalProvider),
    conflictResolver: ref.read(syncConflictResolverProvider),
    ref: ref,
  );
});

// ── Garbage collector ──────────────────────────────────────────────────────

final syncGarbageCollectorProvider = Provider<SyncGarbageCollector>((ref) {
  final isar = ref.read(databaseLocalManagementProvider).database!;
  return SyncGarbageCollector(
    queue: ref.read(syncQueueLocalProvider),
    isar: isar,
  );
});

// ── Engine (keep-alive singleton) ──────────────────────────────────────────

/// The main sync orchestrator. Reading this provider boots the engine.
///
/// Kept alive for the entire app lifetime via a non-autoDispose [Provider].
/// Dispose is handled automatically when [ProviderScope] is torn down.
final syncEngineProvider = Provider<SyncEngine>((ref) {
  final engine = SyncEngine(
    queue: ref.read(syncQueueLocalProvider),
    worker: ref.read(syncWorkerProvider),
    garbageCollector: ref.read(syncGarbageCollectorProvider),
    ref: ref,
  )..start();
  ref.onDispose(engine.dispose);
  return engine;
});
