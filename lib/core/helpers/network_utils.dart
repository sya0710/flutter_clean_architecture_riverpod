import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/error/error_notifier.dart';
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
    Future<T> Function() action,
    Ref ref, {
    Duration timeout = const Duration(seconds: 5),
    int maxRetries = 2,
  }) async {
    var attempts = 1;
    while (true) {
      try {
        return await action().timeout(timeout);
      } on PlatformException catch (e) {
        final wrapped = e.toPlatformCallException();

        ref.read(errorProvider.notifier).notify(wrapped);

        // Never retry permission / channel / null errors.
        if (wrapped.isNonRetriable || attempts >= maxRetries) throw wrapped;
      } on TimeoutException {
        if (attempts >= maxRetries) throw PlatformCallException.timeout();
      } catch (e) {
        if (attempts >= maxRetries) rethrow;
      }

      attempts++;
    }
  }
}
