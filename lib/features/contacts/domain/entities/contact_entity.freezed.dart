// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactEntity {

 String? get id; String? get phone; String? get identifier; String? get idLocal; String? get firstName;// contacts app
 String? get firstNameFurigana;// contacts app
 String? get lastName;// contacts app
 String? get lastNameFurigana;// contacts app
 String? get companyName;// contacts app
 String? get companyNameFurigana;// contacts app
 String? get companyCode;// contacts app
 String? get photo;// contacts app base64
 String? get email; List<PhoneInfo>? get phones; List<EmailInfo>? get emails; String? get createdAt; String? get updatedAt; String? get createdBy; String? get updatedBy; bool get isSynced; bool get isSyncedLocal; int? get status;// 'ACTIVE' : 1, 'DELETE' : 0, etc.
 String? get note;
/// Create a copy of ContactEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactEntityCopyWith<ContactEntity> get copyWith => _$ContactEntityCopyWithImpl<ContactEntity>(this as ContactEntity, _$identity);

  /// Serializes this ContactEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.idLocal, idLocal) || other.idLocal == idLocal)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameFurigana, firstNameFurigana) || other.firstNameFurigana == firstNameFurigana)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameFurigana, lastNameFurigana) || other.lastNameFurigana == lastNameFurigana)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyNameFurigana, companyNameFurigana) || other.companyNameFurigana == companyNameFurigana)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.phones, phones)&&const DeepCollectionEquality().equals(other.emails, emails)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.isSyncedLocal, isSyncedLocal) || other.isSyncedLocal == isSyncedLocal)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,phone,identifier,idLocal,firstName,firstNameFurigana,lastName,lastNameFurigana,companyName,companyNameFurigana,companyCode,photo,email,const DeepCollectionEquality().hash(phones),const DeepCollectionEquality().hash(emails),createdAt,updatedAt,createdBy,updatedBy,isSynced,isSyncedLocal,status,note]);

