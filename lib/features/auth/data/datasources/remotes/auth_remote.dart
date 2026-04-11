import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/data/responses/login_response.dart';

part 'auth_remote.g.dart';

@RestApi()
// Retrofit requires an abstract service definition for code generation.
// ignore: one_member_abstracts
abstract class AuthRemote {
  factory AuthRemote(Dio dio) => _AuthRemote(dio);

  @POST(ApiEndpoint.apiLogin)
  Future<HttpResponse<Result<LoginResponse>>> login(
    @Body() LoginRequest loginRequest,
  );
}
