# Navigation Middleware & Guards Architecture

## Overview

This system provides a clean, maintainable way to handle navigation logic and authentication flows in your Flutter application. Instead of scattering navigation logic across multiple providers and UI layers, the middleware system centralizes all routing decisions in one place.

## Key Components

### 1. **Navigation Middleware** (`navigation_middleware.dart`)

The base abstraction for navigation rules.

```dart
abstract class NavigationMiddleware {
  NavigationResult process(NavigationContext context);
}
```

- **NavigationContext**: Contains information about the navigation request
  - `fromRoute`: Where the user is coming from
  - `toRoute`: Where the user wants to go
  - `hasToken`: Whether the user is authenticated
  - `router`: GoRouterState for accessing router information

- **NavigationResult**: Represents the outcome of middleware processing
  - `allow()`: Allow navigation to proceed
  - `deny()`: Deny navigation
  - `redirect()`: Redirect to a different route

### 2. **Navigation Guards** (`navigation_guards.dart`)

Pre-built middleware implementations for common authentication scenarios:

#### AuthenticationGuard
Ensures unauthenticated users cannot access protected routes.

```dart
// Without token → redirects to login
// With token → allows access
```

#### AuthenticationStateGuard
Prevents authenticated users from accessing public-only routes like login.

```dart
// Has token & tries to access login → redirects to home
// No token & tries to access login → allows access
```

#### RouteAccessGuard
Validates route accessibility based on route categories.

```dart
RouteAccessGuard(
  protectedRoutes: {'/'},
  publicRoutes: {'/login'},
)
```

### 3. **Navigation Pipeline** (`navigation_pipeline.dart`)

Executes multiple middleware in sequence.

```dart
final pipeline = NavigationPipelineBuilder()
    .add(AuthenticationGuard())
    .add(AuthenticationStateGuard())
    .add(RouteAccessGuard())
    .build();
```

The pipeline stops at the first middleware that denies or redirects.

### 4. **Navigation Service** (`navigation_service.dart`)

High-level service for handling navigation with middleware support.

```dart
final service = navigationServiceProvider;

// Validate navigation request
final result = service.validateNavigation(
  toRoute: '/dashboard',
  fromRoute: '/',
  hasToken: true,
  routerState: state,
);
```

### 5. **Authentication State Provider** (`auth_state_provider.dart`)

Tracks the current authentication state.

```dart
// Watch authentication state
final isAuthenticated = ref.watch(isAuthenticatedProvider);
```

## How It Works

### Login Flow

```
User enters credentials
        ↓
LoginPage calls authProvider.notifier.login()
        ↓
AuthNotifier saves token to storage
        ↓
AuthNotifier calls ref.refreshNavigation()
        ↓
GoRouter re-evaluates redirect
        ↓
Navigation pipeline processes:
  1. AuthenticationGuard ✓ (has token)
  2. AuthenticationStateGuard ✓ (not on login)
  3. RouteAccessGuard ✓ (can access home)
        ↓
User navigates to home page
```

### Logout Flow

```
User taps logout
        ↓
authProvider.notifier.logout()
        ↓
AuthNotifier clears token from storage
        ↓
AuthNotifier calls ref.refreshNavigation()
        ↓
GoRouter re-evaluates redirect
        ↓
Navigation pipeline processes:
  1. AuthenticationGuard ✗ (no token, not on login)
     → redirects to /login
        ↓
User navigates to login page
```

### Unauthorized Access Attempt

```
User tries to access /dashboard without token
        ↓
GoRouter redirect called
        ↓
Navigation pipeline processes:
  1. AuthenticationGuard ✗ (no token, not on login)
     → redirects to /login
        ↓
User redirected to login page
```

## Usage

### 1. Basic Setup (Already Done in router.dart)

The router is already configured with the middleware system:

```dart
final appRouterProvider = Provider<GoRouter>((ref) {
  final navigationService = ref.read(navigationServiceProvider);
  
  return GoRouter(
    redirect: (context, state) {
      final result = navigationService.validateNavigation(
        toRoute: state.matchedLocation,
        hasToken: hasToken,
        routerState: state,
      );
      return result.redirectPath;
    },
    // ...
  );
});
```

