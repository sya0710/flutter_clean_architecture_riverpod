import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodlive/core/config/router/router_path.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/features/auth/presentation/pages/login_page.dart';
import 'package:riverpodlive/features/main/presentation/pages/main_page.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

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
      final isOnLogin = state.matchedLocation == Routers.login.path;

      // No token → always send to login
      if (!hasToken && !isOnLogin) return Routers.login.path;

      // Has token and trying to open login → send home
      if (hasToken && isOnLogin) return Routers.home.path;

      return null; // no redirect
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
