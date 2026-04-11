import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_remote_repository.dart';

class ContactRemoteUseCase {
  ContactRemoteUseCase(this._contactRemoteRepository);
  final ContactRemoteRepository _contactRemoteRepository;

  Future<Result<GetListContactResponse>> getListContact(
    GetListContactRequest getListContactRequest,
  ) => _contactRemoteRepository.getListContact(getListContactRequest);
}
