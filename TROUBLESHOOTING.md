# Troubleshooting Guide

## Common Issues & Solutions

### Navigation Issues

#### Issue: User not redirecting to home after login
**Symptoms**: User logs in successfully, but stays on login page

**Solutions**:
1. Check that `refresh()` is being called in auth notifier
   ```dart
   ref.read(goRouterRefreshNotifierProvider).refresh();
   ```

2. Verify token is being saved correctly
   ```dart
   final token = ref.read(storageManagementProvider).accessToken.value;
   debugPrint('Token saved: $token');
   ```

3. Check that `AuthenticationStateGuard` is registered in pipeline
   ```dart
   // In navigation_provider.dart
   .add(AuthenticationStateGuard())
   ```

---

#### Issue: User can access protected routes without token
**Symptoms**: User can access /home without being logged in

**Solutions**:
1. Verify `AuthenticationGuard` is first in pipeline
   ```dart
   NavigationPipelineBuilder()
       .add(AuthenticationGuard())  // ← Must be first or early
       .build();
   ```

2. Check route is marked as protected in `RouteAccessGuard`
   ```dart
   RouteAccessGuard(
     protectedRoutes: {'/', '/dashboard'},  // ← Include your routes
     publicRoutes: {'/login'},
   )
   ```

3. Verify token is not being cached incorrectly
   ```dart
   // Force storage refresh
   await ref.refresh(storageManagementProvider);
   ```

---

#### Issue: Logged-in user can still access login page
**Symptoms**: User with token can navigate to /login

**Solutions**:
1. Check `AuthenticationStateGuard` is in pipeline
   ```dart
   .add(AuthenticationStateGuard())
   ```

2. Verify it's checking for token correctly
   ```dart
   if (context.hasToken && context.toRoute == Routers.login.path) {
     return NavigationResult.redirect(...)
   }
   ```

---

#### Issue: Infinite redirect loop
**Symptoms**: App keeps redirecting endlessly

**Solutions**:
1. Check middleware doesn't redirect to itself
   ```dart
   // ❌ Wrong
   if (condition) {
     return NavigationResult.redirect('/login', reason);
   }
   
   // ✅ Correct - redirect to different route
   ```

2. Verify pipeline stops after redirect
   ```dart
   // NavigationPipeline automatically stops at first redirect
   // This is handled internally - shouldn't happen
   ```

3. Check console logs to see the redirect chain
   ```
   Navigation Decision: NavigationResult(allow: false, redirect: /login, ...)
   Navigation Decision: NavigationResult(allow: false, redirect: /home, ...)
   ```

---

### Compilation Errors

#### Error: "The method 'refreshNavigation' isn't defined"
**Cause**: Extension not imported

**Solution**:
```dart
// Add import to file using WidgetRef
import 'package:riverpodlive/core/config/router/extensions/navigation_refresh_extension.dart';
```

Or use directly:
```dart
ref.read(goRouterRefreshNotifierProvider).refresh();
```

---

#### Error: "Undefined name 'navigationServiceProvider'"
**Cause**: Missing import

**Solution**:
```dart
import 'package:riverpodlive/core/config/router/providers/navigation_provider.dart';
```

---

#### Error: "The type argument(s) of the function 'read' can't be inferred"
**Cause**: Type inference issue

**Solution**:
```dart
// Wrong - TypeScript will struggle
final service = ref.read(navigationServiceProvider);

// Right - read inside the redirect callback
redirect: (context, state) {
  final navigationService = ref.read(navigationServiceProvider);
}
```

---

### Authentication Issues

#### Issue: Token not persisting after app restart
**Symptoms**: User logs in, closes app, reopens - logged out again

**Solutions**:
1. Verify `SharedPreferences` initialization
   ```dart
   // In bootstrap or main
   await storageManagement.init();
   ```

2. Check token is being saved with correct key
   ```dart
   accessToken.value = 'Bearer ${data.token}';
   ```

3. Verify no tokens are being cleared unintentionally
   ```dart
   // Check all calls to clearAccessToken()
   ```

---

#### Issue: Token expires but middleware doesn't redirect
**Symptoms**: Old token used after expiration

