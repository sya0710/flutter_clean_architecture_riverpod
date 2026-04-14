import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/startup_provider.dart';
import 'package:riverpodlive/core/sync/background/sync_background_service.dart';
import 'package:riverpodlive/core/sync/di/sync_providers.dart';

enum Flavor { dev, stg, production }

class _BootstrapPlaceholderApp extends StatelessWidget {
  const _BootstrapPlaceholderApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: child),
    );
  }
}

/// Calls SyncEngine.drainOnce when the app resumes from background.
///
/// This ensures that any tasks processed (or partially processed) by the
/// WorkManager background runner are immediately followed up while the app
/// is in the foreground, minimising latency.
class _SyncResumeObserver extends WidgetsBindingObserver {
  _SyncResumeObserver(this._ref);

  final WidgetRef _ref;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      log('[Bootstrap] App resumed — triggering sync drain');
      _ref.read(syncEngineProvider).drainOnce();
    }
  }
}

final class AppRiverpodObserver extends ProviderObserver {
  const AppRiverpodObserver({this.enableChangeLog = true});

  final bool enableChangeLog;

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (enableChangeLog) {
      log(
        'onChange(${context.provider.name ?? context.provider.runtimeType}, '
        '$previousValue -> $newValue)',
      );
    }
    super.didUpdateProvider(context, previousValue, newValue);
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    log(
      'onError(${context.provider.name ?? context.provider.runtimeType}'
      ', $error, $stackTrace)',
    );
    super.providerDidFail(context, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required Flavor flavor,
}) async {
  // 1️⃣ Global error handler
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  // 2️⃣ Background sync (WorkManager / BGTaskScheduler)
  // Must be initialised before runApp so the callback dispatcher is registered
  // before the OS could potentially fire a background task.
  await SyncBackgroundService.initialize();
  await SyncBackgroundService.schedulePeriodicSync();

  // 3️⃣ UI system (status bar, orientation …)
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    ProviderScope(
      observers: [
        AppRiverpodObserver(enableChangeLog: flavor != Flavor.production),
      ],
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, _) {
          final asyncInit = ref.watch(startupProvider);
          return asyncInit.when(
            loading: () => const _BootstrapPlaceholderApp(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) {
              log('Error during startup: $error', stackTrace: stack);
              return _BootstrapPlaceholderApp(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      'Startup failed:\n$error',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            data: (_) {
              // Register the lifecycle observer once the engine is up so the
              // app immediately drains on resume after a background sync run.
              final observer = _SyncResumeObserver(ref);
              WidgetsBinding.instance.addObserver(observer);

              return FutureBuilder<Widget>(
                future: (() async => await builder())(),
                builder: (c, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const _BootstrapPlaceholderApp(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return snapshot.data ??
                      const _BootstrapPlaceholderApp(child: SizedBox.shrink());
                },
              );
            },
          );
        },
      ),
    ),
  );
}
