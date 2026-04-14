import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/sync/data/models/sync_task_model.dart';
import 'package:riverpodlive/core/sync/domain/enums/sync_operation.dart';
import 'package:riverpodlive/core/sync/engine/sync_adapter.dart';

/// [SyncAdapter] implementation for the **contact** entity type.
///
/// Handles [SyncOperation.create], [SyncOperation.update], and
/// [SyncOperation.delete] by calling the appropriate remote endpoint.
///
/// **TODO**: Replace the placeholder push logic below with real Retrofit calls
/// once the API contract (`POST /contacts`, `PUT /contacts/{id}`,
/// `DELETE /contacts/{id}`) is confirmed.  The adapter structure is fully
/// wired — only the HTTP calls need filling in.
class ContactSyncAdapter extends SyncAdapter {
  const ContactSyncAdapter();

  /// Key used in the adapter registry — must match the value written to
  /// [SyncTaskModel.entityType] when enqueuing contact tasks.
  static const String type = 'contact';

  @override
  String get entityType => type;

  @override
  Future<SyncAdapterResult> push(SyncTaskModel task, Ref ref) async {
    try {
      final payload = jsonDecode(task.payload) as Map<String, dynamic>;
      final operation = task.operation;

      switch (operation) {
        case SyncOperation.create:
          return await _create(payload, task, ref);
        case SyncOperation.update:
          return await _update(payload, task, ref);
        case SyncOperation.delete:
          return await _delete(task, ref);
      }
    } on FormatException catch (e) {
      return SyncAdapterFatalError('Invalid payload JSON: $e');
    } on Exception catch (e) {
      return SyncAdapterNetworkError(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchFromServer(
    String remoteId,
    Ref ref,
  ) async {
    log('[ContactSyncAdapter] fetchFromServer not yet implemented');
    return null;
  }

  // ── Private helpers ──────────────────────────────────────────────────────

  Future<SyncAdapterResult> _create(
    Map<String, dynamic> payload,
    SyncTaskModel task,
    Ref ref,
  ) async {
    // final remote = ref.read(contactRemoteProvider);
    // final response = await remote.createContact(payload);
    // return SyncAdapterSuccess(remoteId: response.id);

    // ── Placeholder (simulates success) ──
    log('[ContactSyncAdapter] CREATE contact ${task.entityLocalId} (stub)');
    return SyncAdapterSuccess(remoteId: payload['idServer']?.toString());
  }

  Future<SyncAdapterResult> _update(
    Map<String, dynamic> payload,
    SyncTaskModel task,
    Ref ref,
  ) async {
    // final remote = ref.read(contactRemoteProvider);
    // final response = await remote.updateContact(
    // task.entityRemoteId!, payload
    // );
    // return const SyncAdapterSuccess();

    // ── Placeholder (simulates success) ──
    log('[ContactSyncAdapter] UPDATE contact ${task.entityLocalId} (stub)');
    return const SyncAdapterSuccess();
  }

  Future<SyncAdapterResult> _delete(SyncTaskModel task, Ref ref) async {
    if (task.entityRemoteId == null) {
      // Never created on server — safe to skip.
      return const SyncAdapterSuccess();
    }

    // final remote = ref.read(contactRemoteProvider);
    // await remote.deleteContact(task.entityRemoteId!);
    // return const SyncAdapterSuccess();

    // ── Placeholder (simulates success) ──
    log('[ContactSyncAdapter] DELETE contact ${task.entityRemoteId} (stub)');
    return const SyncAdapterSuccess();
  }
}
