import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodlive/core/error/platform_call_exception.dart';

part 'error_notifier.g.dart';

@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  PlatformCallException? build() => null;

  void notify(PlatformCallException exception) {
    state = exception;

    _logErrorToRemote(exception);
  }

  // Send log to Sentry/Crashlytics or any remote logging service.
  void _logErrorToRemote(PlatformCallException exception) {}

  void clear() {
    state = null;
  }
}
