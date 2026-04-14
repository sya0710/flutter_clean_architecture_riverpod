import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:riverpodlive/core/di/providers/dio_provider.dart';
import 'package:riverpodlive/core/di/providers/log_management_provider.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/core/helpers/utils.dart';
import 'package:riverpodlive/core/sync/di/sync_providers.dart';

final startupProvider = FutureProvider<void>((ref) async {
  await ref.read(logManagementProvider).init();
  await ref.read(databaseLocalManagementProvider).openDatabase();
  await ref.read(storageManagementProvider).init();
  await Utils.getContactPermission();
  ref
    ..read(dioProvider)
    // Boot the offline-first sync engine after the database is ready.
    // The engine is kept alive for the app's lifetime.
    ..read(syncEngineProvider);
});
