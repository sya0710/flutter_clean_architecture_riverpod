import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodlive/core/config/router/middleware/navigation_middleware.dart';
import 'package:riverpodlive/core/config/router/middleware/navigation_pipeline.dart';

/// Service for handling navigation with middleware support
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  late NavigationPipeline pipeline;

  /// Validate navigation request through middleware pipeline
  NavigationResult validateNavigation({
    required String toRoute,
    required String? fromRoute,
    required bool hasToken,
    required GoRouterState routerState,
  }) {
    final context = NavigationContext(
      fromRoute: fromRoute,
      toRoute: toRoute,
      hasToken: hasToken,
      router: routerState,
    );

    return pipeline.execute(context);
  }

  /// Navigate to a route using GoRouter context
  void navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    Object? extra,
  }) {
    if (replace) {
      GoRouter.of(context).push(path, extra: extra);
    } else {
      GoRouter.of(context).go(path);
    }
  }

  /// Navigate back
  void goBack(BuildContext context) {
    GoRouter.of(context).pop();
  }

  /// Log navigation decision (can be enhanced with analytics)
  void logNavigation(NavigationResult result) {
    // This can be enhanced to log to analytics service
    debugPrint('Navigation Decision: $result');
  }
}
