// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_list_contact_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetListContactResponse {

 List<ContactEntity> get contacts; String? get syncTimestamp; String? get nextSyncTimestamp;
/// Create a copy of GetListContactResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetListContactResponseCopyWith<GetListContactResponse> get copyWith => _$GetListContactResponseCopyWithImpl<GetListContactResponse>(this as GetListContactResponse, _$identity);

  /// Serializes this GetListContactResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetListContactResponse&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.syncTimestamp, syncTimestamp) || other.syncTimestamp == syncTimestamp)&&(identical(other.nextSyncTimestamp, nextSyncTimestamp) || other.nextSyncTimestamp == nextSyncTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contacts),syncTimestamp,nextSyncTimestamp);

@override
String toString() {
  return 'GetListContactResponse(contacts: $contacts, syncTimestamp: $syncTimestamp, nextSyncTimestamp: $nextSyncTimestamp)';
}


}

/// @nodoc
abstract mixin class $GetListContactResponseCopyWith<$Res>  {
  factory $GetListContactResponseCopyWith(GetListContactResponse value, $Res Function(GetListContactResponse) _then) = _$GetListContactResponseCopyWithImpl;
@useResult
$Res call({
 List<ContactEntity> contacts, String? syncTimestamp, String? nextSyncTimestamp
});




}
/// @nodoc
class _$GetListContactResponseCopyWithImpl<$Res>
    implements $GetListContactResponseCopyWith<$Res> {
  _$GetListContactResponseCopyWithImpl(this._self, this._then);

  final GetListContactResponse _self;
  final $Res Function(GetListContactResponse) _then;

/// Create a copy of GetListContactResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contacts = null,Object? syncTimestamp = freezed,Object? nextSyncTimestamp = freezed,}) {
  return _then(_self.copyWith(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,syncTimestamp: freezed == syncTimestamp ? _self.syncTimestamp : syncTimestamp // ignore: cast_nullable_to_non_nullable
as String?,nextSyncTimestamp: freezed == nextSyncTimestamp ? _self.nextSyncTimestamp : nextSyncTimestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetListContactResponse].
extension GetListContactResponsePatterns on GetListContactResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetListContactResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetListContactResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetListContactResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetListContactResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetListContactResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetListContactResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContactEntity> contacts,  String? syncTimestamp,  String? nextSyncTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetListContactResponse() when $default != null:
return $default(_that.contacts,_that.syncTimestamp,_that.nextSyncTimestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContactEntity> contacts,  String? syncTimestamp,  String? nextSyncTimestamp)  $default,) {final _that = this;
switch (_that) {
case _GetListContactResponse():
return $default(_that.contacts,_that.syncTimestamp,_that.nextSyncTimestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContactEntity> contacts,  String? syncTimestamp,  String? nextSyncTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _GetListContactResponse() when $default != null:
return $default(_that.contacts,_that.syncTimestamp,_that.nextSyncTimestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetListContactResponse implements GetListContactResponse {
  const _GetListContactResponse({required final  List<ContactEntity> contacts, this.syncTimestamp, this.nextSyncTimestamp}): _contacts = contacts;
  factory _GetListContactResponse.fromJson(Map<String, dynamic> json) => _$GetListContactResponseFromJson(json);

 final  List<ContactEntity> _contacts;
@override List<ContactEntity> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  String? syncTimestamp;
@override final  String? nextSyncTimestamp;

/// Create a copy of GetListContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetListContactResponseCopyWith<_GetListContactResponse> get copyWith => __$GetListContactResponseCopyWithImpl<_GetListContactResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetListContactResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetListContactResponse&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.syncTimestamp, syncTimestamp) || other.syncTimestamp == syncTimestamp)&&(identical(other.nextSyncTimestamp, nextSyncTimestamp) || other.nextSyncTimestamp == nextSyncTimestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contacts),syncTimestamp,nextSyncTimestamp);

@override
String toString() {
  return 'GetListContactResponse(contacts: $contacts, syncTimestamp: $syncTimestamp, nextSyncTimestamp: $nextSyncTimestamp)';
}


}

/// @nodoc
abstract mixin class _$GetListContactResponseCopyWith<$Res> implements $GetListContactResponseCopyWith<$Res> {
  factory _$GetListContactResponseCopyWith(_GetListContactResponse value, $Res Function(_GetListContactResponse) _then) = __$GetListContactResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ContactEntity> contacts, String? syncTimestamp, String? nextSyncTimestamp
});




}
/// @nodoc
class __$GetListContactResponseCopyWithImpl<$Res>
    implements _$GetListContactResponseCopyWith<$Res> {
  __$GetListContactResponseCopyWithImpl(this._self, this._then);

  final _GetListContactResponse _self;
  final $Res Function(_GetListContactResponse) _then;

/// Create a copy of GetListContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contacts = null,Object? syncTimestamp = freezed,Object? nextSyncTimestamp = freezed,}) {
  return _then(_GetListContactResponse(
contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,syncTimestamp: freezed == syncTimestamp ? _self.syncTimestamp : syncTimestamp // ignore: cast_nullable_to_non_nullable
as String?,nextSyncTimestamp: freezed == nextSyncTimestamp ? _self.nextSyncTimestamp : nextSyncTimestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
