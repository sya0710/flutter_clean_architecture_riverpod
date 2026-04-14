#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif
import UIKit
import workmanager

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // ─── WorkManager / BGTaskScheduler setup ─────────────────────────────
    // iOS BGTaskScheduler requires ALL task identifiers to be registered
    // synchronously here, before application(_:didFinishLaunchingWithOptions:)
    // returns. Doing it later (e.g. in didInitializeImplicitFlutterEngine)
    // causes the "No launch handler registered" crash.
    //
    // registerPeriodicTask → maps to BGAppRefreshTask on iOS, which is what
    // Workmanager().registerPeriodicTask() uses under the hood.
    // frequency: nil → let workmanager use the default 15-minute window.
    SwiftWorkmanagerPlugin.registerPeriodicTask(
      withIdentifier: "com.example.riverpod.bg_sync",
      frequency: nil
    )

    // Tell workmanager how to bootstrap Flutter plugins inside the separate
    // headless Flutter engine it spawns when running a background task.
    SwiftWorkmanagerPlugin.setPluginRegistrantCallback { registry in
      GeneratedPluginRegistrant.register(with: registry)
    }
    // ─────────────────────────────────────────────────────────────────────

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "ContactApi") else {
      return
    }

    ContactApiSetup.setUp(
      binaryMessenger: registrar.messenger(),
      api: ContactApiImpl()
    )
  }
}
