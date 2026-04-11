import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/generated/pigeons/api/contact_api.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Runner/ContactApi.swift',
    swiftOptions: SwiftOptions(),
    kotlinOut: 'android/app/src/main/kotlin/com/example/riverpod/ContactApi.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.riverpod'),
  ),
)
class Contact {
  String? displayName;

  List<String>? emails;

  List<String>? phones;
}

class ContactError {
  String? code; // Ex: "PERMISSION_DENIED"
  String? message;
}

/// API flutter call.
@HostApi()
// This annotation indicates that this interface will be
// implemented on the host platform (iOS/Android) and called from Flutter.
// ignore: one_member_abstracts
abstract class ContactApi {
  List<Contact> getContacts();
}
