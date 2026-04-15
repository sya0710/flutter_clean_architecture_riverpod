import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodlive/core/config/router/navigation_service.dart';
import 'package:riverpodlive/core/config/router/providers/navigation_provider.dart';
import 'package:riverpodlive/core/config/router/router_path.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/features/auth/presentation/pages/login_page.dart';
import 'package:riverpodlive/features/main/presentation/pages/main_page.dart';

/// Call [refresh()] after any auth-state change (login/logout)
/// to make GoRouter re-evaluate the redirect.
class GoRouterRefreshNotifier extends ChangeNotifier {
  void refresh() => notifyListeners();
}

final goRouterRefreshNotifierProvider = Provider<GoRouterRefreshNotifier>((
  ref,
) {
  return GoRouterRefreshNotifier();
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final storage = ref.read(storageManagementProvider);
  final refreshNotifier = ref.read(goRouterRefreshNotifierProvider);

  return GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final token = storage.accessToken.value;
      final hasToken = token.isNotEmpty;
      final currentRoute = state.matchedLocation;

      // Read navigation service inside redirect to ensure it's properly typed
      final navigationService = ref.read(navigationServiceProvider);

      // Use middleware pipeline for navigation validation
      final navigationResult = navigationService.validateNavigation(
        toRoute: currentRoute,
        fromRoute: null, // Can be enhanced to track previous route
        hasToken: hasToken,
        routerState: state,
      );

      // Log the navigation decision for debugging
      navigationService.logNavigation(navigationResult);

      // Apply redirect if middleware determined one is needed
      return navigationResult.redirectPath;
    },
    routes: [
      GoRoute(
        path: Routers.home.path,
        builder: (_, _) => const MainPage(),
      ),
      GoRoute(
        path: Routers.login.path,
        builder: (_, _) => const LoginPage(),
      ),
    ],
  );
});
