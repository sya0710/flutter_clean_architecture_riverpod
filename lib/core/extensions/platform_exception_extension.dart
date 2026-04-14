import 'package:flutter/services.dart';
import 'package:riverpodlive/core/error/platform_call_exception.dart';

/// Extension that maps a raw [PlatformException] (from Flutter / Pigeon
/// platform channels) to a typed [PlatformCallException].
extension PlatformExceptionMapper on PlatformException {
  /// Converts this [PlatformException] to a [PlatformCallException].
  ///
  /// The errorCode is classified based on the raw [code]:
  /// - `permissionDenied` → [PlatformCallErrorCode.permissionDenied]
  /// - `channelError`     → [PlatformCallErrorCode.channelError]
  /// - `nullError`        → [PlatformCallErrorCode.nullError]
  /// - anything else       → [PlatformCallErrorCode.unknown]
  ///
  /// A human-readable [PlatformCallException.message] is generated
  /// automatically when [message] is null.
  PlatformCallException toPlatformCallException() {
    final errorCode = switch (code) {
      'permissionDenied' => PlatformCallErrorCode.permissionDenied,
      'channelError' => PlatformCallErrorCode.channelError,
      'nullError' => PlatformCallErrorCode.nullError,
      _ => PlatformCallErrorCode.unknown,
    };

    final defaultMessage = switch (errorCode) {
      PlatformCallErrorCode.permissionDenied =>
        'Permission denied. Please grant the required permission in Settings.',
      PlatformCallErrorCode.channelError =>
        'Unable to communicate with the native platform. '
            'Please restart the app.',
      PlatformCallErrorCode.nullError =>
        'The platform returned an unexpected null value.',
      PlatformCallErrorCode.timeout =>
        'The operation timed out. Please check your device and try again.',
      PlatformCallErrorCode.unknown =>
        message ?? 'An unexpected platform error occurred.',
    };

    return PlatformCallException(
      errorCode: errorCode,
      message: message ?? defaultMessage,
      originalCode: code,
    );
  }
}
