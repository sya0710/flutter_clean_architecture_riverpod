import 'package:flutter/services.dart';
import 'package:riverpodlive/generated/pigeons/api/contact_api.g.dart';

class ContactService {
  final ContactApi _api = ContactApi();

  Future<List<Contact>> getContactsFromDevice() async {
    try {
      return _api.getContacts();
    } on ContactError catch (e) {
      throw Exception('Error ${e.code}: ${e.message}');
    } on PlatformException catch (e) {
      throw Exception('Platform error: ${e.message}');
    }
  }
}
