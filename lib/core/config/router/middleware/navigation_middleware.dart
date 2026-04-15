import 'package:go_router/go_router.dart';

/// Context information passed to middleware
class NavigationContext {
  NavigationContext({
    required this.fromRoute,
    required this.toRoute,
    required this.hasToken,
    required this.router,
  });

  /// The route the user is trying to navigate from
  final String? fromRoute;

  /// The route the user is trying to navigate to
  final String toRoute;

  /// Whether the user has an auth token
  final bool hasToken;

  /// The GoRouter instance
  final GoRouterState router;

  @override
  String toString() =>
      'NavigationContext(from: $fromRoute, to: $toRoute, hasToken: $hasToken)';
}

/// Result of middleware processing
class NavigationResult {
  NavigationResult({
    this.redirectPath,
    this.shouldAllow = true,
    this.reason,
  });

  /// Allow the navigation to proceed
  factory NavigationResult.allow(String? reason) {
    return NavigationResult(
      reason: reason,
    );
  }

  /// Deny the navigation
  factory NavigationResult.deny(String reason) {
    return NavigationResult(
      shouldAllow: false,
      reason: reason,
    );
  }

  /// Redirect to a specific path
  factory NavigationResult.redirect(String path, String reason) {
    return NavigationResult(
      redirectPath: path,
      shouldAllow: false,
      reason: reason,
    );
  }

  /// If provided, redirect to this path instead of the requested one
  final String? redirectPath;

  /// Whether the navigation should be allowed to proceed
  final bool shouldAllow;

  /// Reason for the decision (for logging/debugging)
  final String? reason;

  @override
  String toString() =>
      'NavigationResult(allow: $shouldAllow, '
      'redirect: $redirectPath, reason: $reason)';
}

/// Middleware for handling navigation logic
// ignore: one_member_abstracts
abstract class NavigationMiddleware {
  /// Process navigation request and return result
  NavigationResult process(NavigationContext context);
}
