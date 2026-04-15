import 'package:riverpodlive/core/config/router/middleware/navigation_middleware.dart';
import 'package:riverpodlive/core/config/router/router_path.dart';

/// Guard that ensures unauthenticated users cannot access protected routes
class AuthenticationGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    // If user has no token and is trying to access non-login route
    if (!context.hasToken && context.toRoute != Routers.login.path) {
      return NavigationResult.redirect(
        Routers.login.path,
        'User not authenticated. Redirecting to login.',
      );
    }

    return NavigationResult.allow('Authentication check passed');
  }
}

/// Guard that prevents authenticated users from accessing login page
class AuthenticationStateGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    // If user has token and is trying to access login route
    if (context.hasToken && context.toRoute == Routers.login.path) {
      return NavigationResult.redirect(
        Routers.home.path,
        'User already authenticated. Redirecting to home.',
      );
    }

    return NavigationResult.allow('Authentication state check passed');
  }
}

/// Guard that validates route accessibility
class RouteAccessGuard implements NavigationMiddleware {
  RouteAccessGuard({
    Set<String>? protectedRoutes,
    Set<String>? publicRoutes,
  }) : protectedRoutes = protectedRoutes ?? {Routers.home.path},
       publicRoutes = publicRoutes ?? {Routers.login.path};
  final Set<String> protectedRoutes;
  final Set<String> publicRoutes;

  @override
  NavigationResult process(NavigationContext context) {
    final toRoute = context.toRoute;

    // Check if route is protected and user is not authenticated
    if (protectedRoutes.contains(toRoute) && !context.hasToken) {
      return NavigationResult.redirect(
        Routers.login.path,
        'Route "$toRoute" is protected. User not authenticated.',
      );
    }

    // Check if route is public only (e.g., login)
    // and user is already authenticated
    if (publicRoutes.contains(toRoute) && context.hasToken) {
      return NavigationResult.redirect(
        Routers.home.path,
        'Route "$toRoute" is public only. User is already authenticated.',
      );
    }

    return NavigationResult.allow('Route access granted');
  }
}
