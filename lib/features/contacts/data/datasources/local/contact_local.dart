import 'package:isar_community/isar.dart';
import 'package:riverpodlive/features/contacts/constants/contact_status_constant.dart';
import 'package:riverpodlive/features/contacts/data/models/contact_model.dart';

abstract class ContactLocal {
  Future<void> upsertContact(ContactModel contact);

  Future<void> upsertContacts(List<ContactModel> contacts);

  Future<List<ContactModel>> getAllContact();
}

class ContactLocalImpl implements ContactLocal {
  ContactLocalImpl(this._isar);

  final Isar _isar;

  @override
  Future<void> upsertContact(ContactModel contact) async {
    await _isar.writeTxn(() async {
      contact.id = await _resolveId(contact);
      await _isar.contactModels.put(contact);
    });
  }

  @override
  Future<void> upsertContacts(List<ContactModel> contacts) async {
    if (contacts.isEmpty) {
      return;
    }

    await _isar.writeTxn(() async {
      final normalized = <ContactModel>[];
      for (final contact in contacts) {
        contact.id = await _resolveId(contact);
        normalized.add(contact);
      }
      await _isar.contactModels.putAll(normalized);
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
}
