import 'package:riverpodlive/core/config/router/middleware/navigation_middleware.dart';
import 'package:riverpodlive/core/config/router/router_path.dart';

/// Example 1: Permission-based Guard
/// Use this to restrict access to routes based on user permissions
class PermissionGuard implements NavigationMiddleware {
  PermissionGuard({
    required this.routePermissions,
  });
  final Map<String, Set<String>> routePermissions;

  @override
  NavigationResult process(NavigationContext context) {
    // Check if route requires permissions
    final requiredPermissions = routePermissions[context.toRoute];
    if (requiredPermissions == null) {
      return NavigationResult.allow('Route has no permission requirements');
    }

    // Get user permissions from provider/storage
    // final userPermissions = getUserPermissions();
    // if (!userPermissions.containsAll(requiredPermissions)) {
    //   return NavigationResult.redirect(
    //     Routers.home.path,
    //     'Insufficient permissions for route: ${context.toRoute}',
    //   );
    // }

    return NavigationResult.allow('User has required permissions');
  }
}

/// Example 2: Deep Linking Guard
/// Handles navigation from deep links with proper authentication
class DeepLinkGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    // If trying to deep link to protected route without auth
    // redirect to login first
    if (!context.hasToken &&
        context.toRoute != Routers.login.path &&
        _isDeepLink(context)) {
      return NavigationResult.redirect(
        Routers.login.path,
        'Authentication required for deep link: ${context.toRoute}',
      );
    }

    return NavigationResult.allow('Deep link accessible');
  }

  bool _isDeepLink(NavigationContext context) {
    // Deep links typically come from external sources
    // You might check scheme, query parameters, etc.
    return true;
  }
}

/// Example 3: Feature Flag Guard
/// Control access to routes based on feature flags
class FeatureFlagGuard implements NavigationMiddleware {
  FeatureFlagGuard({
    required this.featureFlags,
  });
  final Map<String, bool> featureFlags;

  @override
  NavigationResult process(NavigationContext context) {
    // Check if route is gated behind a feature flag
    final isEnabled = featureFlags[context.toRoute] ?? true;

    if (!isEnabled) {
      return NavigationResult.redirect(
        Routers.home.path,
        'Feature not enabled for route: ${context.toRoute}',
      );
    }

    return NavigationResult.allow('Feature enabled');
  }
}

/// Example 4: State-based Guard
/// Control navigation based on app state
class AppStateGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    // Example: Prevent navigation if app is syncing data
    // final isSyncing = checkIfAppIsSyncing();
    // if (isSyncing && context.toRoute != Routers.login.path) {
    //   return NavigationResult.deny('App is syncing, please wait');
    // }

    // Example: Prevent navigation if user profile is incomplete
    // final profileComplete = checkIfProfileComplete();
    // if (!profileComplete && context.toRoute != '/complete-profile') {
    //   return NavigationResult.redirect(
    //     '/complete-profile',
    //     'Complete your profile first',
    //   );
    // }

    return NavigationResult.allow('App state check passed');
  }
}

/// Example 5: Rate Limiting Guard
/// Prevent rapid route changes
class RateLimitingGuard implements NavigationMiddleware {
  DateTime? _lastNavigationTime;
  final Duration _minInterval = const Duration(milliseconds: 300);

  @override
  NavigationResult process(NavigationContext context) {
    final now = DateTime.now();

    if (_lastNavigationTime != null) {
      final timeSinceLastNav = now.difference(_lastNavigationTime!);
      if (timeSinceLastNav < _minInterval) {
        return NavigationResult.deny('Navigation rate limited');
      }
    }

    _lastNavigationTime = now;
    return NavigationResult.allow('Rate limit check passed');
  }
}

/// Example 6: Session Timeout Guard
/// Check if user session has timed out
class SessionTimeoutGuard implements NavigationMiddleware {
  DateTime? _lastActivityTime;
  final Duration _sessionTimeout = const Duration(minutes: 30);

  @override
  NavigationResult process(NavigationContext context) {
    if (!context.hasToken) {
      return NavigationResult.allow('No active session');
    }

    if (_lastActivityTime != null) {
      final timeSinceLastActivity = DateTime.now().difference(
        _lastActivityTime!,
      );

      if (timeSinceLastActivity > _sessionTimeout) {
        return NavigationResult.redirect(
          Routers.login.path,
          'Session timeout. Please login again.',
        );
      }
    }

    _lastActivityTime = DateTime.now();
    return NavigationResult.allow('Session active');
  }
}

// Usage Example:
// In navigation_provider.dart:
//
// final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
//   return NavigationPipelineBuilder()
//       .add(AuthenticationGuard())
//       .add(AuthenticationStateGuard())
//       .add(PermissionGuard(
//         routePermissions: {
//           '/admin': {'admin'},
//           '/reports': {'view_reports'},
//         },
//       ))
//       .add(SessionTimeoutGuard())
//       .add(DeepLinkGuard())
//       .add(FeatureFlagGuard(
//         featureFlags: {
//           '/beta-feature': true,
//           '/experimental': false,
//         },
//       ))
//       .build();
// });
