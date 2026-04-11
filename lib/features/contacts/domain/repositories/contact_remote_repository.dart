import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';

// Retrofit requires an abstract service definition for code generation.
// ignore: one_member_abstracts
abstract class ContactRemoteRepository {
  Future<Result<GetListContactResponse>> getListContact(
    GetListContactRequest getListContactRequest,
  );
}
