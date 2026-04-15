import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/config/router/middleware/navigation_guards.dart';
import 'package:riverpodlive/core/config/router/middleware/navigation_pipeline.dart';
import 'package:riverpodlive/core/config/router/navigation_service.dart';

/// Provider for the navigation pipeline
/// This can be customized with different guards based on your requirements
final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
  return (NavigationPipelineBuilder()
        ..add(AuthenticationGuard())
        ..add(AuthenticationStateGuard())
        ..add(
          RouteAccessGuard(
            protectedRoutes: {'/'},
            publicRoutes: {'/login'},
          ),
        ))
      .build();
});

/// Provider for the navigation service
/// Initializes the service with the configured pipeline
final navigationServiceProvider = Provider<NavigationService>((ref) {
  final pipeline = ref.watch(navigationPipelineProvider);
  final service = NavigationService()..pipeline = pipeline;
  return service;
});
