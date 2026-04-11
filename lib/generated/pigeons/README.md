# 🐦 Pigeon — Guide to Creating and Using Platform Channels

Pigeon is a Flutter code-generation tool that creates type-safe platform channels between Flutter (Dart) and native platforms (iOS Swift / Android Kotlin), eliminating the need for manual boilerplate.

---

## 📁 Directory Structure

**Flutter (Dart)**
```
lib/generated/pigeons/
├── README.md                        ← This file
├── api/
│   ├── contact_api.dart             ← Pigeon definition file (input — edit this)
│   └── contact_api.g.dart           ← Auto-generated Dart output — DO NOT EDIT
└── services/
    └── contact_service.dart         ← Flutter service that wraps the generated API
```

**iOS (Swift)**
```
ios/Runner/
├── ContactApi.swift                 ← Auto-generated Swift output — DO NOT EDIT
├── ContactApiImpl.swift             ← Native implementation (write manually)
└── AppDelegate.swift                ← Register APIs with the Flutter engine here
```

**Android (Kotlin)**
```
android/app/src/main/kotlin/com/example/riverpod/
├── ContactApi.kt                    ← Auto-generated Kotlin output — DO NOT EDIT
├── ContactApiImpl.kt                ← Native implementation (write manually)
└── MainActivity.kt                  ← Register APIs with the Flutter engine here
```

---

## 📝 Step 1 — Define the API

Create a definition file under `lib/generated/pigeons/api/`, e.g. `my_feature_api.dart`:

```dart
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    // Dart output (Flutter side)
    dartOut: 'lib/generated/pigeons/api/my_feature_api.g.dart',
    dartOptions: DartOptions(),
    // Swift output (iOS side)
    swiftOut: 'ios/Runner/MyFeatureApi.swift',
    swiftOptions: SwiftOptions(),
    // Kotlin output (Android side)
    kotlinOut: 'android/app/src/main/kotlin/com/example/riverpod/MyFeatureApi.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.riverpod'),
  ),
)

// --- Data models ---
class MyData {
  String? id;
  String? name;
}

// --- API called from Flutter → Native ---
@HostApi()
abstract class MyFeatureApi {
  MyData getDataById(String id);
  List<MyData> getAllData();
}
```

### Annotation reference

| Annotation | Description |
|---|---|
| `@HostApi()` | Flutter calls → Native executes (most common) |
| `@FlutterApi()` | Native calls → Flutter executes |
| `@ConfigurePigeon(...)` | Configures output file paths |

---

## ⚡ Step 2 — Run the Generator

From the project root, run:

```bash
flutter pub run pigeon --input lib/generated/pigeons/api/my_feature_api.dart
OR
dart run pigeon --input lib/generated/pigeons/api/my_feature_api.dart
```

> **Example with the existing ContactApi:**
> ```bash
> flutter pub run pigeon --input lib/generated/pigeons/api/contact_api.dart
> OR
> dart run pigeon --input lib/generated/pigeons/api/contact_api.dart
> ```

After a successful run, the following files are created/updated automatically:
- `lib/generated/pigeons/api/my_feature_api.g.dart` — Dart
- `ios/Runner/MyFeatureApi.swift` — iOS
- `android/app/src/main/kotlin/com/example/riverpod/MyFeatureApi.kt` — Android

> ⚠️ **Never manually edit `.g.dart`, generated `.swift`, or generated `.kt` files** — they will be overwritten on the next generate run.

---

## 🍎 Step 3 — iOS Implementation (Swift)

Create `MyFeatureApiImpl.swift` in `ios/Runner/` and implement the generated protocol:

```swift
import Foundation

class MyFeatureApiImpl: NSObject, MyFeatureApi {

    func getDataById(id: String) throws -> MyData {
        var data = MyData()
        data.id = id
        data.name = "Item \(id)"
        return data
    }

    func getAllData() throws -> [MyData] {
        var item = MyData()
        item.id = "1"
        item.name = "Example"
        return [item]
    }
}
```

> 📌 **Reference:** `ios/Runner/ContactApiImpl.swift`

```swift
// ContactApiImpl.swift — real example in this project
import Foundation
import Contacts

class ContactApiImpl: NSObject, ContactApi {
    func getContacts() throws -> [Contact] {
        let store = CNContactStore()
        guard CNContactStore.authorizationStatus(for: .contacts) == .authorized else {
            throw ContactApiError.permissionDenied
        }
        // ... fetch and return contacts
        return contacts
    }
}
```

---

## 🔌 Step 4 — Register on iOS (AppDelegate.swift)

Open `ios/Runner/AppDelegate.swift` and register the new API inside `didInitializeImplicitFlutterEngine`:

```swift
func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // ✅ ContactApi (existing)
    guard let contactRegistrar = engineBridge.pluginRegistry.registrar(forPlugin: "ContactApi") else { return }
    ContactApiSetup.setUp(
        binaryMessenger: contactRegistrar.messenger(),
        api: ContactApiImpl()
    )

    // ✅ MyFeatureApi (new)
    guard let myFeatureRegistrar = engineBridge.pluginRegistry.registrar(forPlugin: "MyFeatureApi") else { return }
    MyFeatureApiSetup.setUp(
        binaryMessenger: myFeatureRegistrar.messenger(),
        api: MyFeatureApiImpl()
    )
}
```

