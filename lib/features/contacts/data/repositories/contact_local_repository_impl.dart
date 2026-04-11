import 'dart:convert';

import 'package:riverpodlive/core/helpers/utils.dart';
import 'package:riverpodlive/features/contacts/data/datasources/local/contact_local.dart';
import 'package:riverpodlive/features/contacts/data/models/contact_model.dart';
import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_local_repository.dart';

class ContactLocalRepositoryImpl implements ContactLocalRepository {
  ContactLocalRepositoryImpl(this._contactLocal);

  final ContactLocal _contactLocal;

  @override
  Future<void> upsertContact(ContactEntity contact) {
    return _contactLocal.upsertContact(_toModel(contact));
  }

  @override
  Future<void> upsertContacts(List<ContactEntity> contacts) {
    final models = contacts.map(_toModel).toList(growable: false);
    return _contactLocal.upsertContacts(models);
  }

  ContactModel _toModel(ContactEntity contact) {
    final idLocal = contact.idLocal ?? Utils.getUUID();

    final model = ContactModel()
      ..phone = contact.phone
      ..identifier = contact.identifier
      ..idLocal = idLocal
      ..employeeName = Utils.formatEmployeeName(
        contact.firstName ?? '',
        contact.lastName ?? '',
      )
      ..firstName = contact.firstName
      ..firstNameFurigana = contact.firstNameFurigana
      ..lastName = contact.lastName
      ..lastNameFurigana = contact.lastNameFurigana
      ..companyName = contact.companyName
      ..companyNameFurigana = contact.companyNameFurigana
      ..companyCode = contact.companyCode
      ..photo = contact.photo
      ..email = contact.email
      ..phones = _encodePhones(contact.phones)
      ..emails = _encodeEmails(contact.emails)
      ..createdAt = contact.createdAt
      ..updatedAt = contact.updatedAt
      ..createdBy = contact.createdBy
      ..updatedBy = contact.updatedBy
      ..isSynced = contact.isSynced
      ..isSyncedLocal = contact.isSyncedLocal
      ..status = contact.status
      ..note = contact.note;

    return model;
  }

  String? _encodePhones(List<PhoneInfo>? phones) {
    if (phones == null || phones.isEmpty) {
      return null;
    }
    return jsonEncode(phones.map((e) => e.toJson()).toList(growable: false));
  }

  String? _encodeEmails(List<EmailInfo>? emails) {
    if (emails == null || emails.isEmpty) {
      return null;
    }
    return jsonEncode(emails.map((e) => e.toJson()).toList(growable: false));
  }

  @override
  Future<List<ContactEntity>> getAllContact() async {
    final models = await _contactLocal.getAllContact();
    return models.map(_toEntity).toList(growable: false);
  }

  ContactEntity _toEntity(ContactModel model) {
    return ContactEntity(
      phone: model.phone,
      identifier: model.identifier,
      idLocal: model.idLocal,
      firstName: model.firstName,
      firstNameFurigana: model.firstNameFurigana,
      lastName: model.lastName,
      lastNameFurigana: model.lastNameFurigana,
      companyName: model.companyName,
      companyNameFurigana: model.companyNameFurigana,
      companyCode: model.companyCode,
      photo: model.photo,
      email: model.email,
      phones: _decodePhones(model.phones),
      emails: _decodeEmails(model.emails),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      createdBy: model.createdBy,
      updatedBy: model.updatedBy,
      isSynced: model.isSynced,
      isSyncedLocal: model.isSyncedLocal,
      status: model.status,
      note: model.note,
    );
  }

  List<PhoneInfo>? _decodePhones(String? phones) {
    if (phones == null || phones.isEmpty) return null;
    final list = jsonDecode(phones) as List<dynamic>;
    return list
        .map((e) => PhoneInfo.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  List<EmailInfo>? _decodeEmails(String? emails) {
    if (emails == null || emails.isEmpty) return null;
    final list = jsonDecode(emails) as List<dynamic>;
    return list
        .map((e) => EmailInfo.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }
}
