// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactEntity _$ContactEntityFromJson(Map<String, dynamic> json) =>
    _ContactEntity(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      identifier: json['identifier'] as String?,
      idLocal: json['idLocal'] as String?,
      firstName: json['firstName'] as String?,
      firstNameFurigana: json['firstNameFurigana'] as String?,
      lastName: json['lastName'] as String?,
      lastNameFurigana: json['lastNameFurigana'] as String?,
      companyName: json['companyName'] as String?,
      companyNameFurigana: json['companyNameFurigana'] as String?,
      companyCode: json['companyCode'] as String?,
      photo: json['photo'] as String?,
      email: json['email'] as String?,
      phones: (json['phones'] as List<dynamic>?)
          ?.map((e) => PhoneInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      emails: (json['emails'] as List<dynamic>?)
          ?.map((e) => EmailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      isSynced: json['isSynced'] as bool? ?? false,
      isSyncedLocal: json['isSyncedLocal'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ContactEntityToJson(_ContactEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'identifier': instance.identifier,
      'idLocal': instance.idLocal,
      'firstName': instance.firstName,
      'firstNameFurigana': instance.firstNameFurigana,
      'lastName': instance.lastName,
      'lastNameFurigana': instance.lastNameFurigana,
      'companyName': instance.companyName,
      'companyNameFurigana': instance.companyNameFurigana,
      'companyCode': instance.companyCode,
      'photo': instance.photo,
      'email': instance.email,
      'phones': instance.phones,
      'emails': instance.emails,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'isSynced': instance.isSynced,
      'isSyncedLocal': instance.isSyncedLocal,
      'status': instance.status,
      'note': instance.note,
    };

_PhoneInfo _$PhoneInfoFromJson(Map<String, dynamic> json) => _PhoneInfo(
  code: json['code'] as String?,
  type: json['type'] as String?,
  number: json['number'] as String?,
);

Map<String, dynamic> _$PhoneInfoToJson(_PhoneInfo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'number': instance.number,
    };

_EmailInfo _$EmailInfoFromJson(Map<String, dynamic> json) => _EmailInfo(
  type: json['type'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$EmailInfoToJson(_EmailInfo instance) =>
    <String, dynamic>{'type': instance.type, 'address': instance.address};
