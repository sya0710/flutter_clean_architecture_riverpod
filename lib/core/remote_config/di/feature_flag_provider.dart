import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/remote_config/data/remote_config_service.dart';
import 'package:riverpodlive/core/remote_config/di/remote_config_provider.dart';
import 'package:riverpodlive/core/remote_config/domain/feature_flag_keys.dart';
import 'package:riverpodlive/core/remote_config/domain/feature_flags.dart';

/// Notifier that manages the [FeatureFlags] state.
///
/// Usage – read a flag:
/// ```dart
/// final flags = ref.watch(featureFlagProvider).value ?? const FeatureFlags();
/// if (flags.enableNewDashboard) { ... }
/// ```
///
/// Usage – force a refresh (e.g. on app resume):
/// ```dart
/// ref.read(featureFlagProvider.notifier).refresh();
/// ```
class FeatureFlagNotifier extends AsyncNotifier<FeatureFlags> {
  @override
  Future<FeatureFlags> build() async {
    final service = ref.read(remoteConfigServiceProvider);
    await service.init();
    return _buildFlags(service);
  }

  /// Forces a fresh fetch from Remote Config and updates the state.
  Future<void> refresh() async {
    state = const AsyncLoading();
    final service = ref.read(remoteConfigServiceProvider);
    await service.refresh();
    state = AsyncData(_buildFlags(service));
  }

  // ── Private ──────────────────────────────────────────────────────────────

  FeatureFlags _buildFlags(RemoteConfigService service) {
    return FeatureFlags(
      enableNewDashboard: service.getBool(FeatureFlagKeys.enableNewDashboard),
      enableDarkMode: service.getBool(FeatureFlagKeys.enableDarkMode),
      enableChat: service.getBool(FeatureFlagKeys.enableChat),
      enableForceUpdate: service.getBool(FeatureFlagKeys.enableForceUpdate),
      enableMaintenance: service.getBool(FeatureFlagKeys.enableMaintenance),
      maintenanceMessage: service.getString(FeatureFlagKeys.maintenanceMessage),
      appMinVersion: service.getString(FeatureFlagKeys.appMinVersion),
      announcementUrl: service.getString(FeatureFlagKeys.announcementUrl),
      maxContactSyncBatch: service.getInt(FeatureFlagKeys.maxContactSyncBatch),
      syncIntervalSeconds: service.getInt(FeatureFlagKeys.syncIntervalSeconds),
    );
  }
}

/// The main provider for feature flags.
///
/// Always accessible with a safe fallback:
/// ```dart
/// final flags = ref.watch(featureFlagProvider).value ?? const FeatureFlags();
/// ```
final featureFlagProvider =
    AsyncNotifierProvider<FeatureFlagNotifier, FeatureFlags>(
      FeatureFlagNotifier.new,
    );

// ── Convenience selectors ──────────────────────────────────────────────────
// Use these fine-grained providers to avoid rebuilding widgets that
// don't care about the changed flag.

/// `true` when the new dashboard UI is enabled.
final enableNewDashboardProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagProvider).value?.enableNewDashboard ?? false;
});

/// `true` when the dark-mode feature is available.
final enableDarkModeProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagProvider).value?.enableDarkMode ?? true;
});

/// `true` when the chat feature is enabled.
final enableChatProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagProvider).value?.enableChat ?? false;
});

/// `true` when a force-update screen should be shown.
final enableForceUpdateProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagProvider).value?.enableForceUpdate ?? false;
});

/// `true` when the app is in maintenance mode.
final enableMaintenanceProvider = Provider<bool>((ref) {
  return ref.watch(featureFlagProvider).value?.enableMaintenance ?? false;
});

/// The maintenance message to display (empty string = no active maintenance).
final maintenanceMessageProvider = Provider<String>((ref) {
  return ref.watch(featureFlagProvider).value?.maintenanceMessage ?? '';
});

/// The minimum supported app version string.
final appMinVersionProvider = Provider<String>((ref) {
  return ref.watch(featureFlagProvider).value?.appMinVersion ?? '1.0.0';
});
