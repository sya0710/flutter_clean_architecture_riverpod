# Middleware & Navigation Guard Implementation Summary

## What Was Implemented

A clean, scalable middleware and navigation guard system that separates navigation logic from UI and business logic.

## Key Files Created

### Core Middleware System
- ✅ `lib/core/config/router/middleware/navigation_middleware.dart` - Base middleware abstraction
- ✅ `lib/core/config/router/middleware/navigation_guards.dart` - Pre-built authentication guards
- ✅ `lib/core/config/router/middleware/navigation_pipeline.dart` - Pipeline for executing middleware
- ✅ `lib/core/config/router/middleware/examples.dart` - Examples of custom middleware

### Navigation Infrastructure
- ✅ `lib/core/config/router/navigation_service.dart` - High-level navigation service
- ✅ `lib/core/config/router/models/navigation_state.dart` - Navigation state model
- ✅ `lib/core/config/router/providers/navigation_provider.dart` - Navigation service provider
- ✅ `lib/core/config/router/providers/auth_state_provider.dart` - Authentication state providers
- ✅ `lib/core/config/router/extensions/navigation_refresh_extension.dart` - Navigation refresh helper

### Files Modified
- ✅ `lib/core/config/router/router.dart` - Integrated middleware into GoRouter
- ✅ `lib/features/auth/presentation/providers/auth_notifier.dart` - Added logout method, triggers refresh
- ✅ `lib/features/auth/presentation/pages/login_page.dart` - Removed manual navigation logic

### Documentation
- ✅ `MIDDLEWARE_GUIDE.md` - Comprehensive guide and examples

## How It Works

### Architecture Flow

```
User Action (Login/Logout)
       ↓
Provider Updates Token
       ↓
refresh() called via NavigationRefreshExtension
       ↓
GoRouter re-evaluates redirect()
       ↓
NavigationService validates through middleware pipeline
       ↓
Each middleware processes:
  - AuthenticationGuard
  - AuthenticationStateGuard
  - RouteAccessGuard
       ↓
Middleware returns allow/deny/redirect
       ↓
GoRouter applies redirect if needed
       ↓
User navigates to correct route
```

## Key Benefits

### 1. **Clean Architecture**
- Navigation logic isolated from UI layers
- No `context.go()` scattered throughout widgets
- Business logic in providers doesn't know about routing

### 2. **Single Responsibility**
- Each middleware has one clear purpose
- Easy to understand what each guard does
- Guards can be tested independently

### 3. **Maintainability**
- Add new routes without touching guards
- Modify guard logic without affecting UI
- All routing decisions in one place

### 4. **Extensibility**
- Add custom middleware for new features
- Compose middleware in any order
- Reuse guards across features

### 5. **Debuggability**
- Clear navigation decision logging
- Understand why navigation was redirected
- Easy to trace navigation flow

## Usage Examples

### Example 1: User Logs In
```dart
// User enters credentials and taps login button
ref.read(authProvider.notifier).login(request);

// AuthNotifier:
// 1. Calls API
// 2. Saves token to storage
// 3. Calls ref.refreshNavigation()

// GoRouter middleware chain:
// 1. AuthenticationGuard ✓ (has token)
// 2. AuthenticationStateGuard ✓ (not on login)
// 3. RouteAccessGuard ✓ (can access home)

// Result: User automatically navigates to home page
```

### Example 2: User Logs Out
```dart
// User taps logout button
ref.read(authProvider.notifier).logout();

// AuthNotifier:
// 1. Clears token from storage
// 2. Calls ref.refreshNavigation()

// GoRouter middleware chain:
// 1. AuthenticationGuard ✗ (no token, on protected route)
//    → Redirects to /login

// Result: User automatically navigates to login page
```

### Example 3: Unauthorized Access
```dart
// User without token tries to access /dashboard
// (e.g., from deep link or direct URL)

// GoRouter middleware chain:
// 1. AuthenticationGuard ✗ (no token, not on login)
//    → Redirects to /login

// Result: User is redirected to login before accessing dashboard
```

