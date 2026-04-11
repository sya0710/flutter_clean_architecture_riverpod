import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';
part 'contact_entity.g.dart';

@freezed
abstract class ContactEntity with _$ContactEntity {
  const factory ContactEntity({
    String? id,
    String? phone,
    String? identifier,
    String? idLocal,
    String? firstName, // contacts app
    String? firstNameFurigana, // contacts app
    String? lastName, // contacts app
    String? lastNameFurigana, // contacts app
    String? companyName, // contacts app
    String? companyNameFurigana, // contacts app
    String? companyCode, // contacts app
    String? photo, // contacts app base64
    String? email,
    List<PhoneInfo>? phones,
    List<EmailInfo>? emails,
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
    @Default(false) bool isSynced,
    @Default(false) bool isSyncedLocal,
    int? status, // 'ACTIVE' : 1, 'DELETE' : 0, etc.
    String? note,
    // api response
  }) = _ContactEntity;

  factory ContactEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactEntityFromJson(json);
}

@freezed
abstract class PhoneInfo with _$PhoneInfo {
  const factory PhoneInfo({
    String? code,
    String? type,
    String? number,
  }) = _PhoneInfo;

  factory PhoneInfo.fromJson(Map<String, dynamic> json) =>
      _$PhoneInfoFromJson(json);
}

@freezed
abstract class EmailInfo with _$EmailInfo {
  const factory EmailInfo({
    String? type,
    String? address,
  }) = _EmailInfo;

  factory EmailInfo.fromJson(Map<String, dynamic> json) =>
      _$EmailInfoFromJson(json);
}
