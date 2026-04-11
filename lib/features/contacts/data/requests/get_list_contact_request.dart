import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_list_contact_request.freezed.dart';
part 'get_list_contact_request.g.dart';

@freezed
abstract class GetListContactRequest with _$GetListContactRequest {
  const factory GetListContactRequest({
    String? since,
  }) = _GetListContactRequest;

  factory GetListContactRequest.fromJson(Map<String, dynamic> json) =>
      _$GetListContactRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
