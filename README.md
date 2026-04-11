# Riverpod Mobile Template

A Flutter mobile template built with **Clean Architecture** using **Riverpod** state management and **Isar** local database.

Designed for teams that want a scalable, production-ready foundation with clear layer boundaries, code generation, multi-flavor support, and robust error/network handling.

---

## Table of Contents

- [Tech Stack](#tech-stack)
- [Project Structure Overview](#project-structure-overview)
- [Detailed File Descriptions](#detailed-file-descriptions)
  - [Entry Points](#entry-points)
  - [lib/app – App Shell Layer](#libapp--app-shell-layer)
  - [lib/core – Shared Infrastructure](#libcore--shared-infrastructure)
  - [lib/features/contacts – Contacts Feature](#libfeaturescontacts--contacts-feature)
  - [lib/features/main – Main Shell Feature](#libfeaturesmain--main-shell-feature)
  - [lib/features/auth – Auth Feature](#libfeaturesauth--auth-feature)
- [Data Flow](#data-flow)
- [Startup Sequence](#startup-sequence)
- [Setup](#setup)
- [Code Generation](#code-generation)
- [Platform Channels (Pigeon)](#platform-channels-pigeon)
- [Localization](#localization)
- [Running the App](#running-the-app)
- [Building the App](#building-the-app)
- [Platform Permissions](#platform-permissions)
- [Notes](#notes)

---

## Tech Stack

| Category | Package |
|---|---|
| State Management | `flutter_riverpod`, `hooks_riverpod`, `riverpod_annotation`, `riverpod_generator` |
| Local Database | `isar_community`, `isar_community_flutter_libs`, `isar_community_generator` |
| HTTP Client | `dio`, `retrofit`, `retrofit_generator`, `awesome_dio_interceptor` |
| Navigation | `go_router` |
| Code Generation | `freezed`, `freezed_annotation`, `json_serializable`, `json_annotation`, `build_runner` |
| Storage | `shared_preferences` |
| Localization | Flutter `l10n` (ARB-based, Vietnamese) |
| Responsive UI | `flutter_screenutil` |
| SVG | `flutter_svg` |
| Logging | Custom isolate-based file logger |
| Hooks | `flutter_hooks` |
| Debugging | `requests_inspector` |
| Proxy Detection | `detect_proxy_setting` |
| Permissions | `permission_handler` |
| DI Container | `get_it` (available, not wired by default) |

---

## Project Structure Overview

```
lib/
├── main_development.dart       # Entry point – dev flavor
├── main_staging.dart           # Entry point – staging flavor
├── main_production.dart        # Entry point – production flavor
│
├── app/                        # App shell (MaterialApp, global state)
│   ├── data/                   # (scaffold – reserved for app-level data)
│   ├── domain/                 # (scaffold – reserved for app-level domain)
│   └── presentation/
│       ├── pages/
│       │   └── app.dart        # Root widget (MaterialApp.router)
│       └── providers/
│           ├── app_notifier.dart
│           ├── app_state.dart
│           └── *.g / *.freezed # Generated files
│
├── core/                       # Shared infrastructure
│   ├── api_end_point.dart      # API base URLs + endpoint constants
│   ├── config/
│   │   ├── lang/l10n/          # Localization (ARB + generated)
│   │   └── router/             # GoRouter setup + path enum
│   ├── constants/              # App-wide constants
│   ├── data/
│   │   ├── datasources/prefs/  # SharedPreferences abstraction
│   │   └── repositories/       # BaseApiRepository
│   ├── di/
│   │   ├── bootstrap.dart      # App initialization + Riverpod root
│   │   ├── http_overrides_impl.dart
│   │   └── providers/          # Core Riverpod providers
│   ├── error/                  # Result<T> sealed class + Pagination
│   ├── extensions/             # BuildContext & Result extensions
│   ├── helpers/                # Utils (UUID, name format, permissions)
│   └── presentation/
│       ├── pages/base_page.dart
│       └── widgets/bottom_navigation_bar_widget.dart
│
└── features/
    ├── contacts/               # Contacts feature (fully implemented)
    │   ├── constants/
    │   ├── data/
    │   │   ├── datasources/local/
    │   │   ├── datasources/remotes/
    │   │   ├── models/
    │   │   ├── repositories/
    │   │   ├── requests/
    │   │   └── responses/
    │   ├── domain/
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   ├── enums/
    │   └── presentation/
    │       ├── pages/
    │       └── providers/
    ├── main/                   # Main shell (tab navigation)
    └── auth/                   # Auth feature (fully implemented)
        ├── data/
        │   ├── datasources/remotes/  # AuthRemote (Retrofit) + provider wiring
        │   ├── repositories/         # AuthRemoteRepositoryImpl
        │   ├── requests/             # LoginRequest (Freezed + JSON)
        │   └── responses/            # LoginResponse (Freezed + JSON)
        ├── domain/
        │   ├── repositories/         # AuthRemoteRepository (abstract contract)
        │   └── usecases/             # AuthRemoteUsecase
        ├── enums/
        │   └── auth_enum.dart        # AuthAction discriminator enum
        └── presentation/
            ├── pages/                # LoginPage
            └── providers/            # AuthNotifier, AuthState
```

---

## Detailed File Descriptions

### Entry Points

#### `lib/main_development.dart`
App entry point for the **development** flavor.
- Sets `ApiEndpoint.env = Flavor.dev` → uses the dev base URL.
- Wraps the app with `RequestsInspector` (network debug overlay).
- Calls `bootstrap()` to initialize all services before running the app.

#### `lib/main_staging.dart`
Same structure as `main_development.dart` but sets `Flavor.stg` and connects to the staging API.

#### `lib/main_production.dart`
Production entry point. Sets `Flavor.production`. The `AppRiverpodObserver` change log is automatically disabled in production builds.

---

### `lib/app` – App Shell Layer

#### `lib/app/presentation/pages/app.dart`
Root widget of the application.
- `App` → thin `ConsumerWidget` that delegates to `AppView`.
- `AppView` → wraps the app with `ScreenUtilInit` (responsive scaling based on a 375×812 design size), then renders `MaterialApp.router` with:
  - `appRouter` from `go_router`
  - Vietnamese locale fixed (`LocaleConstants.vietnamese`)
  - Material 3 theme with custom font family (`Arial`) and `NavigationBar` styling

#### `lib/app/presentation/providers/app_state.dart`
Freezed immutable state class for global app state:

| Field | Type | Description |
|---|---|---|
| `appTitle` | `String?` | Title shown in the AppBar |
| `isUnauthorized` | `bool?` | Triggers logout/auth redirect on 401 |
| `isNoNetwork` | `bool?` | Signals no network connectivity |
| `isTimeOut` | `bool?` | Signals API timeout |

#### `lib/app/presentation/providers/app_notifier.dart`
Riverpod `@riverpod` notifier managing global `AppState`.
- `setAppTitle(value)` – updates AppBar title
- `setUnauthorized(value)` – called by `BaseApiRepository` on HTTP 401
- `setNoNetwork(value)` – called on connection error
- `setTimeout(value)` – called on timeout
- `reset()` – clears all flags

---

### `lib/core` – Shared Infrastructure

#### `lib/core/api_end_point.dart`
Centralizes all API configuration:
- `ApiEndpoint.env` – current flavor (set at startup)
- `getBaseURL()` – returns the correct base URL per flavor:
  - Dev: `dev-api.com`
  - Staging: `stag-api.com`
  - Production: `prod-api.com`
- API path constants: `apiLogin`, `apiGetListContact`

---

#### `lib/core/config/lang/l10n/`

| File/Folder | Description |
|---|---|
| `arb/app_vi.arb` | Vietnamese ARB translation resource file |
| `gen/` | Auto-generated localization Dart files (do not edit manually) |
| `l10n.dart` | Convenience extension `context.l10n` to access `AppLocalizations` from `BuildContext` |

#### `lib/core/config/router/router.dart`
GoRouter configuration (Riverpod `Provider<GoRouter>`):
- `NavigationService.navigatorKey` – global `NavigatorKey` for programmatic navigation
- `GoRouterRefreshNotifier` – `ChangeNotifier` passed as `refreshListenable`; call `refresh()` after any auth-state change (login/logout) to force GoRouter to re-evaluate the redirect
- `goRouterRefreshNotifierProvider` – exposes the notifier to the rest of the app
- `appRouterProvider` – `Provider<GoRouter>` with:
  - **`redirect`**: checks `storageManagement.accessToken.value` on every navigation
    - No token → redirect to `/login`
    - Has token + on `/login` → redirect to `/` (home)
  - Routes: `/` → `MainPage`, `/login` → `LoginPage`

#### `lib/core/config/router/router_path.dart`
Enum `Routers` with typed path values:
- `Routers.home` → `'/'`
- `Routers.login` → `'/login'`

---

#### `lib/core/constants/app_colors_constants.dart`
Color palette constants:

| Constant | Hex | Usage |
|---|---|---|
| `primary` | `#0175E4` | Buttons, active icons |
| `textColor` | `#1A1A1A` | Main text |
| `grey` | `#9E9E9E` | Placeholder, shadow |
| `white` | `#FFFFFF` | Background |
| `tabBarBackground` | `#E1F5FF` | Selected tab background |

#### `lib/core/constants/app_images_constants.dart`
Asset path constants for SVG tab bar icons (contact and group tabs, normal and selected states).

#### `lib/core/constants/device_constants.dart`
Base design dimensions for `flutter_screenutil`:
- `designDeviceWidth`: `375.0`
- `designDeviceHeight`: `812.0`

#### `lib/core/constants/locale_constants.dart`
Locale constants: `LangCode.vi`, `LangCode.en` and `LocaleConstants.vietnamese` / `english`.

#### `lib/core/constants/pref_constants.dart`
SharedPreferences key definitions via `PrefKeys`:
- `accessToken` → key `'access_token'`

#### `lib/core/constants/settings_constants.dart`
Runtime configuration constants:

| Constant | Value | Description |
|---|---|---|
| `timeOutConnection` | `30` | API timeout in seconds |
| `minCharacterSuggest` | `3` | Minimum characters for search suggestions |
| `logFileName` | `'app_log'` | Base log file name |
| `logDirName` | `'logs'` | Log directory name |
| `maxFileSizeLogInBytes` | `5 MB` | Max size before log file rotation |
| `enableApiProxy` | `bool.fromEnvironment` | Controlled via `--dart-define=ENABLE_API_PROXY=true` |

---

#### `lib/core/data/datasources/prefs/pref_value.dart`
Generic `PrefValue<T>` wrapper around `SharedPreferences`. Supports `bool`, `String`, `int`, `double`, `List<String>`. Provides get/set via a `.value` property.

#### `lib/core/data/datasources/prefs/pref_value_factory.dart`
Factory for creating typed `PrefValue<T>` instances:
- `boolPref`, `intPref`, `doublePref`, `stringPref`, `listStringPref`

#### `lib/core/data/repositories/base_api_repository.dart`
Abstract base class for all remote repository implementations. Provides `getStateOf<T>()`:
- Applies proxy settings when `enableApiProxy` is `true`
- Wraps Retrofit calls with a manual timeout race
- Maps HTTP 200/201 responses to `Result.success`
- Handles `DioException`:
  - `401` → clears token + sets `isUnauthorized` on `appProvider`
  - Timeout → sets `isTimeOut` on `appProvider`
  - Connection error → sets `isNoNetwork` on `appProvider`
- Logs all errors via `logManagementProvider`

---

#### `lib/core/di/bootstrap.dart`
App bootstrapper. Key responsibilities:
- `Flavor` enum: `dev`, `stg`, `production`
- `AppRiverpodObserver` – logs all provider state changes and errors (disabled in production)
- `bootstrap()` function:
  1. Registers global Flutter error handler
  2. `WidgetsFlutterBinding.ensureInitialized()`
  3. Sets system UI overlays and forces portrait orientation
  4. Wraps the app in `ProviderScope` with `AppRiverpodObserver`
  5. Watches `startupProvider` → shows `CircularProgressIndicator` while loading, error message on failure, then renders the actual app widget

#### `lib/core/di/http_overrides_impl.dart`
`HttpOverrides` implementation for proxy and certificate support:
- Reads system proxy settings via `detect_proxy_setting`
- Routes HTTP traffic through a configured proxy when detected
- Disables certificate validation (useful for dev/corporate proxy environments)

#### `lib/core/di/providers/startup_provider.dart`
`FutureProvider<void>` that sequences all startup tasks in order:
1. `logManagementProvider.init()` – starts the log isolate worker
2. `databaseLocalManagementProvider.openDatabase()` – opens Isar database
3. `storageManagementProvider.init()` – loads SharedPreferences
4. `Utils.getContactPermission()` – requests contacts permission from the OS
5. `ref.read(dioProvider)` – warms up the Dio HTTP client instance

#### `lib/core/di/providers/database_local_management_provider.dart`
Singleton `DatabaseLocalManagement` managing the Isar database lifecycle:
- Registered schemas: `ContactModelSchema` (add new schemas here when creating new Isar collections)
- `openDatabase()` – opens Isar at the app documents directory
- `close()` – closes and deletes the DB from disk
- `reset()` – close + reopen (used on logout)

#### `lib/core/di/providers/dio_provider.dart`
Riverpod `Provider<Dio>` configuring the global HTTP client:
- Base URL from `ApiEndpoint.getBaseURL()`
- Interceptors: `AwesomeDioInterceptor` (pretty logging), `RequestsInspectorInterceptor` (debug overlay)
- 30-second connect/receive timeout
- Injects `Authorization: Bearer <token>` header automatically on every request

#### `lib/core/di/providers/log_management_provider.dart`
Advanced file logger using a **dedicated Dart isolate** (`log_io_worker`) to avoid blocking the UI thread:
- Writes timestamped entries to `.txt` files under `<documents>/logs/`
- **Daily rotation**: creates a new file per day (`app_log_YYYY-MM-DD.txt`)
- **Size rotation**: splits into indexed files when a file exceeds 5 MB
- **Auto-cleanup**: keeps only the 30 most recent log files, deletes older ones
- Public API: `init()`, `log(message)`, `dispose()`

#### `lib/core/di/providers/storage_management_provider.dart`
`StorageManagement` – wraps `SharedPreferences` with typed `PrefValue` fields:
- `accessToken` – `PrefValue<String>` for the Bearer token
- `clearAccessToken()` – sets token to empty string
- `clearDataWhenLogout()` – clears token + resets Isar database

---

#### `lib/core/error/result.dart`
Sealed `Result<T>` class (Freezed) – the universal return type for all repository operations:
- `Result.success({data, message, pagination})` – successful response with optional pagination
- `Result.error({message, errorCode})` – failed response
- `Pagination` – metadata: `currentPage`, `pageSize`, `totalElements`, `totalPages`, `hasNext`, `hasPrevious`, `first`, `last`
- `Result.fromJson()` – smart deserialization: infers success/error from JSON shape (checks for `data` key and `status` field)

#### `lib/core/extensions/context_extension.dart`
`BuildContextExt` extension on `BuildContext`:
- `context.textTheme` → shortcut for `Theme.of(context).textTheme`
- `context.size` → shortcut for `MediaQuery.of(context).size`

#### `lib/core/extensions/result_extension.dart`
`ResultExtension<T>` extension on `Result<T>`:
- `fold(onSuccess, onError)` – functional-style handler to avoid explicit `when()` in use sites

---

#### `lib/core/helpers/utils.dart`
Static utility class:
- `getUUID()` – generates a UUID v4 string
- `getEmployeeName(contact)` – returns a formatted display name, falls back to `'-'`
- `formatEmployeeName(firstName, lastName)` – formats as `"lastName firstName"`, handles nulls/empty values
- `getContactPermission()` – checks and requests `Permission.contacts` if not already granted

---

#### `lib/core/presentation/pages/base_page.dart`
`BasePage` – base class for all feature pages (extends `HookConsumerWidget`):
- `showSnackBar(context, message, {isError})` – displays a styled green (success) or red (error) snackbar

#### `lib/core/presentation/widgets/bottom_navigation_bar_widget.dart`
Shared `BottomNavigationBarWidget` (used in `MainPage`):
- Renders a Material 3 `NavigationBar` with two tabs: **Contact** and **Group**
- SVG icons from `AppImagesConstants`, highlighted with `tabBarBackground` color when selected
- On tab change: updates `mainProvider` tab state and syncs `appProvider` app title

---

### `lib/features/contacts` – Contacts Feature

#### Constants

| File | Description |
|---|---|
| `constants/contact_status_constant.dart` | Integer status codes: `active = 1`, `deleted = 0` |

---

#### Data Layer – Models

##### `data/models/contact_model.dart`
Isar `@collection` class – the persisted schema for contacts in the local database:
- `id` – Isar auto-increment primary key
- `idServer` – server-assigned ID, indexed with `IndexType.hash` for fast upsert deduplication
- `status` – active/deleted numeric flag, indexed with `IndexType.value`
- All other fields: `phone`, `firstName`, `lastName`, `companyName`, `email`, `avatarUrl`, `photo`, etc.
- `phones`, `emails` – stored as JSON strings (serialized `List<PhoneInfo>` / `List<EmailInfo>`)

---

#### Data Layer – Datasources

##### `data/datasources/local/contact_local.dart`
Abstract interface `ContactLocal` + implementation `ContactLocalImpl`:
- `upsertContact(ContactModel)` – inserts or updates a single contact; uses `_resolveId` to match existing records by `idServer`
- `upsertContacts(List<ContactModel>)` – bulk upsert inside a single Isar write transaction
- `getAllContact()` – queries all active (`status == 1`) contacts

##### `data/datasources/local/contact_local_provider.dart`
Riverpod DI wiring for the local data source layer:
- `contactLocalProvider` → `ContactLocalImpl(isar)` (throws if Isar not initialized)
- `contactLocalRepositoryProvider` → `ContactLocalRepositoryImpl`
- `contactLocalUseCaseProvider` → `ContactLocalUseCase`

##### `data/datasources/remotes/contact_remote.dart`
Retrofit `@RestApi()` abstract class:
- `getListContact(@Body() request)` → `POST /api/mobile/v1/contacts/accessible`
- Returns `HttpResponse<Result<GetListContactResponse>>`

##### `data/datasources/remotes/contact_remote_provider.dart`
Riverpod DI wiring for the remote data source layer:
- `contactRemoteProvider` → `ContactRemote(dio)`
- `contactRemoteRepositoryProvider` → `ContactRemoteRepositoryImpl`
- `contactRemoteUseCaseProvider` → `ContactRemoteUseCase`

---

#### Data Layer – Requests & Responses

##### `data/requests/get_list_contact_request.dart`
Freezed request body for the contact list API:
- `since` – optional ISO 8601 timestamp for incremental sync (fetch only changes since last sync)

##### `data/responses/get_list_contact_response.dart`
Freezed response model:
- `contacts` – `List<ContactEntity>` returned from the API
- `syncTimestamp` – timestamp of the current sync
- `nextSyncTimestamp` – timestamp to pass as `since` in the next request

---

#### Data Layer – Repository Implementations

##### `data/repositories/contact_local_repository_impl.dart`
Implements `ContactLocalRepository`:
- `_toModel(ContactEntity)` – maps domain entity to Isar model; resolves `contactType` from `phoneCode`/`type`, generates `idServer` (type + identifier) and `idLocal` (UUID if missing), encodes phone/email lists to JSON strings
- `_toEntity(ContactModel)` – reverse mapping, decodes JSON phone/email strings back to typed objects
- Delegates `upsertContact`, `upsertContacts`, `getAllContact` to `ContactLocal`

##### `data/repositories/contact_remote_repository_impl.dart`
Extends `BaseApiRepository`, implements `ContactRemoteRepository`:
- `getListContact(request)` – executes the API call via `getStateOf<GetListContactResponse>()`, inheriting all timeout, logging, and error-mapping logic from `BaseApiRepository`

---

#### Domain Layer

##### `domain/entities/contact_entity.dart`
Freezed immutable entity `ContactEntity` with all contact fields. Also defines:
- `PhoneInfo` – `{ code, type, number }`
- `EmailInfo` – `{ type, address }`

##### `domain/repositories/contact_local_repository.dart`
Abstract contract defining the local data operations:
- `upsertContact`, `upsertContacts`, `getAllContact`

##### `domain/repositories/contact_remote_repository.dart`
Abstract contract defining the remote data operations:
- `getListContact(GetListContactRequest)`

##### `domain/usecases/contact_local_usecase.dart`
Thin use case class wrapping `ContactLocalRepository`. Provides:
- `upsertContact`, `upsertContacts`, `getAllContact`

##### `domain/usecases/contact_remote_usecase.dart`
Thin use case class wrapping `ContactRemoteRepository`. Provides:
- `getListContact(request)`

---

#### Presentation Layer

##### `presentation/providers/contact_state.dart`
Freezed state `ContactState`:
- `contacts` – current list of `ContactEntity` shown in the UI
- `apiResultMessage` – message from the last API response
- `updateDatabaseFinish` – `true` after the local DB sync completes

##### `presentation/providers/contact_notifier.dart`
`@riverpod` async notifier `ContactNotifier` (provider name: `contactProvider`):
- `build()` → returns initial empty `ContactState`
- `getAllContactFromApi(request)` – fetches from API → upserts all contacts to Isar → reads back from Isar → emits updated `ContactState`
- `getAllContact()` – reads from local Isar only (used on pull-to-refresh)
- `getContactSoftDelete(contacts)` – identifies soft-deleted contacts from the API list

##### `presentation/pages/contact_page.dart`
`ContactPage` / `ContactPageView` (extends `BasePage`):
- On first mount (`useEffect`): sets AppBar title, injects Bearer token (dev placeholder), triggers `getAllContactFromApi`
- Renders `CircularProgressIndicator` while loading, a scrollable `ListView` of contacts on success, or an error message on failure
- Pull-to-refresh triggers `getAllContact` (local-only read)
- Each list item displays the formatted employee name via `Utils.getEmployeeName`

---

### `lib/features/main` – Main Shell Feature

##### `presentation/providers/main_state.dart`
Freezed state `MainState`:
- `tab` – `MainTab` enum: `{ contact, group }`, default `contact`

##### `presentation/providers/main_notifier.dart`
`@riverpod` notifier `MainNotifier` (provider name: `mainProvider`):
- `setTab(tab)` – switches the active bottom navigation tab
- `reset()` – returns to the default tab

##### `presentation/pages/main_page.dart`
`MainPage` / `MainPageView`:
- Renders a `Scaffold` with:
  - `AppBar` showing the current title from `appProvider.appTitle`
  - Body switched by `currentTab.index`: index `0` → `ContactPage`, index `1` → placeholder `Text('Page 2')`
  - `BottomNavigationBarWidget` for tab switching
- Sets `SystemUiOverlayStyle.dark` for status bar icons via `AnnotatedRegion`

---

### `lib/features/auth` – Auth Feature

#### Enums

##### `enums/auth_enum.dart`
`AuthAction` enum – discriminator added to `AuthState` to identify which notifier action last updated the state. Used in `ref.listen` to filter reactions per-action:
- `AuthAction.none` – initial/default state
- `AuthAction.login` – state was updated by the `login()` call

---

#### Data Layer – Datasources

##### `data/datasources/remotes/auth_remote.dart`
Retrofit `@RestApi()` abstract class:
- `login(@Body() LoginRequest)` → `POST /api/mobile/v1/auth/login`
- Returns `HttpResponse<Result<LoginResponse>>`

##### `data/datasources/remotes/auth_remote_provider.dart`
Riverpod DI wiring for the auth remote layer:
- `authRemoteProvider` → `AuthRemote(dio)`
- `authRemoteRepositoryProvider` → `AuthRemoteRepositoryImpl`
- `authRemoteUseCaseProvider` → `AuthRemoteUsecase`

---

#### Data Layer – Requests & Responses

##### `data/requests/login_request.dart`
Freezed + JSON-serializable request body:
- `phone` – user phone number (`required`)
- `password` – user password (`required`)

##### `data/responses/login_response.dart`
Freezed + JSON-serializable response:
- `token` – Bearer token returned from the server (`required`)

---

#### Data Layer – Repository Implementation

##### `data/repositories/auth_remote_repository_impl.dart`
Extends `BaseApiRepository`, implements `AuthRemoteRepository`:
- `login(request)` – calls `AuthRemote.login()` via `getStateOf<LoginResponse>()`, inheriting timeout, logging, and error mapping from `BaseApiRepository`

---

#### Domain Layer

##### `domain/repositories/auth_remote_repository.dart`
Abstract contract:
- `login(LoginRequest)` → `Future<Result<LoginResponse>>`

##### `domain/usecases/auth_remote_usecase.dart`
Thin use case wrapping `AuthRemoteRepository`:
- `login(request)` – delegates to the repository

---

#### Presentation Layer

##### `presentation/providers/auth_state.dart`
Freezed immutable state `AuthState`:
- `action` – `AuthAction` discriminator (default `AuthAction.none`)
- `token` – Bearer token after successful login
- `apiResultMessage` – optional success message from the server

##### `presentation/providers/auth_notifier.dart`
`@riverpod` async notifier `AuthNotifier` (provider name: `authProvider`):
- `build()` → returns initial `AuthState()`
- `login(request)`:
  1. Sets `state = AsyncLoading()`
  2. Calls `AuthRemoteUsecase.login(request)`
  3. On success: saves `'Bearer {token}'` to `storageManagement.accessToken`, emits `AsyncData(AuthState(action: AuthAction.login, token: ...))`
  4. On error: emits `AsyncError` with the error message

##### `presentation/pages/login_page.dart`
`LoginPage` / `LoginPageView` (extends `BasePage`):
- Phone and password `TextFormField` controllers managed via `useTextEditingController`
- `ref.listen(authProvider, ...)` – listens **only** for `AuthAction.login` state changes:
  - `data` → `context.go(Routers.home.path)` (navigate home)
  - `error` → `showSnackBar(context, message)` (show error)
- On button press: validates empty fields (shows snackbar if blank), then calls `ref.read(authProvider.notifier).login(request)`

---

## Data Flow

**Contacts (API → local DB → UI):**
```
UI (ContactPage)
  │
  ▼
ContactNotifier  (presentation/providers/contact_notifier.dart)
  │  reads via Riverpod providers
  ├──▶ ContactRemoteUseCase  ──▶ ContactRemoteRepositoryImpl  ──▶ Retrofit/Dio  ──▶ REST API
  │
  └──▶ ContactLocalUseCase   ──▶ ContactLocalRepositoryImpl   ──▶ Isar (local DB)
```

1. Fetch contacts from REST API via `ContactRemoteUseCase.getListContact()`
2. Upsert all returned contacts to Isar (deduplicated by `idServer`)
3. Read back the final list from Isar
4. Emit updated `ContactState` to the UI

**Auth (login flow):**
```
UI (LoginPage)
  │  ref.read(authProvider.notifier).login(request)
  ▼
AuthNotifier
  │
  └──▶ AuthRemoteUseCase  ──▶ AuthRemoteRepositoryImpl  ──▶ Retrofit/Dio  ──▶ REST API
         │
         ▼ on success
  storageManagement.accessToken.value = 'Bearer {token}'
         │
         ▼
  goRouterRefreshNotifier.refresh()  ──▶  GoRouter redirect  ──▶  navigate to /
```

---

## Startup Sequence

```
main_*.dart
  └─▶ bootstrap()
        ├─ Flutter error handler
        ├─ WidgetsFlutterBinding.ensureInitialized()
        ├─ System UI + portrait lock
        └─ ProviderScope  (AppRiverpodObserver attached)
              │
              ▼  startupProvider (FutureProvider)
              ├─ LogManagement.init()              → spawn log isolate
              ├─ DatabaseLocalManagement.openDatabase()  → open Isar
              ├─ StorageManagement.init()          → load SharedPreferences
              ├─ Utils.getContactPermission()      → request contacts permission
              └─ ref.read(dioProvider)             → warm up Dio
                    │
                    ▼
              App widget rendered  (MaterialApp.router → GoRouter redirect check)
                    │
                    ├─ No token  ──▶  LoginPage  ──▶  login()  ──▶  save token  ──▶  refresh()  ──▶  MainPage
                    └─ Has token ──▶  MainPage → ContactPage
```

---

## Setup

**1. Install Flutter SDK** (stable channel recommended)

```bash
flutter doctor
```

**2. Install dependencies**

```bash
flutter pub get
```

---

## Code Generation

Run after modifying Freezed models, Riverpod notifiers, Retrofit APIs, or Isar collections:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode (auto-regenerates on file change):

```bash
dart run build_runner watch --delete-conflicting-outputs
```

---

## Platform Channels (Pigeon)

This project uses [Pigeon](https://pub.dev/packages/pigeon) to generate type-safe platform channels between Flutter and native code (iOS Swift / Android Kotlin).

📄 **[View the full Pigeon guide → `lib/generated/pigeons/README.md`](lib/generated/pigeons/README.md)**

Topics covered in the guide:
- Defining a Pigeon API (data models + `@HostApi`)
- Running the code generator
- Creating an iOS Swift implementation (`*Impl.swift`)
- Registering on iOS in `AppDelegate.swift`
- Creating an Android Kotlin implementation (`*Impl.kt`)
- Registering on Android in `MainActivity.kt`
- Creating a Dart service wrapper

---

## Localization

Regenerate after editing `lib/core/config/lang/l10n/arb/app_vi.arb`:

```bash
flutter gen-l10n
```

Access translations in widgets via the `context.l10n` extension:

```dart
context.l10n.contact
context.l10n.group
```

---

## Running the App

```bash
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

Release mode:

```bash
flutter run --release --flavor development --target lib/main_development.dart
```

Enable proxy (dev only):

```bash
flutter run --flavor development --target lib/main_development.dart \
  --dart-define=ENABLE_API_PROXY=true
```

---

## Building the App

**Android APK:**

```bash
flutter build apk --release --flavor development --target lib/main_development.dart
flutter build apk --release --flavor staging --target lib/main_staging.dart
flutter build apk --release --flavor production --target lib/main_production.dart
```

**iOS:**

```bash
flutter build ios --release --flavor development --target lib/main_development.dart
flutter build ios --release --flavor staging --target lib/main_staging.dart
flutter build ios --release --flavor production --target lib/main_production.dart
```

---

## Platform Permissions

### iOS – `ios/Runner/Info.plist`

| Key | Purpose |
|---|---|
| `NSContactsUsageDescription` | Required to call `Permission.contacts.request()`. App will **crash** at runtime if this key is missing. |

### Android – `android/app/src/main/AndroidManifest.xml`

| Permission | Purpose |
|---|---|
| `READ_CONTACTS` | Required to request contacts access |
| `WRITE_CONTACTS` | Required to write contacts |
| `READ_EXTERNAL_STORAGE` | Legacy external storage read access |
| `WRITE_EXTERNAL_STORAGE` | Legacy external storage write access |

---

## Notes

- **Provider naming**: `appProvider` is the auto-generated provider name for `AppNotifier` (via `@riverpod`). Similarly `contactProvider` for `ContactNotifier`, `mainProvider` for `MainNotifier`, `authProvider` for `AuthNotifier`.
- **Auth redirect**: GoRouter's `redirect` in `appRouterProvider` checks `storageManagement.accessToken` on every navigation. After login/logout, call `ref.read(goRouterRefreshNotifierProvider).refresh()` to immediately trigger a re-evaluation.
- **`ref.listen` action filtering**: When a notifier has multiple methods, add an `action` enum field (e.g. `AuthAction`) to the state. In `ref.listen`, check `next.value?.action` to react only to the intended method and ignore other state changes.
- **Proxy detection**: `HttpOverridesImpl` reads system proxy settings inside `http_overrides_impl.dart`.
- **Generated files** (`*.g.dart`, `*.freezed.dart`) must never be edited manually. Always re-run `build_runner` to regenerate them.
- **Adding a new Isar collection**: Register the new `CollectionSchema` in `DatabaseLocalManagement._schemas` inside `database_local_management_provider.dart`.
- **Adding a new feature**: Mirror the `contacts` folder structure – create `constants`, `enums`, `data` (model → datasource → repository), `domain` (entity → repository contract → usecase), and `presentation` (state → notifier → page).
