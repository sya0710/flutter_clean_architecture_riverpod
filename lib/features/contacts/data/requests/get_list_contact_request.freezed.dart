// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_list_contact_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetListContactRequest {

 String? get since;
/// Create a copy of GetListContactRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetListContactRequestCopyWith<GetListContactRequest> get copyWith => _$GetListContactRequestCopyWithImpl<GetListContactRequest>(this as GetListContactRequest, _$identity);

  /// Serializes this GetListContactRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetListContactRequest&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,since);

@override
String toString() {
  return 'GetListContactRequest(since: $since)';
}


}

/// @nodoc
abstract mixin class $GetListContactRequestCopyWith<$Res>  {
  factory $GetListContactRequestCopyWith(GetListContactRequest value, $Res Function(GetListContactRequest) _then) = _$GetListContactRequestCopyWithImpl;
@useResult
$Res call({
 String? since
});




}
/// @nodoc
class _$GetListContactRequestCopyWithImpl<$Res>
    implements $GetListContactRequestCopyWith<$Res> {
  _$GetListContactRequestCopyWithImpl(this._self, this._then);

  final GetListContactRequest _self;
  final $Res Function(GetListContactRequest) _then;

/// Create a copy of GetListContactRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? since = freezed,}) {
  return _then(_self.copyWith(
since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetListContactRequest].
extension GetListContactRequestPatterns on GetListContactRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetListContactRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetListContactRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetListContactRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetListContactRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetListContactRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetListContactRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? since)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetListContactRequest() when $default != null:
return $default(_that.since);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? since)  $default,) {final _that = this;
switch (_that) {
case _GetListContactRequest():
return $default(_that.since);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? since)?  $default,) {final _that = this;
switch (_that) {
case _GetListContactRequest() when $default != null:
return $default(_that.since);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetListContactRequest implements GetListContactRequest {
  const _GetListContactRequest({this.since});
  factory _GetListContactRequest.fromJson(Map<String, dynamic> json) => _$GetListContactRequestFromJson(json);

@override final  String? since;

/// Create a copy of GetListContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetListContactRequestCopyWith<_GetListContactRequest> get copyWith => __$GetListContactRequestCopyWithImpl<_GetListContactRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetListContactRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetListContactRequest&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,since);

@override
String toString() {
  return 'GetListContactRequest(since: $since)';
}


}

/// @nodoc
abstract mixin class _$GetListContactRequestCopyWith<$Res> implements $GetListContactRequestCopyWith<$Res> {
  factory _$GetListContactRequestCopyWith(_GetListContactRequest value, $Res Function(_GetListContactRequest) _then) = __$GetListContactRequestCopyWithImpl;
@override @useResult
$Res call({
 String? since
});




}
/// @nodoc
class __$GetListContactRequestCopyWithImpl<$Res>
    implements _$GetListContactRequestCopyWith<$Res> {
  __$GetListContactRequestCopyWithImpl(this._self, this._then);

  final _GetListContactRequest _self;
  final $Res Function(_GetListContactRequest) _then;

/// Create a copy of GetListContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? since = freezed,}) {
  return _then(_GetListContactRequest(
since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