**Solutions**:
1. Add session timeout guard
   ```dart
   class SessionTimeoutGuard implements NavigationMiddleware {
     @override
     NavigationResult process(NavigationContext context) {
       if (isTokenExpired()) {
         return NavigationResult.redirect('/login', 'Session expired');
       }
       return NavigationResult.allow('Session valid');
     }
   }
   ```

2. Register in pipeline
   ```dart
   .add(SessionTimeoutGuard())
   ```

---

### State Management Issues

#### Issue: User state not updating across app
**Symptoms**: Token updated but UI doesn't reflect changes

**Solutions**:
1. Use `.watch()` instead of `.read()` for reactive updates
   ```dart
   // ❌ Won't update
   final isAuth = ref.read(isAuthenticatedProvider);
   
   // ✅ Will update
   final isAuth = ref.watch(isAuthenticatedProvider);
   ```

2. Ensure provider is watched in build method
   ```dart
   @override
   Widget build(BuildContext context, WidgetRef ref) {
     final isAuth = ref.watch(isAuthenticatedProvider);  // ← In build
   }
   ```

---

#### Issue: Multiple refresh calls not working
**Symptoms**: Calling refresh() multiple times doesn't trigger navigation

**Solutions**:
1. Ensure storage state actually changed
   ```dart
   debugPrint('Before: ${storage.accessToken.value}');
   // Make changes
   debugPrint('After: ${storage.accessToken.value}');
   ```

2. Call refresh once after all state updates
   ```dart
   // ❌ Multiple calls
   ref.read(goRouterRefreshNotifierProvider).refresh();
   ref.read(goRouterRefreshNotifierProvider).refresh();
   
   // ✅ Single call after updates
   updateAuthState();
   ref.read(goRouterRefreshNotifierProvider).refresh();
   ```

---

### Custom Middleware Issues

#### Issue: Custom middleware not being executed
**Symptoms**: Middleware logic never runs

**Solutions**:
1. Verify middleware is registered in pipeline
   ```dart
   final navigationPipelineProvider = Provider<NavigationPipeline>((ref) {
     return NavigationPipelineBuilder()
         .add(MyCustomGuard())  // ← Check it's here
         .build();
   });
   ```

2. Add debug print to middleware
   ```dart
   @override
   NavigationResult process(NavigationContext context) {
     debugPrint('MyGuard executed for route: ${context.toRoute}');
     // ...
   }
   ```

3. Check middleware order matters
   ```dart
   // If first middleware redirects, others won't run
   NavigationPipelineBuilder()
       .add(GuardThatAlwaysRedirects())  // ← Runs first
       .add(MyCustomGuard())  // ← Might not run
       .build();
   ```

---

#### Issue: Middleware condition always evaluates wrong
**Symptoms**: Guard logic seems inverted or not working

**Solutions**:
1. Add debug logging
   ```dart
   @override
   NavigationResult process(NavigationContext context) {
     debugPrint('hasToken: ${context.hasToken}');
     debugPrint('toRoute: ${context.toRoute}');
     debugPrint('Condition: ${condition}');
     
     if (condition) {
       return NavigationResult.redirect(...);
     }
   }
   ```

2. Check context values in GoRouter
   ```dart
   redirect: (context, state) {
     debugPrint('currentRoute: ${state.matchedLocation}');
     debugPrint('hasToken: ${hasToken}');
   }
   ```

---

### Deep Linking Issues

#### Issue: Deep link redirects to login even with token
**Symptoms**: User clicks link from email, gets redirected to login

**Solutions**:
1. Add DeepLinkGuard (see examples.dart)
2. Ensure token is loaded before route evaluation
3. Handle async token loading

---

### Testing Issues

#### Issue: Middleware tests always pass
**Symptoms**: Can't verify middleware is working

**Solutions**:
```dart
// Example test
test('AuthenticationGuard redirects without token', () {
  final guard = AuthenticationGuard();
  final context = NavigationContext(
    fromRoute: null,
    toRoute: '/',
    hasToken: false,  // Key: no token
    router: mockState,
  );

  final result = guard.process(context);

  expect(result.redirectPath, equals('/login'));
  expect(result.shouldAllow, isFalse);
  expect(result.reason, contains('authenticated'));
});
```

