import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/constants/settings_constants.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()..options.baseUrl = ApiEndpoint.getBaseURL();

  dio.interceptors.add(AwesomeDioInterceptor());
  dio.interceptors.add(RequestsInspectorInterceptor());

  // Timeout
  dio.options.connectTimeout = const Duration(
    seconds: SettingConstants.timeOutConnection,
  );
  dio.options.receiveTimeout = const Duration(
    seconds: SettingConstants.timeOutConnection,
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = ref
            .read(storageManagementProvider)
            .accessToken
            .value;
        options.headers['Content-Type'] = 'application/json; charset=utf-8';
        options.headers['Accept'] = 'application/json';
        handler.next(options);
      },
    ),
  );

  return dio;
});
