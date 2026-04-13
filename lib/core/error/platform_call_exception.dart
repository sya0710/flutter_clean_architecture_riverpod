import 'package:flutter/services.dart';
import 'package:riverpodlive/core/extensions/platform_exception_extension.dart';

/// Codes that represent well-known platform-call failure reasons.
enum PlatformCallErrorCode {
  /// The user denied the required permission (e.g. Contacts).
  permissionDenied,

  /// The Flutter ↔ native message channel could not be established.
  channelError,

  /// The platform returned a null value where a non-null value was expected.
  nullError,

  /// The call did not complete within the allowed time window.
  timeout,

  /// Any other, unclassified platform error.
  unknown,
}

/// A typed exception wrapping a raw platform-channel error.
///
/// Use the [PlatformExceptionMapper] extension on [PlatformException] to
/// convert a raw Flutter/Pigeon exception into a [PlatformCallException].
class PlatformCallException implements Exception {
  const PlatformCallException({
    required this.errorCode,
    required this.message,
    this.originalCode,
  });

  /// Convenience constructor for a timeout error.
  factory PlatformCallException.timeout() => const PlatformCallException(
    errorCode: PlatformCallErrorCode.timeout,
    message: 'The operation timed out. Please check your device and try again.',
  );

  /// The classified error code.
  final PlatformCallErrorCode errorCode;

  /// Human-readable description of the error.
  final String message;

  /// The original raw code from the platform (may be null for timeout).
  final String? originalCode;

  /// Returns `true` for errors that should **not** be retried.
  bool get isNonRetryable =>
      errorCode == PlatformCallErrorCode.permissionDenied ||
      errorCode == PlatformCallErrorCode.channelError ||
      errorCode == PlatformCallErrorCode.nullError;

  @override
  String toString() =>
      'PlatformCallException(code: $errorCode, '
      'message: $message, originalCode: $originalCode)';
}
