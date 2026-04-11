import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodlive/core/di/providers/log_management_provider.dart';
import 'package:riverpodlive/core/extensions/result_extension.dart';
import 'package:riverpodlive/features/contacts/data/datasources/local/contact_local_provider.dart';
import 'package:riverpodlive/features/contacts/data/datasources/remotes/contact_remote_provider.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';
import 'package:riverpodlive/features/contacts/presentation/providers/contact_state.dart';
import 'package:riverpodlive/generated/pigeons/services/contact_service.dart';

part 'contact_notifier.g.dart';

@riverpod
class ContactNotifier extends _$ContactNotifier {
  @override
  FutureOr<ContactState> build() {
    return const ContactState();
  }

  Future<void> getAllContactFromApi(GetListContactRequest request) async {
    state = const AsyncLoading();

    // Call api to get list contact
    final result = await ref
        .read(contactRemoteUseCaseProvider)
        .getListContact(request);

    await result.fold(
      onSuccess: (GetListContactResponse data, String? message) async {
        final contacts = data.contacts;
        // Insert/Update/Soft Delete local database based on the API response
        await ref.read(contactLocalUseCaseProvider).upsertContacts(contacts);

        // Fetch updated contacts from local database after synchronization
        final updatedContacts = await ref
            .read(contactLocalUseCaseProvider)
            .getAllContact();

        state = AsyncData<ContactState>(
          ContactState(
            contacts: updatedContacts,
            updateDatabaseFinish: true,
            apiResultMessage: message,
          ),
        );
      },
      onError: (String? message, String? errorCode) {
        state = AsyncError<ContactState>(
          Exception(message ?? 'Failed to fetch contacts'),
          StackTrace.current,
        );
      },
    );
  }

  // Get all contact from local database without calling API
  Future<void> getAllContact() async {
    state = const AsyncLoading();

    try {
      final contacts = await ref
          .read(contactLocalUseCaseProvider)
          .getAllContact();

      state = AsyncData(
        ContactState(
          contacts: contacts,
          apiResultMessage: '',
        ),
      );
    } on Exception catch (e, st) {
      state = AsyncError<ContactState>(
        e,
        st,
      );
    }
  }

  // Get all contact from device, then insert/update to local database,
  // finally get all contact from local database to display
  Future<void> getAllContactFromDevice() async {
    state = const AsyncLoading();

    try {
      final contactService = ContactService();
      // All contacts from device will be inserted/updated to local database,
      // then get all contacts from local database to display
      final contacts = await contactService.getContactsFromDevice();
      await ref
          .read(logManagementProvider)
          .log(
            'contact from contact device:'
            '${contacts.map(
              (contact) => 'Contact: ${contact.displayName}, ${contact.phones}',
            ).toList()}',
          );
    } on Exception catch (e, st) {
      state = AsyncError<ContactState>(
        e,
        st,
      );
    }
  }
}
