/// All Firebase Remote Config keys used as feature flags.
/// These must match the keys defined in the Firebase console.
abstract final class FeatureFlagKeys {
  // ── Boolean flags ────────────────────────────────────────────────────────
  /// Toggle a new dashboard UI (true = show new dashboard).
  static const String enableNewDashboard = 'enable_new_dashboard';

  /// Toggle dark-mode feature availability.
  static const String enableDarkMode = 'enable_dark_mode';

  /// Show/hide chat feature.
  static const String enableChat = 'enable_chat';

  /// Force users to update before using the app.
  static const String enableForceUpdate = 'enable_force_update';

  /// Show maintenance banner.
  static const String enableMaintenance = 'enable_maintenance';

  // ── String flags ─────────────────────────────────────────────────────────
  /// Maintenance message shown to the user (empty = no message).
  static const String maintenanceMessage = 'maintenance_message';

  /// Minimum supported app version (e.g. "2.3.0").
  static const String appMinVersion = 'app_min_version';

  /// URL for in-app announcements.
  static const String announcementUrl = 'announcement_url';

  // ── Numeric flags ────────────────────────────────────────────────────────
  /// Maximum number of contacts to sync in one batch.
  static const String maxContactSyncBatch = 'max_contact_sync_batch';

  /// Background sync interval in seconds.
  static const String syncIntervalSeconds = 'sync_interval_seconds';
}
