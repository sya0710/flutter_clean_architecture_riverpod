import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flags.freezed.dart';

/// Immutable snapshot of all feature flags resolved from Remote Config.
///
/// Default values mirror FeatureFlagDefaults.all so the app works
/// correctly even if Remote Config has never been fetched.
@freezed
abstract class FeatureFlags with _$FeatureFlags {
  const factory FeatureFlags({
    // ── Booleans ─────────────────────────────────────────────────────────
    @Default(false) bool enableNewDashboard,
    @Default(true) bool enableDarkMode,
    @Default(false) bool enableChat,
    @Default(false) bool enableForceUpdate,
    @Default(false) bool enableMaintenance,

    // ── Strings ───────────────────────────────────────────────────────────
    @Default('') String maintenanceMessage,
    @Default('1.0.0') String appMinVersion,
    @Default('') String announcementUrl,

    // ── Numbers ───────────────────────────────────────────────────────────
    @Default(500) int maxContactSyncBatch,
    @Default(300) int syncIntervalSeconds,
  }) = _FeatureFlags;
}
