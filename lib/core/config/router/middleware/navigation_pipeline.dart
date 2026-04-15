import 'package:riverpodlive/core/config/router/middleware/navigation_middleware.dart';

/// Pipeline for executing multiple middleware in sequence
class NavigationPipeline {
  NavigationPipeline({
    required this.middlewares,
  });
  final List<NavigationMiddleware> middlewares;

  /// Process navigation through all middleware
  /// Returns the first result that denies or redirects
  /// If all allow, returns allow result
  NavigationResult execute(NavigationContext context) {
    for (final middleware in middlewares) {
      final result = middleware.process(context);

      // If any middleware denies or redirects, return immediately
      if (!result.shouldAllow || result.redirectPath != null) {
        return result;
      }
    }

    // All middleware passed
    return NavigationResult.allow('All middleware passed');
  }

  /// Create a new pipeline with additional middleware
  NavigationPipeline addMiddleware(NavigationMiddleware middleware) {
    return NavigationPipeline(
      middlewares: [...middlewares, middleware],
    );
  }
}

/// Builder for creating navigation pipelines
class NavigationPipelineBuilder {
  final List<NavigationMiddleware> _middlewares = [];

  /// Add a middleware to the pipeline
  void add(NavigationMiddleware middleware) {
    _middlewares.add(middleware);
  }

  /// Build the pipeline
  NavigationPipeline build() {
    return NavigationPipeline(middlewares: _middlewares);
  }
}
