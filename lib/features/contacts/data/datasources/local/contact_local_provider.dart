import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:riverpodlive/features/contacts/data/datasources/local/contact_local.dart';
import 'package:riverpodlive/features/contacts/data/repositories/contact_local_repository_impl.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_local_repository.dart';
import 'package:riverpodlive/features/contacts/domain/usecases/contact_local_usecase.dart';

final contactLocalProvider = Provider<ContactLocal>((ref) {
  final isar = ref.read(databaseLocalManagementProvider).database;
  if (isar == null) {
    throw StateError('Isar database is not initialized. Call startup first.');
  }
  return ContactLocalImpl(isar);
});

final contactLocalRepositoryProvider = Provider<ContactLocalRepository>((ref) {
  return ContactLocalRepositoryImpl(ref.read(contactLocalProvider));
});

final contactLocalUseCaseProvider = Provider<ContactLocalUseCase>((ref) {
  return ContactLocalUseCase(ref.read(contactLocalRepositoryProvider));
});
