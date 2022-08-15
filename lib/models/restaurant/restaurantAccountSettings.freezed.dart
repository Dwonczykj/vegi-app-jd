// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurantAccountSettings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantAccountSettings _$RestaurantAccountSettingsFromJson(
    Map<String, dynamic> json) {
  return _RestaurantAccountSettings.fromJson(json);
}

/// @nodoc
mixin _$RestaurantAccountSettings {
  String get employerRestaurantID => throw _privateConstructorUsedError;
  bool get hasInventoryManagementPermission =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantAccountSettingsCopyWith<RestaurantAccountSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantAccountSettingsCopyWith<$Res> {
  factory $RestaurantAccountSettingsCopyWith(RestaurantAccountSettings value,
          $Res Function(RestaurantAccountSettings) then) =
      _$RestaurantAccountSettingsCopyWithImpl<$Res>;
  $Res call(
      {String employerRestaurantID, bool hasInventoryManagementPermission});
}

/// @nodoc
class _$RestaurantAccountSettingsCopyWithImpl<$Res>
    implements $RestaurantAccountSettingsCopyWith<$Res> {
  _$RestaurantAccountSettingsCopyWithImpl(this._value, this._then);

  final RestaurantAccountSettings _value;
  // ignore: unused_field
  final $Res Function(RestaurantAccountSettings) _then;

  @override
  $Res call({
    Object? employerRestaurantID = freezed,
    Object? hasInventoryManagementPermission = freezed,
  }) {
    return _then(_value.copyWith(
      employerRestaurantID: employerRestaurantID == freezed
          ? _value.employerRestaurantID
          : employerRestaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      hasInventoryManagementPermission: hasInventoryManagementPermission ==
              freezed
          ? _value.hasInventoryManagementPermission
          : hasInventoryManagementPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RestaurantAccountSettingsCopyWith<$Res>
    implements $RestaurantAccountSettingsCopyWith<$Res> {
  factory _$$_RestaurantAccountSettingsCopyWith(
          _$_RestaurantAccountSettings value,
          $Res Function(_$_RestaurantAccountSettings) then) =
      __$$_RestaurantAccountSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String employerRestaurantID, bool hasInventoryManagementPermission});
}

/// @nodoc
class __$$_RestaurantAccountSettingsCopyWithImpl<$Res>
    extends _$RestaurantAccountSettingsCopyWithImpl<$Res>
    implements _$$_RestaurantAccountSettingsCopyWith<$Res> {
  __$$_RestaurantAccountSettingsCopyWithImpl(
      _$_RestaurantAccountSettings _value,
      $Res Function(_$_RestaurantAccountSettings) _then)
      : super(_value, (v) => _then(v as _$_RestaurantAccountSettings));

  @override
  _$_RestaurantAccountSettings get _value =>
      super._value as _$_RestaurantAccountSettings;

  @override
  $Res call({
    Object? employerRestaurantID = freezed,
    Object? hasInventoryManagementPermission = freezed,
  }) {
    return _then(_$_RestaurantAccountSettings(
      employerRestaurantID: employerRestaurantID == freezed
          ? _value.employerRestaurantID
          : employerRestaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      hasInventoryManagementPermission: hasInventoryManagementPermission ==
              freezed
          ? _value.hasInventoryManagementPermission
          : hasInventoryManagementPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_RestaurantAccountSettings implements _RestaurantAccountSettings {
  _$_RestaurantAccountSettings(
      {required this.employerRestaurantID,
      this.hasInventoryManagementPermission = false});

  factory _$_RestaurantAccountSettings.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantAccountSettingsFromJson(json);

  @override
  final String employerRestaurantID;
  @override
  @JsonKey()
  final bool hasInventoryManagementPermission;

  @override
  String toString() {
    return 'RestaurantAccountSettings(employerRestaurantID: $employerRestaurantID, hasInventoryManagementPermission: $hasInventoryManagementPermission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantAccountSettings &&
            const DeepCollectionEquality()
                .equals(other.employerRestaurantID, employerRestaurantID) &&
            const DeepCollectionEquality().equals(
                other.hasInventoryManagementPermission,
                hasInventoryManagementPermission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(employerRestaurantID),
      const DeepCollectionEquality().hash(hasInventoryManagementPermission));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantAccountSettingsCopyWith<_$_RestaurantAccountSettings>
      get copyWith => __$$_RestaurantAccountSettingsCopyWithImpl<
          _$_RestaurantAccountSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantAccountSettingsToJson(this);
  }
}

abstract class _RestaurantAccountSettings implements RestaurantAccountSettings {
  factory _RestaurantAccountSettings(
          {required final String employerRestaurantID,
          final bool hasInventoryManagementPermission}) =
      _$_RestaurantAccountSettings;

  factory _RestaurantAccountSettings.fromJson(Map<String, dynamic> json) =
      _$_RestaurantAccountSettings.fromJson;

  @override
  String get employerRestaurantID => throw _privateConstructorUsedError;
  @override
  bool get hasInventoryManagementPermission =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantAccountSettingsCopyWith<_$_RestaurantAccountSettings>
      get copyWith => throw _privateConstructorUsedError;
}
