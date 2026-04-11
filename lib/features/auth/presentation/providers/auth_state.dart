import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpodlive/features/auth/enums/auth_enum.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthAction.none) AuthAction action,
    String? token,
    String? apiResultMessage,
  }) = _AuthState;
}