### Example 4: Already Logged In
```dart
// User with token tries to access /login
// (e.g., tapping back button from home)

// GoRouter middleware chain:
// 1. AuthenticationGuard ✓ (has token)
// 2. AuthenticationStateGuard ✗ (on login with token)
//    → Redirects to home

// Result: Logged-in user cannot access login page
```

## Adding Custom Middleware

### Step 1: Create the Middleware
```dart
class MyCustomGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (shouldBlock) {
      return NavigationResult.redirect('/path', 'reason');
    }
    return NavigationResult.allow('reason');
  }
}
```

### Step 2: Register in Pipeline
```dart
// In navigation_provider.dart
final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
  return NavigationPipelineBuilder()
      .add(AuthenticationGuard())
      .add(AuthenticationStateGuard())
      .add(RouteAccessGuard())
      .add(MyCustomGuard())  // ← Add here
      .build();
});
```

### Step 3: Use in App
That's it! Your guard is now active in the pipeline.

## Testing the Middleware

### Unit Test Example
```dart
test('AuthenticationGuard denies access without token', () {
  final guard = AuthenticationGuard();
  final context = NavigationContext(
    fromRoute: null,
    toRoute: '/',
    hasToken: false,
    router: mockState,
  );

  final result = guard.process(context);

  expect(result.redirectPath, equals('/login'));
  expect(result.shouldAllow, isFalse);
});
```

## Common Scenarios

### Scenario 1: Conditional Access
```dart
// Only show payment screen after checkout started
class PaymentGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (context.toRoute == '/payment' && !checkoutStarted) {
      return NavigationResult.redirect('/shop', 'Checkout not started');
    }
    return NavigationResult.allow('Access granted');
  }
}
```

### Scenario 2: Feature Flags
```dart
// Gate beta features behind flags
class BetaGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (context.toRoute == '/beta-feature' && !betaEnabled) {
      return NavigationResult.redirect('/', 'Feature not available');
    }
    return NavigationResult.allow('Feature enabled');
  }
}
```

### Scenario 3: Permission Checks
```dart
// Admin-only routes
class AdminGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (context.toRoute == '/admin' && !isAdmin) {
      return NavigationResult.redirect('/', 'Admin access only');
    }
    return NavigationResult.allow('Admin access granted');
  }
}
```

## Migration Checklist

If you have existing routes with manual navigation:

- [ ] Move all `context.go()` calls from widgets to middleware
- [ ] Remove manual token checks from UI code
- [ ] Convert conditional navigation logic to middleware
- [ ] Update providers to call `ref.refreshNavigation()`
- [ ] Remove `go_router` imports from UI widgets
- [ ] Test all navigation flows manually
- [ ] Add unit tests for critical middleware

## Next Steps

1. **Add new routes** with appropriate guards
2. **Implement permission system** with PermissionGuard
3. **Add deep linking** support with DeepLinkGuard
4. **Setup analytics** to track navigation decisions
5. **Create feature-specific** middleware for complex features

## Questions & Troubleshooting

### Q: Why isn't navigation happening?
A: Check that `ref.refreshNavigation()` is called after state changes.

### Q: How do I debug middleware decisions?
A: Check `navigationService.logNavigation()` output in console.

### Q: Can I have middleware that depends on user data?
A: Yes, inject providers into middleware constructor.

### Q: What's the order of middleware execution?
A: Top to bottom in the pipeline. First deny/redirect stops the chain.

## File Structure Overview

```
lib/core/config/router/
├── router.dart                              # Main GoRouter with middleware
├── router_path.dart                         # Route definitions
├── navigation_service.dart                  # Navigation service
├── models/
│   └── navigation_state.dart                # Navigation state model
├── middleware/
│   ├── navigation_middleware.dart           # Core abstraction
│   ├── navigation_guards.dart               # Pre-built guards
│   ├── navigation_pipeline.dart             # Pipeline executor
│   └── examples.dart                        # Custom middleware examples
├── providers/
│   ├── navigation_provider.dart             # Service provider
│   └── auth_state_provider.dart             # Auth state providers
└── extensions/
    └── navigation_refresh_extension.dart    # Refresh helper
```

## Conclusion

Your navigation system is now clean, maintainable, and scalable. All routing logic is centralized in middleware, making your app easier to test, debug, and extend.

Happy coding! 🚀

