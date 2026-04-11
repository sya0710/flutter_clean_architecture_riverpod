import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_local_repository.dart';

class ContactLocalUseCase {
  ContactLocalUseCase(this._contactLocalRepository);

  final ContactLocalRepository _contactLocalRepository;

  Future<void> upsertContact(ContactEntity contact) {
    return _contactLocalRepository.upsertContact(contact);
  }

  Future<void> upsertContacts(List<ContactEntity> contacts) {
    return _contactLocalRepository.upsertContacts(contacts);
  }

  Future<List<ContactEntity>> getAllContact() {
    return _contactLocalRepository.getAllContact();
  }
}