### 2. Add Custom Middleware

Create a new middleware for specific requirements:

```dart
class AdminGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (context.toRoute == '/admin' && !userIsAdmin) {
      return NavigationResult.redirect(
        '/unauthorized',
        'Only admins can access /admin',
      );
    }
    return NavigationResult.allow('Admin check passed');
  }
}
```

### 3. Register Custom Middleware

Update `navigation_provider.dart`:

```dart
final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
  return NavigationPipelineBuilder()
      .add(AuthenticationGuard())
      .add(AuthenticationStateGuard())
      .add(RouteAccessGuard())
      .add(AdminGuard())  // ← New guard
      .build();
});
```

### 4. Trigger Navigation Refresh

Use the extension in any provider or widget:

```dart
// In auth_notifier.dart
await login();
ref.refreshNavigation(); // Triggers router redirect

// Or in any widget
final ref = useRef();
onLogout() {
  ref.refreshNavigation();
}
```

### 5. Check Authentication State

```dart
// In any widget or provider
final isAuth = ref.watch(isAuthenticatedProvider);
final token = ref.watch(accessTokenProvider);

if (!isAuth) {
  // Show login prompt or redirect
}
```

## Benefits

### ✅ Clean Architecture
- Navigation logic is separated from UI and business logic
- Single responsibility: middleware only handles navigation rules

### ✅ Maintainability
- Centralized routing decisions in the middleware pipeline
- Easy to add/remove/modify guards without touching UI

### ✅ Testability
- Middleware can be unit tested independently
- NavigationResult is immutable and predictable

### ✅ Reusability
- Guards can be shared across features
- Middleware is stateless and composable

### ✅ Debuggability
- `navigationService.logNavigation()` logs all decisions
- Clear redirect reasons and flow tracing

### ✅ Scalability
- Add new routes without changing existing guards
- Create feature-specific guards easily
- Pipeline can handle unlimited middleware

## Common Patterns

### Pattern 1: Feature-Specific Guards

```dart
class ContactsGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (!context.toRoute.startsWith('/contacts')) {
      return NavigationResult.allow('Not a contacts route');
    }
    
    if (!userHasContactsPermission) {
      return NavigationResult.redirect(
        '/unauthorized',
        'No contacts permission',
      );
    }
    
    return NavigationResult.allow('Contacts access granted');
  }
}
```

### Pattern 2: Conditional Route Access

```dart
class OnboardingGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (context.toRoute == '/' && !userCompletedOnboarding) {
      return NavigationResult.redirect(
        '/onboarding',
        'Onboarding not completed',
      );
    }
    return NavigationResult.allow('Route accessible');
  }
}
```

### Pattern 3: Deep Linking with Auth

```dart
class DeepLinkGuard implements NavigationMiddleware {
  @override
  NavigationResult process(NavigationContext context) {
    if (!context.hasToken && context.toRoute != '/login') {
      return NavigationResult.redirect(
        '/login',
        'Must login before accessing: ${context.toRoute}',
      );
    }
    return NavigationResult.allow('Deep link accessible');
  }
}
```

## Next Steps

1. **Add more routes** in `router_path.dart` and `router.dart`
2. **Create feature-specific guards** for each major feature
3. **Add logging/analytics** to `NavigationService.logNavigation()`
4. **Implement deep linking** with the existing middleware system
5. **Add error handling** for edge cases in navigation

## File Structure

```
lib/core/config/router/
├── router.dart                          # Main router with middleware
├── router_path.dart                     # Route definitions
├── navigation_service.dart              # Navigation service
├── models/
│   └── navigation_state.dart            # Navigation state model
├── middleware/
│   ├── navigation_middleware.dart       # Base middleware abstraction
│   ├── navigation_guards.dart           # Pre-built guards
│   └── navigation_pipeline.dart         # Pipeline for executing middleware
├── providers/
│   ├── navigation_provider.dart         # Navigation service provider
│   └── auth_state_provider.dart         # Authentication state providers
└── extensions/
    └── navigation_refresh_extension.dart # Navigation refresh helper
```

