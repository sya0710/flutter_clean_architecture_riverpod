import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/error/result.dart';
import 'package:riverpodlive/features/contacts/data/requests/get_list_contact_request.dart';
import 'package:riverpodlive/features/contacts/data/responses/get_list_contact_response.dart';

part 'contact_remote.g.dart';

@RestApi()
// Retrofit requires an abstract service definition for code generation.
// ignore: one_member_abstracts
abstract class ContactRemote {
  factory ContactRemote(Dio dio) => _ContactRemote(dio);

  @POST(ApiEndpoint.apiGetListContact)
  Future<HttpResponse<Result<GetListContactResponse>>> getListContact(
    @Body() GetListContactRequest getListContactRequest,
  );
}
