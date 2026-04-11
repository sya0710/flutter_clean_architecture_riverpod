import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/data/responses/login_response.dart';

// Retrofit requires an abstract service definition for code generation.
// ignore: one_member_abstracts
abstract class AuthRemoteRepository {
  Future<Result<LoginResponse>> login(
    LoginRequest loginRequest,
  );
}
