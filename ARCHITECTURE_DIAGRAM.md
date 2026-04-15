# Architecture Diagram

## Navigation System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        App Layer                                 │
│                                                                  │
│  ┌──────────────────┐        ┌──────────────────┐               │
│  │   LoginPage      │        │   HomePage       │               │
│  │                  │        │                  │               │
│  │  ┌────────────┐  │        │  ┌────────────┐  │               │
│  │  │ onLogin()  │  │        │  │ onLogout() │  │               │
│  │  └──────┬─────┘  │        │  └──────┬─────┘  │               │
│  └─────────┼────────┘        └─────────┼────────┘               │
│            │                            │                        │
│            └────────────────┬───────────┘                        │
│                             │                                    │
└─────────────────────────────┼────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Business Logic Layer                          │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │              AuthNotifier (Provider)                     │   │
│  │                                                          │   │
│  │  login(request)    ┬──► Save token to storage          │   │
│  │     │              │                                    │   │
│  │     └──────┬───────┴──► refresh() ──────────┐           │   │
│  │            │                                │           │   │
│  │  logout()  ├──► Clear token from storage   │           │   │
│  │     │      │                                │           │   │
│  │     └──────┴──► refresh() ──────────┐       │           │   │
│  │                                     │       │           │   │
│  └─────────────────────────────────────┼───────┼───────────┘   │
│                                        │       │                │
│  ┌─────────────────────────────────┐   │       │                │
│  │  Authentication State Provider   │   │       │                │
│  │  • isAuthenticatedProvider       │   │       │                │
│  │  • accessTokenProvider           │   │       │                │
│  │  • authenticationStateProvider   │   │       │                │
│  └─────────────────────────────────┘   │       │                │
│                                        │       │                │
└─────────────────────────────────────────┼───────┼────────────────┘
                                         │       │
                                         │       │ refresh() called
                                         │       │
                                         ▼       ▼
┌─────────────────────────────────────────────────────────────────┐
│                      Navigation Layer                            │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │           GoRouter (appRouterProvider)                  │   │
│  │                                                          │   │
│  │   redirect: (context, state) {                          │   │
│  │     ┌─────────────────────────────────────┐            │   │
│  │     │ Get current auth status             │            │   │
│  │     │ Get requested route                 │            │   │
│  │     └──────────────┬──────────────────────┘            │   │
│  │                    │                                    │   │
│  │                    ▼                                    │   │
│  │     ┌──────────────────────────────────┐              │   │
│  │     │  NavigationService               │              │   │
│  │     │  .validateNavigation()           │              │   │
│  │     └──────────────┬───────────────────┘              │   │
│  │                    │                                    │   │
│  │                    ▼                                    │   │
│  │     ┌──────────────────────────────────┐              │   │
│  │     │  NavigationPipeline              │              │   │
│  │     │  .execute(context)               │              │   │
│  │     └──────────────┬───────────────────┘              │   │
│  │                    │                                    │   │
│  │                    ▼                                    │   │
│  │     ┌──────────────────────────────────┐              │   │
│  │     │  Run Middleware in Sequence:     │              │   │
│  │     │  1. AuthenticationGuard          │              │   │
│  │     │  2. AuthenticationStateGuard     │              │   │
│  │     │  3. RouteAccessGuard             │              │   │
│  │     │  (Custom middleware...)          │              │   │
│  │     └──────────────┬───────────────────┘              │   │
│  │                    │                                    │   │
│  │                    ▼                                    │   │
│  │     ┌──────────────────────────────────┐              │   │
│  │     │  NavigationResult                │              │   │
│  │     │  • allow                         │              │   │
│  │     │  • deny                          │              │   │
│  │     │  • redirect(path, reason)       │              │   │
│  │     └──────────────┬───────────────────┘              │   │
│  │                    │                                    │   │
│  │                    ▼                                    │   │
│  │     Return redirectPath (or null)                      │   │
│  │   }                                                    │   │
│  │                                                          │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                     Route Navigation                             │
│                                                                  │
│  if (redirectPath != null) {                                    │
│      GoRouter.go(redirectPath)  ──► Navigate to new route      │
│  } else {                                                        │
│      Allow current navigation to proceed                        │
│  }                                                               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Middleware Pipeline Execution Flow

