import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/startup_provider.dart';

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
            data: (_) => FutureBuilder<Widget>(
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
            ),
          );
        },
      ),
    ),
  );
}
