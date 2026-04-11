import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/dio_provider.dart';
import 'package:riverpodlive/features/auth/data/datasources/remotes/auth_remote.dart';
import 'package:riverpodlive/features/auth/data/repositories/auth_remote_repository_impl.dart';
import 'package:riverpodlive/features/auth/domain/repositories/auth_remote_repository.dart';
import 'package:riverpodlive/features/auth/domain/usecases/auth_remote_usecase.dart';

final authRemoteProvider = Provider<AuthRemote>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRemote(dio);
});

final authRemoteRepositoryProvider = Provider<AuthRemoteRepository>((
  ref,
) {
  return AuthRemoteRepositoryImpl(ref);
});

final authRemoteUseCaseProvider = Provider<AuthRemoteUsecase>((ref) {
  final repository = ref.read(authRemoteRepositoryProvider);
  return AuthRemoteUsecase(repository);
});