---

## Debugging Techniques

### 1. Add Debug Prints
```dart
// In navigation middleware
@override
NavigationResult process(NavigationContext context) {
  debugPrint('=== Navigation Check ===');
  debugPrint('From: ${context.fromRoute}');
  debugPrint('To: ${context.toRoute}');
  debugPrint('HasToken: ${context.hasToken}');
  debugPrint('Result: ...');
  return result;
}
```

### 2. Check Navigation Logs
```dart
// In navigationService.logNavigation()
// All decisions are logged here
// Check device console or logcat
```

### 3. Verify State
```dart
// In auth notifier
Future<void> login(...) async {
  debugPrint('Token before: ${storage.accessToken.value}');
  // ... login logic
  debugPrint('Token after: ${storage.accessToken.value}');
  refresh();
}
```

### 4. Use DevTools
```bash
flutter pub global activate devtools
flutter pub global run devtools

# In another terminal
flutter run --observatory-port=8181
```

Then navigate to http://localhost:9101 to inspect Riverpod state.

---

## Performance Debugging

### Issue: Slow navigation
**Solutions**:
1. Check middleware complexity
   ```dart
   // ❌ Slow - fetches data
   @override
   NavigationResult process(NavigationContext context) {
     final user = await fetchUserData();  // Async!
     ...
   }
   
   // ✅ Fast - uses cached state
   @override
   NavigationResult process(NavigationContext context) {
     final isAdmin = context.hasToken && isUserAdmin;  // Sync
     ...
   }
   ```

2. Profile middleware execution time
   ```dart
   final start = DateTime.now();
   final result = middleware.process(context);
   final duration = DateTime.now().difference(start);
   debugPrint('Middleware took ${duration.inMilliseconds}ms');
   ```

---

## Common Pitfalls

### ❌ Pitfall 1: Using read() instead of watch()
```dart
// ❌ Wrong - won't update
final isAuth = ref.read(isAuthenticatedProvider);

// ✅ Correct - will update
final isAuth = ref.watch(isAuthenticatedProvider);
```

### ❌ Pitfall 2: Forgetting to call refresh()
```dart
// ❌ Wrong - state changed but navigation not triggered
storage.accessToken.value = 'new-token';

// ✅ Correct
storage.accessToken.value = 'new-token';
ref.read(goRouterRefreshNotifierProvider).refresh();
```

### ❌ Pitfall 3: Middleware with side effects
```dart
// ❌ Wrong - middleware shouldn't have side effects
@override
NavigationResult process(NavigationContext context) {
  analytics.log('navigated');  // Side effect!
  return allow();
}

// ✅ Correct - pure logic
@override
NavigationResult process(NavigationContext context) {
  if (shouldBlock) {
    return deny('reason');
  }
  return allow('allowed');
}
```

### ❌ Pitfall 4: Hardcoded route paths
```dart
// ❌ Wrong
if (context.toRoute == '/dashboard') {
  return redirect('/login', 'reason');
}

// ✅ Correct
if (context.toRoute == Routers.dashboard.path) {
  return redirect(Routers.login.path, 'reason');
}
```

---

## Getting Help

### Step-by-step debugging:
1. Add debug prints at each step
2. Check GoRouter devtools output
3. Verify middleware is registered
4. Test middleware in isolation
5. Check state with ref.watch()
6. Verify refresh() is called

### Files to check:
- `lib/core/config/router/router.dart` - Main integration
- `lib/core/config/router/providers/navigation_provider.dart` - Pipeline setup
- `lib/features/auth/presentation/providers/auth_notifier.dart` - Auth logic

### Documentation to review:
- `MIDDLEWARE_GUIDE.md` - Full explanation
- `ARCHITECTURE_DIAGRAM.md` - Visual flow
- `QUICK_REFERENCE.md` - Common tasks
- `middleware/examples.dart` - Real examples

---

## Still Stuck?

1. Check that all files are in correct locations
2. Verify imports are correct
3. Run `flutter clean && flutter pub get`
4. Run `flutter pub run build_runner build`
5. Restart your IDE
6. Check console for any warnings/errors
7. Review MIDDLEWARE_GUIDE.md again

