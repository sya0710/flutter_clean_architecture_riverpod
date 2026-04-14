import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:riverpodlive/core/sync/data/datasources/sync_queue_local.dart';
import 'package:riverpodlive/core/sync/di/sync_providers.dart';
import 'package:workmanager/workmanager.dart';

/// WorkManager / BGTaskScheduler callback dispatcher.
///
/// Runs in its **own Dart isolate** — completely isolated from the main app
/// isolate (separate memory, no shared state). Must be a top-level function
/// annotated with `@pragma('vm:entry-point')` so the AOT compiler does not
/// tree-shake it away.
///
/// ### Lifecycle per invocation
/// ```
/// OS wakes isolate
///   └─▶ backgroundCallbackDispatcher()
///         ├─ 1. Check network (fast bail-out if offline)
///         ├─ 2. Open Isar DB (fresh connection in this isolate)
///         ├─ 3. ProviderContainer (headless Riverpod — no UI)
///         ├─ 4. Drain pending sync queue (priority-ordered)
///         ├─ 5. Dispose container
///         └─ 6. Return success / failure to WorkManager
/// ```
///
/// Returning `false` tells WorkManager to **retry** (exponential back-off).
/// Returning `true` marks the task as successfully completed.
@pragma('vm:entry-point')
void backgroundCallbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    const tag = '[BgSync]';
    log('$tag Task started: $taskName');

    try {
      // ── 0. Platform channels must be ready before any plugin call ─────
      // WorkManager boots a headless Flutter engine — WidgetsFlutterBinding
      // initialises it; the workmanager plugin registers all other plugins
      // automatically, so no manual DartPluginRegistrant call is needed.
      WidgetsFlutterBinding.ensureInitialized();

      // ── 1. Fast bail-out: skip if there is no network ─────────────────
      // WorkManager's NetworkType.connected constraint already guarantees
      // connectivity on Android before the task fires.  We re-check here
      // so iOS BGTask invocations are also protected.
      final connectivity = await Connectivity().checkConnectivity();
      final isOffline =
          connectivity.isEmpty ||
          (connectivity.length == 1 &&
              connectivity.first == ConnectivityResult.none);

      if (isOffline) {
        log('$tag No network — skipping drain, will retry later');
        return false; // WorkManager will reschedule
      }

      // ── 2. Open Isar ──────────────────────────────────────────────────
      // This isolate has its own memory so DatabaseLocalManagement.instance
      // is a fresh singleton. openDatabase() opens a new connection to the
      // same on-disk file the main isolate uses; Isar handles concurrent
      // multi-isolate access safely with internal locking.
      await DatabaseLocalManagement.instance.openDatabase();

      // ── 3. Headless Riverpod container ────────────────────────────────
      // ProviderContainer is the Riverpod equivalent of ProviderScope but
      // without a Flutter widget tree.  All providers (queue, worker,
      // adapters, conflict resolver) are lazily instantiated from it.
      final container = ProviderContainer();

      try {
        // ── 4. Drain the pending queue ───────────────────────────────────
        // Mirrors SyncEngine._drainQueue() but runs synchronously to
        // completion before WorkManager's time budget is exhausted.
        final queue = container.read(syncQueueLocalProvider);
        final worker = container.read(syncWorkerProvider);

        var processed = 0;

        while (true) {
          // Tasks are returned sorted: priorityIndex ASC → createdAt ASC
          // (critical payments before profile updates, oldest first).
          final tasks = await queue.getPending(limit: 50);
          if (tasks.isEmpty) break;

          for (final task in tasks) {
            await worker.processTask(task);
            processed++;
          }
        }

        log('$tag Drain complete — $processed task(s) pushed');
        return true;
      } finally {
        // Dispose the container so every provider's onDispose runs cleanly.
        container.dispose();
      }
    } on Exception catch (e, st) {
      log('$tag Unhandled error: $e', error: e, stackTrace: st);
      return false; // WorkManager retries with exponential back-off
    }
  });
}
