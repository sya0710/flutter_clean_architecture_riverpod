import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/remote_config/data/firebase_remote_config_service.dart';
import 'package:riverpodlive/core/remote_config/data/remote_config_service.dart';

/// Exposes the [RemoteConfigService] singleton.
///
/// Swap the concrete implementation here to use a different provider
/// (e.g. a mock for tests).
final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return FirebaseRemoteConfigService(FirebaseRemoteConfig.instance);
});
