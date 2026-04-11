import 'package:permission_handler/permission_handler.dart';
import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static String getUUID() {
    const uuid = Uuid();
    return uuid.v4();
  }

  static String getEmployeeName(ContactEntity? contact) {
    if (contact == null) return '-';

    return formatEmployeeName(contact.firstName, contact.lastName) ?? '-';
  }

  static String? formatEmployeeName(String? firstName, String? lastName) {
    if ((lastName == null || lastName == '') &&
        (firstName == null || firstName == '')) {
      return '-';
    }

    if (lastName == null || lastName.trim().isEmpty) {
      return firstName ?? '-';
    }

    return '$lastName ${firstName ?? ''}';
  }

  static Future<void> getContactPermission() async {
    final permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      await Permission.contacts.request();
    }
  }
}
