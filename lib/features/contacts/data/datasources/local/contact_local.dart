import 'dart:convert';

import 'package:isar_community/isar.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_operation.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_priority.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_status.dart';
import 'package:riverpodlive/features/contacts/constants/contact_status_constant.dart';
import 'package:riverpodlive/features/contacts/data/datasources/local/contact_sync_adapter.dart';
import 'package:riverpodlive/features/contacts/data/models/contact_model.dart';

abstract class ContactLocal {
  /// Upsert a single contact.
  ///
  /// Set [enqueueSync] to `true` when the write originates from the user
  /// (local edit / device import). A [SyncTaskModel] is then written in the
  /// **same Isar transaction** as the contact — atomically, crash-safe.
  ///
  /// Leave [enqueueSync] as `false` (default) for server-originated writes
  /// (i.e. data already synced from the API) to avoid a sync loop.
  ///
  /// [priority] controls the order in which pending tasks are processed.
  /// Use [SyncPriority.critical] or [SyncPriority.high] for time-sensitive
  /// operations (e.g. payment confirmation) so they are pushed before
  /// lower-priority tasks (e.g. profile updates).
  Future<void> upsertContact(
    ContactModel contact, {
    bool enqueueSync = false,
    SyncPriority priority = SyncPriority.normal,
  });

  /// Batch upsert. Same [enqueueSync] and [priority] semantics as
  /// [upsertContact].
  Future<void> upsertContacts(
    List<ContactModel> contacts, {
    bool enqueueSync = false,
    SyncPriority priority = SyncPriority.normal,
  });

  Future<List<ContactModel>> getAllContact();
}

class ContactLocalImpl implements ContactLocal {
  ContactLocalImpl(this._isar);

  final Isar _isar;

  @override
  Future<void> upsertContact(
    ContactModel contact, {
    bool enqueueSync = false,
    SyncPriority priority = SyncPriority.normal,
  }) async {
    await _isar.writeTxn(() async {
      final isNew = contact.id == Isar.autoIncrement;
      contact.id = await _resolveId(contact);
      final isCreate = isNew && contact.id == Isar.autoIncrement;

      await _isar.contactModels.put(contact);

      if (enqueueSync) {
        await _isar.syncTaskModels.put(
          _buildSyncTask(
            contact,
            isCreate ? SyncOperation.create : SyncOperation.update,
            priority: priority,
          ),
        );
      }
    });
  }

  @override
  Future<void> upsertContacts(
    List<ContactModel> contacts, {
    bool enqueueSync = false,
    SyncPriority priority = SyncPriority.normal,
  }) async {
    if (contacts.isEmpty) return;

    await _isar.writeTxn(() async {
      final normalized = <ContactModel>[];
      final tasks = <SyncTaskModel>[];

      for (final contact in contacts) {
        final isNew = contact.id == Isar.autoIncrement;
        contact.id = await _resolveId(contact);
        final isCreate = isNew && contact.id == Isar.autoIncrement;
        normalized.add(contact);

        if (enqueueSync) {
          tasks.add(
            _buildSyncTask(
              contact,
              isCreate ? SyncOperation.create : SyncOperation.update,
              priority: priority,
            ),
          );
        }
      }

      await _isar.contactModels.putAll(normalized);
      if (tasks.isNotEmpty) {
        await _isar.syncTaskModels.putAll(tasks);
      }
    });
  }

  /// Soft-delete a contact locally and enqueue a delete task (atomic).
  ///
  /// [priority] defaults to [SyncPriority.normal]. Pass
  /// [SyncPriority.high] or [SyncPriority.critical] when the deletion
  /// is time-sensitive.
  Future<void> softDeleteContact(
    ContactModel contact, {
    SyncPriority priority = SyncPriority.normal,
  }) async {
    await _isar.writeTxn(() async {
      contact
        ..status = ContactStatusConstant.deleted
        ..updatedAt = DateTime.now().toIso8601String();
      await _isar.contactModels.put(contact);

      await _isar.syncTaskModels.put(
        _buildSyncTask(contact, SyncOperation.delete, priority: priority),
      );
    });
  }

  Future<Id> _resolveId(ContactModel contact) async {
    final identifier = contact.identifier;
    if (identifier == null || identifier.isEmpty) {
      return contact.id;
    }

    final existing = await _isar.contactModels
        .filter()
        .identifierEqualTo(identifier)
        .findFirst();

    return existing?.id ?? contact.id;
  }

  @override
  Future<List<ContactModel>> getAllContact() {
    return _isar.contactModels
        .filter()
        .statusEqualTo(ContactStatusConstant.active)
        .findAll();
  }

  // ── Helper ──────────────────────────────────────────────────────────────

  SyncTaskModel _buildSyncTask(
    ContactModel contact,
    SyncOperation operation, {
    SyncPriority priority = SyncPriority.normal,
  }) {
    return SyncTaskModel()
      ..entityType = ContactSyncAdapter.type
      ..entityLocalId = contact.idLocal ?? ''
      ..entityRemoteId = contact.identifier
      ..operationIndex = operation.index
      ..statusIndex = SyncStatus.pending.index
      ..priorityIndex = priority.index
      ..payload = _toPayload(contact)
      ..localVersion = contact.updatedAt
      ..createdAt = DateTime.now();
  }

  String _toPayload(ContactModel contact) {
    return jsonEncode({
      'id': contact.id,
      'idLocal': contact.idLocal,
      'identifier': contact.identifier,
      'firstName': contact.firstName,
      'lastName': contact.lastName,
      'phone': contact.phone,
      'email': contact.email,
      'phones': contact.phones,
      'emails': contact.emails,
      'companyName': contact.companyName,
      'status': contact.status,
      'updatedAt': contact.updatedAt,
      'createdAt': contact.createdAt,
    });
  }
}
