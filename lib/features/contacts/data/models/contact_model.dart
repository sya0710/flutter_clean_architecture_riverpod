import 'dart:core';

import 'package:isar_community/isar.dart';
import 'package:riverpodlive/features/contacts/constants/contact_status_constant.dart';

part 'contact_model.g.dart';

@collection
class ContactModel {
  Id id = Isar.autoIncrement;
  String? phone;
  String? identifier;
  String? idLocal; // id for contact in app Contacts
  @Index(type: IndexType.hash, caseSensitive: false)
  String? employeeName; // contacts app
  String? firstName; // contacts app
  String? firstNameFurigana; // contacts app
  String? lastName; // contacts app
  String? lastNameFurigana; // contacts app
  String? companyName; // contacts app
  String? companyNameFurigana; // contacts app
  String? companyCode; // contacts app
  String? photo; // contacts app base64
  String? email;
  String? phones;
  String? emails;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  bool isSynced = false;
  bool isSyncedLocal = false;
  @Index(type: IndexType.value)
  int? status = ContactStatusConstant.active; // 'ACTIVE' : 1, 'DELETE' : 0
  String? note;
}
