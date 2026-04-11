import 'dart:io' show HttpOverrides, HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpodlive/app/presentation/providers/app_notifier.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/constants/settings_constants.dart';
import 'package:riverpodlive/core/di/http_overrides_impl.dart';
import 'package:riverpodlive/core/di/providers/log_management_provider.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/core/error/result.dart';

/// Global error message for localization
class GlobalErrorMessage {
  static String errorMessageCommon = 'An unexpected error occurred';
}

abstract class BaseApiRepository {
  BaseApiRepository(this.ref);
  final Ref ref;

  @protected
  Future<Result<T>> getStateOf<T>({
    required Future<HttpResponse<Result<T>>> Function() request,
  }) async {
    try {
      if (SettingConstants.enableApiProxy) {
        final httpOverrides = HttpOverridesImpl();
        await httpOverrides.init();
        HttpOverrides.global = httpOverrides;
      }

      final cancelToken = CancelToken();
      final httpResponse = await Future.any([
        request().then((res) => res), // Your request must accept cancelToken
        Future.delayed(
          const Duration(seconds: SettingConstants.timeOutConnection),
          () {
            ref.read(logManagementProvider).log('Call API: $request');
            ref
                .read(logManagementProvider)
                .log(DioExceptionType.connectionTimeout.toString());
            cancelToken.cancel('Request cancelled due to timeout');
            throw DioException(
              requestOptions: RequestOptions(),
              type: DioExceptionType.connectionTimeout,
              error: '',
            );
          },
        ),
      ]);

      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        final response = httpResponse.data;
        return response.when(
          success: (data, message, pagination) => Result.success(
            data: data,
            message: message,
            pagination: pagination,
          ),
          error: (message, errorCode) => Result.error(
            message: message,
            errorCode: errorCode,
          ),
        );
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (error) {
      await ref.read(logManagementProvider).log('Call API: $request');
      await ref
          .read(logManagementProvider)
          .log(
            'Request failed with status code: '
            '\nRequest: ${error.response?.requestOptions}'
            '\nResponse data: ${error.response?.data}',
          );

      if (error.response?.statusCode == HttpStatus.unauthorized) {
        ref.read(storageManagementProvider).clearAccessToken();
        ref.read(appProvider.notifier).setUnauthorized(true);
        if (error.requestOptions.path != ApiEndpoint.apiLogin) {
          return const Result.error();
        }
      }

      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        ref.read(appProvider.notifier).setTimeout(true);
        return const Result.error();
      }

      if (error.type == DioExceptionType.connectionError ||
          error.response?.statusCode == null) {
        ref.read(appProvider.notifier).setNoNetwork(true);
        return const Result.error();
      }

      final response = error.response?.data;
      if (response is Map<String, dynamic>) {
        final message = response['message']?.toString();
        if (message != null && message.isNotEmpty) {
          return Result.error(
            message: message,
            errorCode: error.response?.statusCode?.toString(),
          );
        }
      }

      return Result.error(
        message: error.toString().isEmpty
            ? GlobalErrorMessage.errorMessageCommon
            : error.toString(),
        errorCode: error.response?.statusCode?.toString(),
      );
    } on Exception catch (error) {
      await ref.read(logManagementProvider).log('Call API: $request');
      await ref
          .read(logManagementProvider)
          .log(
            'Request failed with status code: '
            '\n$error',
          );

      return Result.error(
        message: error.toString().isEmpty
            ? GlobalErrorMessage.errorMessageCommon
            : error.toString(),
      );
    }
  }
}
