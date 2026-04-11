import 'package:riverpodlive/core/error/result.dart';

extension ResultExtension<T> on Result<T> {
  R fold<R>({
    required R Function(T data, String? message) onSuccess,
    required R Function(String? message, String? errorCode) onError,
  }) {
    return when(
      success: (data, message, _) => onSuccess(data, message),
      error: (message, code) => onError(message, code),
    );
  }
}
