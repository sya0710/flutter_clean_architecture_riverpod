// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureFlags {

// ── Booleans ─────────────────────────────────────────────────────────
 bool get enableNewDashboard; bool get enableDarkMode; bool get enableChat; bool get enableForceUpdate; bool get enableMaintenance;// ── Strings ───────────────────────────────────────────────────────────
 String get maintenanceMessage; String get appMinVersion; String get announcementUrl;// ── Numbers ───────────────────────────────────────────────────────────
 int get maxContactSyncBatch; int get syncIntervalSeconds;
/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureFlagsCopyWith<FeatureFlags> get copyWith => _$FeatureFlagsCopyWithImpl<FeatureFlags>(this as FeatureFlags, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureFlags&&(identical(other.enableNewDashboard, enableNewDashboard) || other.enableNewDashboard == enableNewDashboard)&&(identical(other.enableDarkMode, enableDarkMode) || other.enableDarkMode == enableDarkMode)&&(identical(other.enableChat, enableChat) || other.enableChat == enableChat)&&(identical(other.enableForceUpdate, enableForceUpdate) || other.enableForceUpdate == enableForceUpdate)&&(identical(other.enableMaintenance, enableMaintenance) || other.enableMaintenance == enableMaintenance)&&(identical(other.maintenanceMessage, maintenanceMessage) || other.maintenanceMessage == maintenanceMessage)&&(identical(other.appMinVersion, appMinVersion) || other.appMinVersion == appMinVersion)&&(identical(other.announcementUrl, announcementUrl) || other.announcementUrl == announcementUrl)&&(identical(other.maxContactSyncBatch, maxContactSyncBatch) || other.maxContactSyncBatch == maxContactSyncBatch)&&(identical(other.syncIntervalSeconds, syncIntervalSeconds) || other.syncIntervalSeconds == syncIntervalSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,enableNewDashboard,enableDarkMode,enableChat,enableForceUpdate,enableMaintenance,maintenanceMessage,appMinVersion,announcementUrl,maxContactSyncBatch,syncIntervalSeconds);

@override
String toString() {
  return 'FeatureFlags(enableNewDashboard: $enableNewDashboard, enableDarkMode: $enableDarkMode, enableChat: $enableChat, enableForceUpdate: $enableForceUpdate, enableMaintenance: $enableMaintenance, maintenanceMessage: $maintenanceMessage, appMinVersion: $appMinVersion, announcementUrl: $announcementUrl, maxContactSyncBatch: $maxContactSyncBatch, syncIntervalSeconds: $syncIntervalSeconds)';
}


}

