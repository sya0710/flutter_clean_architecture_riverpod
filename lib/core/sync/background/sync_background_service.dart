import 'dart:developer';
import 'dart:io';

import 'package:workmanager/workmanager.dart';

import 'sync_background_runner.dart';

/// Manages WorkManager (Android) and BGTaskScheduler (iOS) scheduling for the
/// offline-first background sync.
///
/// ### Usage
/// ```dart
/// // In bootstrap(), before runApp():
/// await SyncBackgroundService.initialize();
/// await SyncBackgroundService.schedulePeriodicSync();
/// ```
///
/// ### Platform behaviour
/// | Platform | Mechanism | Min frequency |
/// |----------|-----------|---------------|
/// | Android  | WorkManager PeriodicWorkRequest | 15 min |
/// | iOS      | BGProcessingTask / BGAppRefreshTask | OS-discretion |
///
/// ### Task ID
/// Both platforms share the same unique task identifier:
/// `com.example.riverpod.bg_sync`
///
/// > **Important**: Replace `com.example.riverpod` with your actual bundle ID
/// > when changing the `applicationId` in `build.gradle.kts` or
/// > `PRODUCT_BUNDLE_IDENTIFIER` in Xcode.
abstract class SyncBackgroundService {
  // ── Task identifiers ──────────────────────────────────────────────────────

  /// Unique task name — must match the value registered in
  /// `BGTaskSchedulerPermittedIdentifiers` (Info.plist) on iOS.
  static const String taskUniqueName = 'com.example.riverpod.bg_sync';

  /// Human-readable label used in WorkManager logs.
  static const String _taskTag = 'bg_sync';

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  /// Initialise WorkManager with the background callback dispatcher.
  ///
  /// Call once in `bootstrap()` **before** `runApp()`.  Safe to call on every
  /// cold start — WorkManager is idempotent.
  static Future<void> initialize() async {
    await Workmanager().initialize(
      backgroundCallbackDispatcher,
      isInDebugMode: false, // set true to see WorkManager logs in Logcat
    );
    log('[BgSyncService] Initialized');
  }

  /// Register (or replace) the periodic background sync task.
  ///
  /// [frequency] must be ≥ 15 minutes; WorkManager silently clamps smaller
  /// values to 15 minutes on Android.
  ///
  /// Constraints:
  /// - **Network required** — task will not run without connectivity.
  /// - **Battery not critically low** — avoids draining a nearly empty battery.
  /// - **Exponential back-off** starting at 5 minutes on failure.
  static Future<void> schedulePeriodicSync({
    Duration frequency = const Duration(minutes: 15),
  }) async {
    if (!Platform.isAndroid && !Platform.isIOS) return;

    await Workmanager().registerPeriodicTask(
      taskUniqueName,
      _taskTag,
      frequency: frequency,
      // Replace any previously registered task with the same unique name
      // so settings changes (e.g. frequency) take effect on the next start.
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(
        // Only run when the device has any active network connection.
        networkType: NetworkType.connected,
        // Skip if the battery is critically low — respect the user's device.
        requiresBatteryNotLow: true,
      ),
      backoffPolicy: BackoffPolicy.exponential,
      backoffPolicyDelay: const Duration(minutes: 5),
    );

    log(
      '[BgSyncService] Periodic task scheduled '
      '(every ${frequency.inMinutes} min, network required)',
    );
  }

  /// Cancel **all** pending WorkManager tasks registered by this app.
  ///
  /// Call on sign-out or when the user disables background sync in settings.
  static Future<void> cancelAll() async {
    await Workmanager().cancelAll();
    log('[BgSyncService] All background tasks cancelled');
  }

  /// Cancel only the periodic sync task, leaving other WorkManager tasks
  /// (if any) intact.
  static Future<void> cancelPeriodicSync() async {
    await Workmanager().cancelByUniqueName(taskUniqueName);
    log('[BgSyncService] Periodic sync task cancelled');
  }
}
