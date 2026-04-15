import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/config/router/router.dart';

/// Extension on WidgetRef to provide convenient navigation refresh
extension NavigationRefresh on WidgetRef {
  /// Trigger router refresh to re-evaluate redirects
  /// Call this when authentication state changes (login/logout)
  void refreshNavigation() {
    read(goRouterRefreshNotifierProvider).refresh();
  }
}