/// @nodoc
abstract mixin class $FeatureFlagsCopyWith<$Res>  {
  factory $FeatureFlagsCopyWith(FeatureFlags value, $Res Function(FeatureFlags) _then) = _$FeatureFlagsCopyWithImpl;
@useResult
$Res call({
 bool enableNewDashboard, bool enableDarkMode, bool enableChat, bool enableForceUpdate, bool enableMaintenance, String maintenanceMessage, String appMinVersion, String announcementUrl, int maxContactSyncBatch, int syncIntervalSeconds
});




}
/// @nodoc
class _$FeatureFlagsCopyWithImpl<$Res>
    implements $FeatureFlagsCopyWith<$Res> {
  _$FeatureFlagsCopyWithImpl(this._self, this._then);

  final FeatureFlags _self;
  final $Res Function(FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enableNewDashboard = null,Object? enableDarkMode = null,Object? enableChat = null,Object? enableForceUpdate = null,Object? enableMaintenance = null,Object? maintenanceMessage = null,Object? appMinVersion = null,Object? announcementUrl = null,Object? maxContactSyncBatch = null,Object? syncIntervalSeconds = null,}) {
  return _then(_self.copyWith(
enableNewDashboard: null == enableNewDashboard ? _self.enableNewDashboard : enableNewDashboard // ignore: cast_nullable_to_non_nullable
as bool,enableDarkMode: null == enableDarkMode ? _self.enableDarkMode : enableDarkMode // ignore: cast_nullable_to_non_nullable
as bool,enableChat: null == enableChat ? _self.enableChat : enableChat // ignore: cast_nullable_to_non_nullable
as bool,enableForceUpdate: null == enableForceUpdate ? _self.enableForceUpdate : enableForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,enableMaintenance: null == enableMaintenance ? _self.enableMaintenance : enableMaintenance // ignore: cast_nullable_to_non_nullable
as bool,maintenanceMessage: null == maintenanceMessage ? _self.maintenanceMessage : maintenanceMessage // ignore: cast_nullable_to_non_nullable
as String,appMinVersion: null == appMinVersion ? _self.appMinVersion : appMinVersion // ignore: cast_nullable_to_non_nullable
as String,announcementUrl: null == announcementUrl ? _self.announcementUrl : announcementUrl // ignore: cast_nullable_to_non_nullable
as String,maxContactSyncBatch: null == maxContactSyncBatch ? _self.maxContactSyncBatch : maxContactSyncBatch // ignore: cast_nullable_to_non_nullable
as int,syncIntervalSeconds: null == syncIntervalSeconds ? _self.syncIntervalSeconds : syncIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureFlags].
extension FeatureFlagsPatterns on FeatureFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureFlags value)  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureFlags value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enableNewDashboard,  bool enableDarkMode,  bool enableChat,  bool enableForceUpdate,  bool enableMaintenance,  String maintenanceMessage,  String appMinVersion,  String announcementUrl,  int maxContactSyncBatch,  int syncIntervalSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.enableNewDashboard,_that.enableDarkMode,_that.enableChat,_that.enableForceUpdate,_that.enableMaintenance,_that.maintenanceMessage,_that.appMinVersion,_that.announcementUrl,_that.maxContactSyncBatch,_that.syncIntervalSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enableNewDashboard,  bool enableDarkMode,  bool enableChat,  bool enableForceUpdate,  bool enableMaintenance,  String maintenanceMessage,  String appMinVersion,  String announcementUrl,  int maxContactSyncBatch,  int syncIntervalSeconds)  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags():
return $default(_that.enableNewDashboard,_that.enableDarkMode,_that.enableChat,_that.enableForceUpdate,_that.enableMaintenance,_that.maintenanceMessage,_that.appMinVersion,_that.announcementUrl,_that.maxContactSyncBatch,_that.syncIntervalSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enableNewDashboard,  bool enableDarkMode,  bool enableChat,  bool enableForceUpdate,  bool enableMaintenance,  String maintenanceMessage,  String appMinVersion,  String announcementUrl,  int maxContactSyncBatch,  int syncIntervalSeconds)?  $default,) {final _that = this;
switch (_that) {
case _FeatureFlags() when $default != null:
return $default(_that.enableNewDashboard,_that.enableDarkMode,_that.enableChat,_that.enableForceUpdate,_that.enableMaintenance,_that.maintenanceMessage,_that.appMinVersion,_that.announcementUrl,_that.maxContactSyncBatch,_that.syncIntervalSeconds);case _:
  return null;

}
}

}

/// @nodoc


