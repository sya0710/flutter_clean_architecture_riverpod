import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

/// Represents the current authentication and navigation state
@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState({
    required bool isAuthenticated,
    required String? currentRoute,
    required String? previousRoute,
    required bool isLoading,
  }) = _NavigationState;

  const NavigationState._();

  /// Check if the user is logged in
  bool get isLoggedIn => isAuthenticated;

  /// Check if currently on login route
  bool get isOnLoginRoute => currentRoute == '/login';

  /// Check if currently on home route
  bool get isOnHomeRoute => currentRoute == '/';
}
