import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/network/network_status_provider.dart';
import 'package:riverpodlive/core/sync/data/datasources/sync_queue_local.dart';
import 'package:riverpodlive/core/sync/engine/sync_garbage_collector.dart';
import 'package:riverpodlive/core/sync/engine/sync_worker.dart';

/// Orchestrates the entire offline-first sync pipeline.
///
/// Design goals:
/// - **Reactive**: driven by Isar `watchLazy()` and connectivity events —
///   no polling, minimal battery / CPU impact.
/// - **Debounced**: rapid successive Isar writes
/// collapse into a single drain pass.
/// - **Concurrent-safe**: a boolean flag prevents overlapping drain runs.
/// - **Back-pressure aware**: processes at most [_batchSize] tasks per cycle.
/// - **Auto-GC**: runs [SyncGarbageCollector] at startup and every 24 hours.
class SyncEngine {
  SyncEngine({
    required SyncQueueLocal queue,
    required SyncWorker worker,
    required SyncGarbageCollector garbageCollector,
    required Ref ref,
  }) : _queue = queue,
       _worker = worker,
       _gc = garbageCollector,
       _ref = ref;

  final SyncQueueLocal _queue;
  final SyncWorker _worker;
  final SyncGarbageCollector _gc;
  final Ref _ref;

  StreamSubscription<void>? _queueSub;
  Timer? _debounceTimer;
  Timer? _gcTimer;

  bool _isOnline = false;
  bool _isProcessing = false;

  static const int _batchSize = 50;
  static const Duration _debounce = Duration(milliseconds: 300);
  static const Duration _gcInterval = Duration(hours: 24);

  /// Boot the engine. Called once from the DI provider after the DB is open.
  void start() {
    // 1. Isar OS-level file notifications — zero polling.
    _queueSub = _queue.watchChanges().listen((_) => _scheduleProcess());

    // 2. Connectivity changes; auto-cancelled when the provider is disposed.
    _ref.listen<AsyncValue<bool>>(networkStatusProvider, (_, next) {
      next.whenData((isOnline) {
        _isOnline = isOnline;
        if (isOnline) {
          log('[SyncEngine] Network online → scheduling drain');
          _scheduleProcess();
        }
      });
    });

    // 3. GC: once at startup, then every 24 h.
    Future.microtask(_gc.collect);
    _gcTimer = Timer.periodic(_gcInterval, (_) => _gc.collect());

    // 4. Initial drain in case tasks are pending from a previous session.
    _scheduleProcess();
    log('[SyncEngine] Started');
  }

  /// Cancel all timers and stream subscriptions. Called by `ref.onDispose`.
  void dispose() {
    _debounceTimer?.cancel();
    _gcTimer?.cancel();
    _queueSub?.cancel();
    log('[SyncEngine] Disposed');
  }

  void _scheduleProcess() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, _drainQueue);
  }

  Future<void> _drainQueue() async {
    if (_isProcessing || !_isOnline) return;
    _isProcessing = true;

    try {
      log('[SyncEngine] Draining queue…');
      while (_isOnline) {
        final tasks = await _queue.getPending(limit: _batchSize);
        if (tasks.isEmpty) break;

        log('[SyncEngine] Processing ${tasks.length} task(s)');
        for (final task in tasks) {
          if (!_isOnline) break;
          await _worker.processTask(task);
        }
      }
    } on Exception catch (e) {
      log('[SyncEngine] Drain error: $e');
    } finally {
      _isProcessing = false;
      log('[SyncEngine] Drain complete');
    }
  }
}
