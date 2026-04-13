import 'dart:async';

import 'package:flutter/services.dart';
import 'package:riverpodlive/core/error/platform_call_exception.dart';
import 'package:riverpodlive/core/extensions/platform_exception_extension.dart';

class NetworkUtils {
  /// Executes [action] with a [timeout] and up to [maxRetries] retries.
  ///
  /// - [PlatformException]s are mapped via [PlatformExceptionMapper] extension
  ///   to [PlatformCallException].
  /// - Non-retryable errors (permission denied, channel error, null error) are
  ///   thrown immediately without retrying.
  /// - [TimeoutException]s are thrown as [PlatformCallException.timeout].
  static Future<T> withTimeoutAndRetry<T>(
    Future<T> Function() action, {
    Duration timeout = const Duration(seconds: 5),
    int maxRetries = 2,
  }) async {
    var attempts = 0;
    while (true) {
      try {
        return await action().timeout(timeout);
      } on PlatformCallException {
        // Already classified – propagate immediately.
        rethrow;
      } on PlatformException catch (e) {
        final wrapped = e.toPlatformCallException();

        // Never retry permission / channel / null errors.
        if (wrapped.isNonRetryable || attempts >= maxRetries) throw wrapped;
      } on TimeoutException {
        if (attempts >= maxRetries) throw PlatformCallException.timeout();
      } catch (e) {
        if (attempts >= maxRetries) rethrow;
      }

      attempts++;
    }
  }
}
