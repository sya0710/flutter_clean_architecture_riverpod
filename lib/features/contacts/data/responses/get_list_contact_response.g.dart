// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetListContactResponse _$GetListContactResponseFromJson(
  Map<String, dynamic> json,
) => _GetListContactResponse(
  contacts: (json['contacts'] as List<dynamic>)
      .map((e) => ContactEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  syncTimestamp: json['syncTimestamp'] as String?,
  nextSyncTimestamp: json['nextSyncTimestamp'] as String?,
);

Map<String, dynamic> _$GetListContactResponseToJson(
  _GetListContactResponse instance,
) => <String, dynamic>{
  'contacts': instance.contacts,
  'syncTimestamp': instance.syncTimestamp,
  'nextSyncTimestamp': instance.nextSyncTimestamp,
};
