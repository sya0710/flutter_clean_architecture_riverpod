import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpodlive/core/remote_config/data/remote_config_service.dart';
import 'package:riverpodlive/core/remote_config/domain/feature_flag_defaults.dart';

/// Firebase Remote Config implementation of [RemoteConfigService].
final class FirebaseRemoteConfigService implements RemoteConfigService {
  FirebaseRemoteConfigService(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  @override
  Future<void> init() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          // Short timeout so the app launches quickly even on slow networks.
          fetchTimeout: const Duration(seconds: 10),
          // In production, fetch at most once per hour to respect quotas.
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );

      // Register local defaults so values are always available.
      await _remoteConfig.setDefaults(FeatureFlagDefaults.all);

      // Fetch latest values from Firebase and activate them atomically.
      await _remoteConfig.fetchAndActivate();

      log(
        '[RemoteConfig] initialised – status: ${_remoteConfig.lastFetchStatus}',
      );
    } on Exception catch (e, st) {
      // Non-fatal: the app will run with the registered defaults.
      log('[RemoteConfig] init error: $e', stackTrace: st);
    }
  }

  @override
  Future<void> refresh() async {
    try {
      await _remoteConfig.fetchAndActivate();
      log(
        '[RemoteConfig] refreshed – status: ${_remoteConfig.lastFetchStatus}',
      );
    } on Exception catch (e, st) {
      log('[RemoteConfig] refresh error: $e', stackTrace: st);
    }
  }

  @override
  bool getBool(String key) => _remoteConfig.getBool(key);

  @override
  String getString(String key) => _remoteConfig.getString(key);

  @override
  int getInt(String key) => _remoteConfig.getInt(key);

  @override
  double getDouble(String key) => _remoteConfig.getDouble(key);
}