```
┌────────────────────────────────────────────────┐
│ NavigationContext                              │
│ • fromRoute: String?                           │
│ • toRoute: String (e.g., "/dashboard")        │
│ • hasToken: bool                              │
│ • router: GoRouterState                       │
└────────────┬─────────────────────────────────┘
             │
             ▼
┌────────────────────────────────────────────────┐
│ NavigationPipeline.execute(context)            │
└────────────┬─────────────────────────────────┘
             │
             ▼
┌────────────────────────────────────────────────┐
│ Middleware #1: AuthenticationGuard             │
│                                                │
│ if (!hasToken && toRoute != '/login') {       │
│   return redirect('/login', reason)            │
│ }                                              │
│ return allow()                                 │
│                                                │
│ Result: ✓ ALLOW or ✗ REDIRECT                │
└────────────┬─────────────────────────────────┘
             │
             ├─ If DENY or REDIRECT: STOP
             │
             ▼
┌────────────────────────────────────────────────┐
│ Middleware #2: AuthenticationStateGuard        │
│                                                │
│ if (hasToken && toRoute == '/login') {        │
│   return redirect('/home', reason)             │
│ }                                              │
│ return allow()                                 │
│                                                │
│ Result: ✓ ALLOW or ✗ REDIRECT                │
└────────────┬─────────────────────────────────┘
             │
             ├─ If DENY or REDIRECT: STOP
             │
             ▼
┌────────────────────────────────────────────────┐
│ Middleware #3: RouteAccessGuard                │
│                                                │
│ if (protectedRoutes.contains(toRoute)         │
│     && !hasToken) {                           │
│   return redirect('/login', reason)            │
│ }                                              │
│ return allow()                                 │
│                                                │
│ Result: ✓ ALLOW or ✗ REDIRECT                │
└────────────┬─────────────────────────────────┘
             │
             ├─ If DENY or REDIRECT: STOP
             │
             ▼
┌────────────────────────────────────────────────┐
│ All middleware passed                          │
│ Return: NavigationResult.allow()              │
└────────────┬─────────────────────────────────┘
             │
             ▼
┌────────────────────────────────────────────────┐
│ GoRouter applies result                        │
│ • redirectPath == null: Allow navigation      │
│ • redirectPath != null: Redirect              │
└────────────────────────────────────────────────┘
```

## State Transitions

```
Initial State
     │
     ├─ No Token, No Session
     │  └─ Can only access: /login
     │     Protected routes redirect to /login
     │
     ▼
User Logs In
     │
     ├─ Token Saved to Storage
     │  └─ Authentication State Updates
     │
     ├─ refresh() Called
     │  └─ GoRouter Re-evaluates Redirect
     │
     ├─ Middleware Chain Runs
     │  ├─ AuthenticationGuard ✓ (has token)
     │  ├─ AuthenticationStateGuard ✓ (not on login)
     │  └─ RouteAccessGuard ✓ (can access home)
     │
     ▼
Authenticated State
     │
     ├─ Has Token, Active Session
     │  └─ Can access: /home, /dashboard, etc.
     │     Cannot access: /login (redirected to /home)
     │
     ▼
User Logs Out
     │
     ├─ Token Cleared from Storage
     │  └─ Authentication State Updates
     │
     ├─ refresh() Called
     │  └─ GoRouter Re-evaluates Redirect
     │
     ├─ Middleware Chain Runs
     │  └─ AuthenticationGuard ✗ (no token, on home)
     │     Redirects to /login
     │
     ▼
Initial State (cycle repeats)
```

## Data Flow Summary

```
User Action
    │
    ├─ UI Event (button tap)
    │
    ├─ Provider Update
    │    ├─ Login: Save token
    │    └─ Logout: Clear token
    │
    ├─ Refresh Navigation
    │    └─ notify listeners
    │
    ├─ GoRouter Redirect
    │    ├─ Read auth state
    │    ├─ Validate via middleware
    │    └─ Return redirect path or null
    │
    └─ Route Change
         └─ UI updates to new route
```

## File Dependencies

```
app.dart
    │
    └─► router.dart
         │
         ├─► navigation_service.dart
         │    │
         │    └─► middleware/
         │         ├─ navigation_middleware.dart
         │         ├─ navigation_guards.dart
         │         └─ navigation_pipeline.dart
         │
         ├─► providers/
         │    ├─ navigation_provider.dart
         │    └─ auth_state_provider.dart
         │
         └─► auth_notifier.dart
              │
              └─► router.dart (circular ref OK - provider)
                   └─► refresh notification
```

This architecture ensures:
- ✅ Separation of concerns
- ✅ Clear data flow
- ✅ Easy to test
- ✅ Easy to extend
- ✅ No scattered logic

