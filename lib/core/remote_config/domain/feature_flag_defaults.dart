import 'package:riverpodlive/core/remote_config/domain/feature_flag_keys.dart';

/// In-app default values used when Remote Config cannot be fetched
/// (e.g. first launch without network, Firebase not yet configured).
///
/// Keys must match [FeatureFlagKeys].
abstract final class FeatureFlagDefaults {
  static const Map<String, dynamic> all = {
    // Booleans
    FeatureFlagKeys.enableNewDashboard: false,
    FeatureFlagKeys.enableDarkMode: true,
    FeatureFlagKeys.enableChat: false,
    FeatureFlagKeys.enableForceUpdate: false,
    FeatureFlagKeys.enableMaintenance: false,

    // Strings
    FeatureFlagKeys.maintenanceMessage: '',
    FeatureFlagKeys.appMinVersion: '1.0.0',
    FeatureFlagKeys.announcementUrl: '',

    // Numbers
    FeatureFlagKeys.maxContactSyncBatch: 500,
    FeatureFlagKeys.syncIntervalSeconds: 300,
  };
}