@override
String toString() {
  return 'ContactEntity(id: $id, phone: $phone, identifier: $identifier, idLocal: $idLocal, firstName: $firstName, firstNameFurigana: $firstNameFurigana, lastName: $lastName, lastNameFurigana: $lastNameFurigana, companyName: $companyName, companyNameFurigana: $companyNameFurigana, companyCode: $companyCode, photo: $photo, email: $email, phones: $phones, emails: $emails, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, isSynced: $isSynced, isSyncedLocal: $isSyncedLocal, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class $ContactEntityCopyWith<$Res>  {
  factory $ContactEntityCopyWith(ContactEntity value, $Res Function(ContactEntity) _then) = _$ContactEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? phone, String? identifier, String? idLocal, String? firstName, String? firstNameFurigana, String? lastName, String? lastNameFurigana, String? companyName, String? companyNameFurigana, String? companyCode, String? photo, String? email, List<PhoneInfo>? phones, List<EmailInfo>? emails, String? createdAt, String? updatedAt, String? createdBy, String? updatedBy, bool isSynced, bool isSyncedLocal, int? status, String? note
});




}
/// @nodoc
class _$ContactEntityCopyWithImpl<$Res>
    implements $ContactEntityCopyWith<$Res> {
  _$ContactEntityCopyWithImpl(this._self, this._then);

  final ContactEntity _self;
  final $Res Function(ContactEntity) _then;

/// Create a copy of ContactEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? phone = freezed,Object? identifier = freezed,Object? idLocal = freezed,Object? firstName = freezed,Object? firstNameFurigana = freezed,Object? lastName = freezed,Object? lastNameFurigana = freezed,Object? companyName = freezed,Object? companyNameFurigana = freezed,Object? companyCode = freezed,Object? photo = freezed,Object? email = freezed,Object? phones = freezed,Object? emails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? isSynced = null,Object? isSyncedLocal = null,Object? status = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,identifier: freezed == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String?,idLocal: freezed == idLocal ? _self.idLocal : idLocal // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,firstNameFurigana: freezed == firstNameFurigana ? _self.firstNameFurigana : firstNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,lastNameFurigana: freezed == lastNameFurigana ? _self.lastNameFurigana : lastNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyNameFurigana: freezed == companyNameFurigana ? _self.companyNameFurigana : companyNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,companyCode: freezed == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phones: freezed == phones ? _self.phones : phones // ignore: cast_nullable_to_non_nullable
as List<PhoneInfo>?,emails: freezed == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<EmailInfo>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,isSyncedLocal: null == isSyncedLocal ? _self.isSyncedLocal : isSyncedLocal // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactEntity].
extension ContactEntityPatterns on ContactEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContactEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContactEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? phone,  String? identifier,  String? idLocal,  String? firstName,  String? firstNameFurigana,  String? lastName,  String? lastNameFurigana,  String? companyName,  String? companyNameFurigana,  String? companyCode,  String? photo,  String? email,  List<PhoneInfo>? phones,  List<EmailInfo>? emails,  String? createdAt,  String? updatedAt,  String? createdBy,  String? updatedBy,  bool isSynced,  bool isSyncedLocal,  int? status,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactEntity() when $default != null:
return $default(_that.id,_that.phone,_that.identifier,_that.idLocal,_that.firstName,_that.firstNameFurigana,_that.lastName,_that.lastNameFurigana,_that.companyName,_that.companyNameFurigana,_that.companyCode,_that.photo,_that.email,_that.phones,_that.emails,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.isSynced,_that.isSyncedLocal,_that.status,_that.note);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? phone,  String? identifier,  String? idLocal,  String? firstName,  String? firstNameFurigana,  String? lastName,  String? lastNameFurigana,  String? companyName,  String? companyNameFurigana,  String? companyCode,  String? photo,  String? email,  List<PhoneInfo>? phones,  List<EmailInfo>? emails,  String? createdAt,  String? updatedAt,  String? createdBy,  String? updatedBy,  bool isSynced,  bool isSyncedLocal,  int? status,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ContactEntity():
return $default(_that.id,_that.phone,_that.identifier,_that.idLocal,_that.firstName,_that.firstNameFurigana,_that.lastName,_that.lastNameFurigana,_that.companyName,_that.companyNameFurigana,_that.companyCode,_that.photo,_that.email,_that.phones,_that.emails,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.isSynced,_that.isSyncedLocal,_that.status,_that.note);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? phone,  String? identifier,  String? idLocal,  String? firstName,  String? firstNameFurigana,  String? lastName,  String? lastNameFurigana,  String? companyName,  String? companyNameFurigana,  String? companyCode,  String? photo,  String? email,  List<PhoneInfo>? phones,  List<EmailInfo>? emails,  String? createdAt,  String? updatedAt,  String? createdBy,  String? updatedBy,  bool isSynced,  bool isSyncedLocal,  int? status,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ContactEntity() when $default != null:
return $default(_that.id,_that.phone,_that.identifier,_that.idLocal,_that.firstName,_that.firstNameFurigana,_that.lastName,_that.lastNameFurigana,_that.companyName,_that.companyNameFurigana,_that.companyCode,_that.photo,_that.email,_that.phones,_that.emails,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.isSynced,_that.isSyncedLocal,_that.status,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactEntity implements ContactEntity {
  const _ContactEntity({this.id, this.phone, this.identifier, this.idLocal, this.firstName, this.firstNameFurigana, this.lastName, this.lastNameFurigana, this.companyName, this.companyNameFurigana, this.companyCode, this.photo, this.email, final  List<PhoneInfo>? phones, final  List<EmailInfo>? emails, this.createdAt, this.updatedAt, this.createdBy, this.updatedBy, this.isSynced = false, this.isSyncedLocal = false, this.status, this.note}): _phones = phones,_emails = emails;
  factory _ContactEntity.fromJson(Map<String, dynamic> json) => _$ContactEntityFromJson(json);

@override final  String? id;
@override final  String? phone;
@override final  String? identifier;
@override final  String? idLocal;
@override final  String? firstName;
// contacts app
@override final  String? firstNameFurigana;
// contacts app
@override final  String? lastName;
// contacts app
@override final  String? lastNameFurigana;
// contacts app
@override final  String? companyName;
// contacts app
@override final  String? companyNameFurigana;
// contacts app
@override final  String? companyCode;
// contacts app
@override final  String? photo;
// contacts app base64
@override final  String? email;
 final  List<PhoneInfo>? _phones;
@override List<PhoneInfo>? get phones {
  final value = _phones;
  if (value == null) return null;
  if (_phones is EqualUnmodifiableListView) return _phones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<EmailInfo>? _emails;
@override List<EmailInfo>? get emails {
  final value = _emails;
  if (value == null) return null;
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? createdBy;
@override final  String? updatedBy;
@override@JsonKey() final  bool isSynced;
@override@JsonKey() final  bool isSyncedLocal;
@override final  int? status;
// 'ACTIVE' : 1, 'DELETE' : 0, etc.
@override final  String? note;

/// Create a copy of ContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactEntityCopyWith<_ContactEntity> get copyWith => __$ContactEntityCopyWithImpl<_ContactEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.idLocal, idLocal) || other.idLocal == idLocal)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.firstNameFurigana, firstNameFurigana) || other.firstNameFurigana == firstNameFurigana)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.lastNameFurigana, lastNameFurigana) || other.lastNameFurigana == lastNameFurigana)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyNameFurigana, companyNameFurigana) || other.companyNameFurigana == companyNameFurigana)&&(identical(other.companyCode, companyCode) || other.companyCode == companyCode)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._phones, _phones)&&const DeepCollectionEquality().equals(other._emails, _emails)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.isSyncedLocal, isSyncedLocal) || other.isSyncedLocal == isSyncedLocal)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,phone,identifier,idLocal,firstName,firstNameFurigana,lastName,lastNameFurigana,companyName,companyNameFurigana,companyCode,photo,email,const DeepCollectionEquality().hash(_phones),const DeepCollectionEquality().hash(_emails),createdAt,updatedAt,createdBy,updatedBy,isSynced,isSyncedLocal,status,note]);

@override
String toString() {
  return 'ContactEntity(id: $id, phone: $phone, identifier: $identifier, idLocal: $idLocal, firstName: $firstName, firstNameFurigana: $firstNameFurigana, lastName: $lastName, lastNameFurigana: $lastNameFurigana, companyName: $companyName, companyNameFurigana: $companyNameFurigana, companyCode: $companyCode, photo: $photo, email: $email, phones: $phones, emails: $emails, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, isSynced: $isSynced, isSyncedLocal: $isSyncedLocal, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ContactEntityCopyWith<$Res> implements $ContactEntityCopyWith<$Res> {
  factory _$ContactEntityCopyWith(_ContactEntity value, $Res Function(_ContactEntity) _then) = __$ContactEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? phone, String? identifier, String? idLocal, String? firstName, String? firstNameFurigana, String? lastName, String? lastNameFurigana, String? companyName, String? companyNameFurigana, String? companyCode, String? photo, String? email, List<PhoneInfo>? phones, List<EmailInfo>? emails, String? createdAt, String? updatedAt, String? createdBy, String? updatedBy, bool isSynced, bool isSyncedLocal, int? status, String? note
});




}
/// @nodoc
class __$ContactEntityCopyWithImpl<$Res>
    implements _$ContactEntityCopyWith<$Res> {
  __$ContactEntityCopyWithImpl(this._self, this._then);

  final _ContactEntity _self;
  final $Res Function(_ContactEntity) _then;

/// Create a copy of ContactEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? phone = freezed,Object? identifier = freezed,Object? idLocal = freezed,Object? firstName = freezed,Object? firstNameFurigana = freezed,Object? lastName = freezed,Object? lastNameFurigana = freezed,Object? companyName = freezed,Object? companyNameFurigana = freezed,Object? companyCode = freezed,Object? photo = freezed,Object? email = freezed,Object? phones = freezed,Object? emails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? isSynced = null,Object? isSyncedLocal = null,Object? status = freezed,Object? note = freezed,}) {
  return _then(_ContactEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,identifier: freezed == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String?,idLocal: freezed == idLocal ? _self.idLocal : idLocal // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,firstNameFurigana: freezed == firstNameFurigana ? _self.firstNameFurigana : firstNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,lastNameFurigana: freezed == lastNameFurigana ? _self.lastNameFurigana : lastNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyNameFurigana: freezed == companyNameFurigana ? _self.companyNameFurigana : companyNameFurigana // ignore: cast_nullable_to_non_nullable
as String?,companyCode: freezed == companyCode ? _self.companyCode : companyCode // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phones: freezed == phones ? _self._phones : phones // ignore: cast_nullable_to_non_nullable
as List<PhoneInfo>?,emails: freezed == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<EmailInfo>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,isSyncedLocal: null == isSyncedLocal ? _self.isSyncedLocal : isSyncedLocal // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PhoneInfo {

 String? get code; String? get type; String? get number;
/// Create a copy of PhoneInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneInfoCopyWith<PhoneInfo> get copyWith => _$PhoneInfoCopyWithImpl<PhoneInfo>(this as PhoneInfo, _$identity);

  /// Serializes this PhoneInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneInfo&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,type,number);

@override
String toString() {
  return 'PhoneInfo(code: $code, type: $type, number: $number)';
}


}

/// @nodoc
abstract mixin class $PhoneInfoCopyWith<$Res>  {
  factory $PhoneInfoCopyWith(PhoneInfo value, $Res Function(PhoneInfo) _then) = _$PhoneInfoCopyWithImpl;
@useResult
$Res call({
 String? code, String? type, String? number
});




}
/// @nodoc
class _$PhoneInfoCopyWithImpl<$Res>
    implements $PhoneInfoCopyWith<$Res> {
  _$PhoneInfoCopyWithImpl(this._self, this._then);

  final PhoneInfo _self;
  final $Res Function(PhoneInfo) _then;

/// Create a copy of PhoneInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? type = freezed,Object? number = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneInfo].
extension PhoneInfoPatterns on PhoneInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneInfo value)  $default,){
final _that = this;
switch (_that) {
case _PhoneInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? code,  String? type,  String? number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneInfo() when $default != null:
return $default(_that.code,_that.type,_that.number);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? code,  String? type,  String? number)  $default,) {final _that = this;
switch (_that) {
case _PhoneInfo():
return $default(_that.code,_that.type,_that.number);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? code,  String? type,  String? number)?  $default,) {final _that = this;
switch (_that) {
case _PhoneInfo() when $default != null:
return $default(_that.code,_that.type,_that.number);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneInfo implements PhoneInfo {
  const _PhoneInfo({this.code, this.type, this.number});
  factory _PhoneInfo.fromJson(Map<String, dynamic> json) => _$PhoneInfoFromJson(json);

@override final  String? code;
@override final  String? type;
@override final  String? number;

/// Create a copy of PhoneInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneInfoCopyWith<_PhoneInfo> get copyWith => __$PhoneInfoCopyWithImpl<_PhoneInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneInfo&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,type,number);

@override
String toString() {
  return 'PhoneInfo(code: $code, type: $type, number: $number)';
}


}

/// @nodoc
abstract mixin class _$PhoneInfoCopyWith<$Res> implements $PhoneInfoCopyWith<$Res> {
  factory _$PhoneInfoCopyWith(_PhoneInfo value, $Res Function(_PhoneInfo) _then) = __$PhoneInfoCopyWithImpl;
@override @useResult
$Res call({
 String? code, String? type, String? number
});




}
/// @nodoc
class __$PhoneInfoCopyWithImpl<$Res>
    implements _$PhoneInfoCopyWith<$Res> {
  __$PhoneInfoCopyWithImpl(this._self, this._then);

  final _PhoneInfo _self;
  final $Res Function(_PhoneInfo) _then;

/// Create a copy of PhoneInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? type = freezed,Object? number = freezed,}) {
  return _then(_PhoneInfo(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EmailInfo {

 String? get type; String? get address;
/// Create a copy of EmailInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailInfoCopyWith<EmailInfo> get copyWith => _$EmailInfoCopyWithImpl<EmailInfo>(this as EmailInfo, _$identity);

  /// Serializes this EmailInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailInfo&&(identical(other.type, type) || other.type == type)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,address);

@override
String toString() {
  return 'EmailInfo(type: $type, address: $address)';
}


}

/// @nodoc
abstract mixin class $EmailInfoCopyWith<$Res>  {
  factory $EmailInfoCopyWith(EmailInfo value, $Res Function(EmailInfo) _then) = _$EmailInfoCopyWithImpl;
@useResult
$Res call({
 String? type, String? address
});




}
/// @nodoc
class _$EmailInfoCopyWithImpl<$Res>
    implements $EmailInfoCopyWith<$Res> {
  _$EmailInfoCopyWithImpl(this._self, this._then);

  final EmailInfo _self;
  final $Res Function(EmailInfo) _then;

/// Create a copy of EmailInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailInfo].
extension EmailInfoPatterns on EmailInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailInfo value)  $default,){
final _that = this;
switch (_that) {
case _EmailInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailInfo value)?  $default,){
final _that = this;
switch (_that) {
case _EmailInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailInfo() when $default != null:
return $default(_that.type,_that.address);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? address)  $default,) {final _that = this;
switch (_that) {
case _EmailInfo():
return $default(_that.type,_that.address);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _EmailInfo() when $default != null:
return $default(_that.type,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailInfo implements EmailInfo {
  const _EmailInfo({this.type, this.address});
  factory _EmailInfo.fromJson(Map<String, dynamic> json) => _$EmailInfoFromJson(json);

@override final  String? type;
@override final  String? address;

/// Create a copy of EmailInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailInfoCopyWith<_EmailInfo> get copyWith => __$EmailInfoCopyWithImpl<_EmailInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailInfo&&(identical(other.type, type) || other.type == type)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,address);

@override
String toString() {
  return 'EmailInfo(type: $type, address: $address)';
}


}

/// @nodoc
abstract mixin class _$EmailInfoCopyWith<$Res> implements $EmailInfoCopyWith<$Res> {
  factory _$EmailInfoCopyWith(_EmailInfo value, $Res Function(_EmailInfo) _then) = __$EmailInfoCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? address
});




}
/// @nodoc
class __$EmailInfoCopyWithImpl<$Res>
    implements _$EmailInfoCopyWith<$Res> {
  __$EmailInfoCopyWithImpl(this._self, this._then);

  final _EmailInfo _self;
  final $Res Function(_EmailInfo) _then;

/// Create a copy of EmailInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? address = freezed,}) {
  return _then(_EmailInfo(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
