// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactState {

 List<ContactEntity> get contacts; String? get apiResultMessage; bool? get updateDatabaseFinish;
/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactStateCopyWith<ContactState> get copyWith => _$ContactStateCopyWithImpl<ContactState>(this as ContactState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactState&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.apiResultMessage, apiResultMessage) || other.apiResultMessage == apiResultMessage)&&(identical(other.updateDatabaseFinish, updateDatabaseFinish) || other.updateDatabaseFinish == updateDatabaseFinish));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contacts),apiResultMessage,updateDatabaseFinish);

@override
String toString() {
  return 'ContactState(contacts: $contacts, apiResultMessage: $apiResultMessage, updateDatabaseFinish: $updateDatabaseFinish)';
}


}

/// @nodoc
abstract mixin class $ContactStateCopyWith<$Res>  {
  factory $ContactStateCopyWith(ContactState value, $Res Function(ContactState) _then) = _$ContactStateCopyWithImpl;
@useResult
$Res call({
 List<ContactEntity> contacts, String? apiResultMessage, bool? updateDatabaseFinish
});




}
/// @nodoc
class _$ContactStateCopyWithImpl<$Res>
    implements $ContactStateCopyWith<$Res> {
  _$ContactStateCopyWithImpl(this._self, this._then);

  final ContactState _self;
  final $Res Function(ContactState) _then;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contacts = null,Object? apiResultMessage = freezed,Object? updateDatabaseFinish = freezed,}) {
  return _then(_self.copyWith(
contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,apiResultMessage: freezed == apiResultMessage ? _self.apiResultMessage : apiResultMessage // ignore: cast_nullable_to_non_nullable
as String?,updateDatabaseFinish: freezed == updateDatabaseFinish ? _self.updateDatabaseFinish : updateDatabaseFinish // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactState].
extension ContactStatePatterns on ContactState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactState value)  $default,){
final _that = this;
switch (_that) {
case _ContactState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContactEntity> contacts,  String? apiResultMessage,  bool? updateDatabaseFinish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactState() when $default != null:
return $default(_that.contacts,_that.apiResultMessage,_that.updateDatabaseFinish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContactEntity> contacts,  String? apiResultMessage,  bool? updateDatabaseFinish)  $default,) {final _that = this;
switch (_that) {
case _ContactState():
return $default(_that.contacts,_that.apiResultMessage,_that.updateDatabaseFinish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContactEntity> contacts,  String? apiResultMessage,  bool? updateDatabaseFinish)?  $default,) {final _that = this;
switch (_that) {
case _ContactState() when $default != null:
return $default(_that.contacts,_that.apiResultMessage,_that.updateDatabaseFinish);case _:
  return null;

}
}

}

/// @nodoc


class _ContactState implements ContactState {
  const _ContactState({final  List<ContactEntity> contacts = const [], this.apiResultMessage, this.updateDatabaseFinish = false}): _contacts = contacts;
  

 final  List<ContactEntity> _contacts;
@override@JsonKey() List<ContactEntity> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  String? apiResultMessage;
@override@JsonKey() final  bool? updateDatabaseFinish;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactStateCopyWith<_ContactState> get copyWith => __$ContactStateCopyWithImpl<_ContactState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactState&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.apiResultMessage, apiResultMessage) || other.apiResultMessage == apiResultMessage)&&(identical(other.updateDatabaseFinish, updateDatabaseFinish) || other.updateDatabaseFinish == updateDatabaseFinish));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contacts),apiResultMessage,updateDatabaseFinish);

@override
String toString() {
  return 'ContactState(contacts: $contacts, apiResultMessage: $apiResultMessage, updateDatabaseFinish: $updateDatabaseFinish)';
}


}

/// @nodoc
abstract mixin class _$ContactStateCopyWith<$Res> implements $ContactStateCopyWith<$Res> {
  factory _$ContactStateCopyWith(_ContactState value, $Res Function(_ContactState) _then) = __$ContactStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContactEntity> contacts, String? apiResultMessage, bool? updateDatabaseFinish
});




}
/// @nodoc
class __$ContactStateCopyWithImpl<$Res>
    implements _$ContactStateCopyWith<$Res> {
  __$ContactStateCopyWithImpl(this._self, this._then);

  final _ContactState _self;
  final $Res Function(_ContactState) _then;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contacts = null,Object? apiResultMessage = freezed,Object? updateDatabaseFinish = freezed,}) {
  return _then(_ContactState(
contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,apiResultMessage: freezed == apiResultMessage ? _self.apiResultMessage : apiResultMessage // ignore: cast_nullable_to_non_nullable
as String?,updateDatabaseFinish: freezed == updateDatabaseFinish ? _self.updateDatabaseFinish : updateDatabaseFinish // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
