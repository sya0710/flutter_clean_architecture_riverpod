import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/core/extensions/result_extension.dart';
import 'package:riverpodlive/features/auth/data/datasources/remotes/auth_remote_provider.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/data/responses/login_response.dart';
import 'package:riverpodlive/features/auth/enums/auth_enum.dart';
import 'package:riverpodlive/features/auth/presentation/providers/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthState> build() {
    return const AuthState();
  }

  Future<void> login(LoginRequest request) async {
    state = const AsyncLoading();

    final result = await ref.read(authRemoteUseCaseProvider).login(request);

    await result.fold(
      onSuccess: (LoginResponse data, String? message) async {
        ref.read(storageManagementProvider).accessToken.value =
            'Bearer ${data.token}';

        state = AsyncData<AuthState>(
          AuthState(
            action: AuthAction.login,
            token: data.token,
            apiResultMessage: message,
          ),
        );
      },
      onError: (String? message, String? errorCode) {
        state = AsyncError<AuthState>(
          Exception(message ?? 'Failed to login'),
          StackTrace.current,
        );
      },
    );
  }
}
