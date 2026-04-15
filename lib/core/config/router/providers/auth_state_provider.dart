import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';

/// Provider that tracks the current authentication state
/// Watches storage for token changes
final authenticationStateProvider = Provider<bool>((ref) {
  final storage = ref.watch(storageManagementProvider);
  // Watch the access token for changes
  return storage.accessToken.value.isNotEmpty;
});

/// Provider that returns the current access token
final accessTokenProvider = Provider<String?>((ref) {
  final storage = ref.watch(storageManagementProvider);
  final token = storage.accessToken.value;
  return token.isEmpty ? null : token;
});

/// Provider that checks if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authenticationStateProvider);
});