> ⚠️ **Always register inside `didInitializeImplicitFlutterEngine`**, never in `didFinishLaunchingWithOptions`. The Flutter engine is only ready when `didInitializeImplicitFlutterEngine` is called.

> 💡 The string passed to `registrar(forPlugin:)` can be any unique identifier — use the API class name by convention.

---

## 🤖 Step 5 — Android Implementation (Kotlin)

Create `MyFeatureApiImpl.kt` in `android/app/src/main/kotlin/com/example/riverpod/`:

```kotlin
package com.example.riverpod

class MyFeatureApiImpl : MyFeatureApi {

    override fun getDataById(id: String): MyData {
        return MyData(id = id, name = "Item $id")
    }

    override fun getAllData(): List<MyData> {
        return listOf(MyData(id = "1", name = "Example"))
    }
}
```

> 📌 **Reference:** `android/app/src/main/kotlin/com/example/riverpod/ContactApiImpl.kt`

---

## 🔌 Step 6 — Register on Android (MainActivity.kt)

Open `android/app/src/main/kotlin/com/example/riverpod/MainActivity.kt` and override `configureFlutterEngine`:

```kotlin
package com.example.riverpod

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // ✅ ContactApi (existing)
        ContactApiSetup.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            ContactApiImpl()
        )

        // ✅ MyFeatureApi (new)
        MyFeatureApiSetup.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            MyFeatureApiImpl()
        )
    }
}
```

> 💡 Unlike iOS, Android uses `flutterEngine.dartExecutor.binaryMessenger` directly — no registrar needed.

---

## 🎯 Step 7 — Create a Flutter Service (Dart)

Create `lib/generated/pigeons/services/my_feature_service.dart`:

```dart
import 'package:flutter/services.dart';
import 'package:riverpodlive/generated/pigeons/api/my_feature_api.g.dart';

class MyFeatureService {
  final MyFeatureApi _api = MyFeatureApi();

  Future<MyData> getDataById(String id) async {
    try {
      return await _api.getDataById(id);
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    }
  }

  Future<List<MyData>> getAllData() async {
    try {
      return await _api.getAllData();
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    }
  }
}
```

---

## 🔄 Summary — Steps to Add a New API

```
1. Create definition file
   lib/generated/pigeons/api/my_feature_api.dart

2. Run generator
   flutter pub run pigeon --input lib/generated/pigeons/api/my_feature_api.dart
   dart run pigeon --input lib/generated/pigeons/api/my_feature_api.dart

3. Create iOS implementation
   ios/Runner/MyFeatureApiImpl.swift

4. Register on iOS
   ios/Runner/AppDelegate.swift → didInitializeImplicitFlutterEngine

5. Create Android implementation
   android/app/.../MyFeatureApiImpl.kt

6. Register on Android
   android/app/.../MainActivity.kt → configureFlutterEngine

7. Create Dart service
   lib/generated/pigeons/services/my_feature_service.dart
```

---

## ⚠️ Important — Permission & Native Configuration

When using APIs that access system resources (e.g. Contacts, Camera, Location…), you **must configure platform-specific permissions**, otherwise the API will not work correctly.

---

### 🍎 iOS — Configure Permissions

#### 1. Add permission to `Info.plist`

Example (Contacts):

```xml
<key>NSContactsUsageDescription</key>
<string>This app needs access to your contacts</string>
```

---

#### 2. Enable permission flags in `Podfile`

Some plugins/APIs (especially when using permission handlers) require enabling compile-time flags.

Open `ios/Podfile` and add:

```ruby
target.build_configurations.each do |config|
  config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
    '$(inherited)',

    ## dart: PermissionGroup.contacts
    'PERMISSION_CONTACTS=1',
  ]
end
```

> 💡 Without this step, permission requests may silently fail or always return denied.

---

### 🤖 Android — Configure Permissions

#### 1. Add permission to `AndroidManifest.xml`

Example (Contacts):

```xml
<uses-permission android:name="android.permission.READ_CONTACTS"/>
```

---

#### 2. (Optional) Runtime permission

If targeting Android 6.0+ (API 23+), you must request permission at runtime (handled via Flutter or native code).

---

### 🚨 Common Mistakes

* ❌ Forgetting to add permission in `Info.plist` (iOS will crash)
* ❌ Missing `GCC_PREPROCESSOR_DEFINITIONS` in Podfile
* ❌ Not requesting runtime permission on Android
* ❌ Calling API before permission is granted

---

### ✅ Best Practice

Always ensure:

```
1. Permission declared (iOS Info.plist / AndroidManifest.xml)
2. Permission enabled (Podfile for iOS if needed)
3. Permission requested at runtime
4. Only call API after permission granted
```

---

### 📌 Example: Contacts API Flow

```
Flutter → Request permission
        → If granted → Call Pigeon API
        → Native → Access Contacts
        → Return data
```

---


## 📚 References

- [Pigeon on pub.dev](https://pub.dev/packages/pigeon)
- [Flutter Platform Channels](https://docs.flutter.dev/platform-integration/platform-channels)
- [Pigeon examples on GitHub](https://github.com/flutter/packages/tree/main/packages/pigeon/example)
