import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/error/platform_call_exception.dart';
import 'package:riverpodlive/core/helpers/network_utils.dart';
import 'package:riverpodlive/generated/pigeons/api/contact_api.g.dart';

class ContactService {
  final ContactApi _api = ContactApi();

  /// Fetches all contacts from the device via the native platform.
  ///
  /// Throws a [PlatformCallException] on any platform-channel error, with
  /// [PlatformCallException.errorCode] set to one of:
  /// - [PlatformCallErrorCode.permissionDenied] – contacts permission
  /// not granted.
  /// - [PlatformCallErrorCode.channelError]     – native channel unavailable.
  /// - [PlatformCallErrorCode.timeout]          – call timed out after retries.
  /// - [PlatformCallErrorCode.unknown]          – any other native error.
  Future<List<Contact>> getContactsFromDevice(Ref ref) async {
    return NetworkUtils.withTimeoutAndRetry(_api.getContacts, ref);
  }
}
