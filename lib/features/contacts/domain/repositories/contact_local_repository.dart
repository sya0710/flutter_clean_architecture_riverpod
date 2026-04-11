import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';

abstract class ContactLocalRepository {
  Future<void> upsertContact(ContactEntity contact);

  Future<void> upsertContacts(List<ContactEntity> contacts);

  Future<List<ContactEntity>> getAllContact();
}
