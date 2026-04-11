import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:riverpodlive/core/di/providers/dio_provider.dart';
import 'package:riverpodlive/core/di/providers/log_management_provider.dart';
import 'package:riverpodlive/core/di/providers/storage_management_provider.dart';
import 'package:riverpodlive/core/helpers/utils.dart';

final startupProvider = FutureProvider<void>((ref) async {
  await ref.read(logManagementProvider).init();
  await ref.read(databaseLocalManagementProvider).openDatabase();
  await ref.read(storageManagementProvider).init();
  await Utils.getContactPermission();
  ref.read(dioProvider);
});
