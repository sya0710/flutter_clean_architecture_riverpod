import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';

part 'get_list_contact_response.freezed.dart';
part 'get_list_contact_response.g.dart';

@freezed
abstract class GetListContactResponse with _$GetListContactResponse {
  const factory GetListContactResponse({
    required List<ContactEntity> contacts,
    String? syncTimestamp,
    String? nextSyncTimestamp,
  }) = _GetListContactResponse;

  factory GetListContactResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListContactResponseFromJson(json);
}
