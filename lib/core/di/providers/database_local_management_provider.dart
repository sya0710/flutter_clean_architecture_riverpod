import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/features/contacts/data/models/contact_model.dart';

class DatabaseLocalManagement {
  DatabaseLocalManagement._();

  static final instance = DatabaseLocalManagement._();

  /// All Isar collection schemas registered in the app.
  /// Add new schemas here when creating new Isar collections.
  static final List<CollectionSchema<dynamic>> _schemas = [
    ContactModelSchema,
    SyncTaskModelSchema, // offline sync queue
  ];

  Isar? database;

  Future<void> openDatabase() async {
    if (database != null) {
      return;
    }

    if (_schemas.isEmpty) {
      log('Skip opening Isar: no collection schemas have been registered yet.');
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    database = await Isar.open(_schemas, directory: dir.path);
  }

  Future<void> close() async {
    await database?.close(deleteFromDisk: true);
    database = null;
  }

  Future<void> reset() async {
    if (_schemas.isEmpty) {
      return;
    }

    await close();
    await openDatabase();
  }
}

final databaseLocalManagementProvider = Provider<DatabaseLocalManagement>((
  ref,
) {
  return DatabaseLocalManagement.instance;
});
