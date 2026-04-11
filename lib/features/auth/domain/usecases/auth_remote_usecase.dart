import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/data/responses/login_response.dart';
import 'package:riverpodlive/features/auth/domain/repositories/auth_remote_repository.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_remote_repository.dart';

class AuthRemoteUsecase {
  AuthRemoteUsecase(this._authRemoteRepository);
  final AuthRemoteRepository _authRemoteRepository;

  Future<Result<LoginResponse>> login(
    LoginRequest loginRequest,
  ) => _authRemoteRepository.login(loginRequest);
}
