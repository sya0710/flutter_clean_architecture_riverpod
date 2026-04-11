import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/dio_provider.dart';
import 'package:riverpodlive/features/contacts/data/datasources/remotes/contact_remote.dart';
import 'package:riverpodlive/features/contacts/data/repositories/contact_remote_repository_impl.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_remote_repository.dart';
import 'package:riverpodlive/features/contacts/domain/usecases/contact_remote_usecase.dart';

final contactRemoteProvider = Provider<ContactRemote>((ref) {
  final dio = ref.read(dioProvider);
  return ContactRemote(dio);
});

final contactRemoteRepositoryProvider = Provider<ContactRemoteRepository>((
  ref,
) {
  return ContactRemoteRepositoryImpl(ref);
});

final contactRemoteUseCaseProvider = Provider<ContactRemoteUseCase>((ref) {
  final repository = ref.read(contactRemoteRepositoryProvider);
  return ContactRemoteUseCase(repository);
});
