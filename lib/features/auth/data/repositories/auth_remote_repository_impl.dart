import 'package:riverpodlive/core/data/repositories/base_api_repository.dart';
import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/auth/data/datasources/remotes/auth_remote.dart';
import 'package:riverpodlive/features/auth/data/datasources/remotes/auth_remote_provider.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/data/responses/login_response.dart';
import 'package:riverpodlive/features/auth/domain/repositories/auth_remote_repository.dart';

class AuthRemoteRepositoryImpl extends BaseApiRepository
    implements AuthRemoteRepository {
  AuthRemoteRepositoryImpl(super.ref);

  AuthRemote get _authRemote => ref.read(authRemoteProvider);

  @override
  Future<Result<LoginResponse>> login(LoginRequest loginRequest) {
    return getStateOf<LoginResponse>(
      request: () => _authRemote.login(loginRequest),
    );
  }
}
