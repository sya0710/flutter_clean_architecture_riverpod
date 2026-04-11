import 'package:riverpodlive/core/data/repositories/base_api_repository.dart';
import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/contacts/data/datasources/remotes/contact_remote.dart';
import 'package:riverpodlive/features/contacts/data/datasources/remotes/contact_remote_provider.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';
import 'package:riverpodlive/features/contacts/domain/repositories/contact_remote_repository.dart';

class ContactRemoteRepositoryImpl extends BaseApiRepository
    implements ContactRemoteRepository {
  ContactRemoteRepositoryImpl(super.ref);

  ContactRemote get _contactRemote => ref.read(contactRemoteProvider);

  @override
  Future<Result<GetListContactResponse>> getListContact(
    GetListContactRequest getListContactRequest,
  ) {
    return getStateOf<GetListContactResponse>(
      request: () => _contactRemote.getListContact(getListContactRequest),
    );
  }
}
