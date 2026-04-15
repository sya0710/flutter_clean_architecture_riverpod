# Quick Reference: Middleware & Navigation Guards

## Quick Start

### 1. User Logs In
```dart
// In login_page.dart - user taps login
ref.read(authProvider.notifier).login(request);

// In auth_notifier.dart - after successful login
ref.read(goRouterRefreshNotifierProvider).refresh();
// ✅ Automatically navigates to home via middleware
```

### 2. User Logs Out
```dart
// Call logout method
ref.read(authProvider.notifier).logout();

// Inside logout()
await ref.read(storageManagementProvider).clearDataWhenLogout();
ref.read(goRouterRefreshNotifierProvider).refresh();
// ✅ Automatically navigates to login via middleware
```

### 3. Check if User is Authenticated
```dart
final isAuth = ref.watch(isAuthenticatedProvider);
final token = ref.watch(accessTokenProvider);
```

## How Middleware Works

```
Navigation Request
    ↓
GoRouter.redirect() called
    ↓
NavigationService.validateNavigation()
    ↓
NavigationPipeline processes each middleware:
    1. AuthenticationGuard
    2. AuthenticationStateGuard
    3. RouteAccessGuard
    ↓
Middleware returns: allow() | deny() | redirect()
    ↓
GoRouter applies redirect if needed
    ↓
User navigates to correct route
```

## File Locations

| File | Purpose |
|------|---------|
| `router.dart` | Main GoRouter with middleware integration |
| `navigation_service.dart` | High-level navigation API |
| `middleware/navigation_middleware.dart` | Base middleware interface |
| `middleware/navigation_guards.dart` | Pre-built authentication guards |
| `middleware/navigation_pipeline.dart` | Middleware executor |
| `providers/navigation_provider.dart` | Middleware pipeline provider |
| `providers/auth_state_provider.dart` | Authentication state tracking |
| `extensions/navigation_refresh_extension.dart` | Navigation refresh helper |

## Common Tasks

### Add a New Route
```dart
// 1. In router_path.dart
enum Routers {
  home('/'),
  login('/login'),
  dashboard('/dashboard'),  // ← Add new route
  ;
  
  const Routers(this.path);
  final String path;
}

// 2. In router.dart
routes: [
  GoRoute(
    path: Routers.dashboard.path,
    builder: (_, _) => const DashboardPage(),
  ),
  // ... other routes
]
```

### Create Custom Middleware
```dart
import 'package:riverpodlive/core/config/router/middleware/navigation_middleware.dart';

class MyGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (shouldBlock) {
      return NavigationResult.redirect('/path', 'reason');
    }
    return NavigationResult.allow('reason');
  }
}
```

### Register Custom Middleware
```dart
// In navigation_provider.dart
final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
  return NavigationPipelineBuilder()
      .add(AuthenticationGuard())
      .add(AuthenticationStateGuard())
      .add(RouteAccessGuard())
      .add(MyGuard())  // ← Add your guard here
      .build();
});
```

### Trigger Navigation Refresh
```dart
// After login/logout or state changes
ref.read(goRouterRefreshNotifierProvider).refresh();

// Or using extension (if WidgetRef available)
ref.refreshNavigation();
```

## Middleware Classes

### AuthenticationGuard
✅ Prevents unauthenticated users from accessing protected routes
- No token + accessing protected route → redirects to login

### AuthenticationStateGuard
✅ Prevents authenticated users from accessing public-only routes
- Has token + accessing login → redirects to home

### RouteAccessGuard
✅ Validates route accessibility based on configuration
- Can define protected routes and public routes
- Blocks unauthorized access

## Navigation State

```dart
// Current authentication status
final isAuthenticated = ref.watch(isAuthenticatedProvider);

// Current access token
final token = ref.watch(accessTokenProvider);

// Navigation context
final context = NavigationContext(
  fromRoute: null,
  toRoute: '/dashboard',
  hasToken: true,
  router: state,
);

// Navigation result
final result = NavigationResult.redirect('/login', 'No permission');
```

## Debugging

### View Navigation Decisions
Navigation decisions are logged via `navigationService.logNavigation()`. Check console output:

```
Navigation Decision: NavigationResult(allow: false, redirect: /login, reason: User not authenticated...)
```

### Check Current Route
```dart
final currentRoute = state.matchedLocation;  // Inside redirect()
```

### Check Token Status
```dart
final hasToken = storage.accessToken.value.isNotEmpty;
```

## Best Practices

✅ **Do:**
- Put all routing logic in middleware
- Use `refreshNavigation()` to trigger redirects
- Keep middleware stateless when possible
- Add meaningful reasons to redirect results

❌ **Don't:**
- Use `context.go()` in UI widgets
- Check tokens directly in UI code
- Put business logic in middleware
- Hardcode navigation paths (use enum)

## Troubleshooting

### Navigation Not Happening?
→ Check that `refreshNavigation()` was called

### Middleware Not Running?
→ Verify it's registered in `navigationPipelineProvider`

### Wrong Route After Login?
→ Check that `AuthenticationStateGuard` is configured correctly

### Session Timeout Not Working?
→ Create a `SessionTimeoutGuard` and add to pipeline

## Examples

See `middleware/examples.dart` for:
- PermissionGuard
- DeepLinkGuard
- FeatureFlagGuard
- AppStateGuard
- RateLimitingGuard
- SessionTimeoutGuard

## Next Steps

1. Test all navigation flows manually
2. Add custom middleware for your features
3. Implement deep linking
4. Add analytics to navigation decisions
5. Create feature-specific guards

---

**Need more help?** See `MIDDLEWARE_GUIDE.md` for comprehensive documentation.