class _FeatureFlags implements FeatureFlags {
  const _FeatureFlags({this.enableNewDashboard = false, this.enableDarkMode = true, this.enableChat = false, this.enableForceUpdate = false, this.enableMaintenance = false, this.maintenanceMessage = '', this.appMinVersion = '1.0.0', this.announcementUrl = '', this.maxContactSyncBatch = 500, this.syncIntervalSeconds = 300});
  

// ── Booleans ─────────────────────────────────────────────────────────
@override@JsonKey() final  bool enableNewDashboard;
@override@JsonKey() final  bool enableDarkMode;
@override@JsonKey() final  bool enableChat;
@override@JsonKey() final  bool enableForceUpdate;
@override@JsonKey() final  bool enableMaintenance;
// ── Strings ───────────────────────────────────────────────────────────
@override@JsonKey() final  String maintenanceMessage;
@override@JsonKey() final  String appMinVersion;
@override@JsonKey() final  String announcementUrl;
// ── Numbers ───────────────────────────────────────────────────────────
@override@JsonKey() final  int maxContactSyncBatch;
@override@JsonKey() final  int syncIntervalSeconds;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureFlagsCopyWith<_FeatureFlags> get copyWith => __$FeatureFlagsCopyWithImpl<_FeatureFlags>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureFlags&&(identical(other.enableNewDashboard, enableNewDashboard) || other.enableNewDashboard == enableNewDashboard)&&(identical(other.enableDarkMode, enableDarkMode) || other.enableDarkMode == enableDarkMode)&&(identical(other.enableChat, enableChat) || other.enableChat == enableChat)&&(identical(other.enableForceUpdate, enableForceUpdate) || other.enableForceUpdate == enableForceUpdate)&&(identical(other.enableMaintenance, enableMaintenance) || other.enableMaintenance == enableMaintenance)&&(identical(other.maintenanceMessage, maintenanceMessage) || other.maintenanceMessage == maintenanceMessage)&&(identical(other.appMinVersion, appMinVersion) || other.appMinVersion == appMinVersion)&&(identical(other.announcementUrl, announcementUrl) || other.announcementUrl == announcementUrl)&&(identical(other.maxContactSyncBatch, maxContactSyncBatch) || other.maxContactSyncBatch == maxContactSyncBatch)&&(identical(other.syncIntervalSeconds, syncIntervalSeconds) || other.syncIntervalSeconds == syncIntervalSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,enableNewDashboard,enableDarkMode,enableChat,enableForceUpdate,enableMaintenance,maintenanceMessage,appMinVersion,announcementUrl,maxContactSyncBatch,syncIntervalSeconds);

@override
String toString() {
  return 'FeatureFlags(enableNewDashboard: $enableNewDashboard, enableDarkMode: $enableDarkMode, enableChat: $enableChat, enableForceUpdate: $enableForceUpdate, enableMaintenance: $enableMaintenance, maintenanceMessage: $maintenanceMessage, appMinVersion: $appMinVersion, announcementUrl: $announcementUrl, maxContactSyncBatch: $maxContactSyncBatch, syncIntervalSeconds: $syncIntervalSeconds)';
}


}

/// @nodoc
abstract mixin class _$FeatureFlagsCopyWith<$Res> implements $FeatureFlagsCopyWith<$Res> {
  factory _$FeatureFlagsCopyWith(_FeatureFlags value, $Res Function(_FeatureFlags) _then) = __$FeatureFlagsCopyWithImpl;
@override @useResult
$Res call({
 bool enableNewDashboard, bool enableDarkMode, bool enableChat, bool enableForceUpdate, bool enableMaintenance, String maintenanceMessage, String appMinVersion, String announcementUrl, int maxContactSyncBatch, int syncIntervalSeconds
});




}
/// @nodoc
class __$FeatureFlagsCopyWithImpl<$Res>
    implements _$FeatureFlagsCopyWith<$Res> {
  __$FeatureFlagsCopyWithImpl(this._self, this._then);

  final _FeatureFlags _self;
  final $Res Function(_FeatureFlags) _then;

/// Create a copy of FeatureFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enableNewDashboard = null,Object? enableDarkMode = null,Object? enableChat = null,Object? enableForceUpdate = null,Object? enableMaintenance = null,Object? maintenanceMessage = null,Object? appMinVersion = null,Object? announcementUrl = null,Object? maxContactSyncBatch = null,Object? syncIntervalSeconds = null,}) {
  return _then(_FeatureFlags(
enableNewDashboard: null == enableNewDashboard ? _self.enableNewDashboard : enableNewDashboard // ignore: cast_nullable_to_non_nullable
as bool,enableDarkMode: null == enableDarkMode ? _self.enableDarkMode : enableDarkMode // ignore: cast_nullable_to_non_nullable
as bool,enableChat: null == enableChat ? _self.enableChat : enableChat // ignore: cast_nullable_to_non_nullable
as bool,enableForceUpdate: null == enableForceUpdate ? _self.enableForceUpdate : enableForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,enableMaintenance: null == enableMaintenance ? _self.enableMaintenance : enableMaintenance // ignore: cast_nullable_to_non_nullable
as bool,maintenanceMessage: null == maintenanceMessage ? _self.maintenanceMessage : maintenanceMessage // ignore: cast_nullable_to_non_nullable
as String,appMinVersion: null == appMinVersion ? _self.appMinVersion : appMinVersion // ignore: cast_nullable_to_non_nullable
as String,announcementUrl: null == announcementUrl ? _self.announcementUrl : announcementUrl // ignore: cast_nullable_to_non_nullable
as String,maxContactSyncBatch: null == maxContactSyncBatch ? _self.maxContactSyncBatch : maxContactSyncBatch // ignore: cast_nullable_to_non_nullable
as int,syncIntervalSeconds: null == syncIntervalSeconds ? _self.syncIntervalSeconds : syncIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
