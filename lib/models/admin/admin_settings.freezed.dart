// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'admin_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminSettings _$AdminSettingsFromJson(Map<String, dynamic> json) {
  return _AdminSettings.fromJson(json);
}

/// @nodoc
mixin _$AdminSettings {
  bool get isTestMerchantMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminSettingsCopyWith<AdminSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminSettingsCopyWith<$Res> {
  factory $AdminSettingsCopyWith(
          AdminSettings value, $Res Function(AdminSettings) then) =
      _$AdminSettingsCopyWithImpl<$Res>;
  $Res call({bool isTestMerchantMode});
}

/// @nodoc
class _$AdminSettingsCopyWithImpl<$Res>
    implements $AdminSettingsCopyWith<$Res> {
  _$AdminSettingsCopyWithImpl(this._value, this._then);

  final AdminSettings _value;
  // ignore: unused_field
  final $Res Function(AdminSettings) _then;

  @override
  $Res call({
    Object? isTestMerchantMode = freezed,
  }) {
    return _then(_value.copyWith(
      isTestMerchantMode: isTestMerchantMode == freezed
          ? _value.isTestMerchantMode
          : isTestMerchantMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AdminSettingsCopyWith<$Res>
    implements $AdminSettingsCopyWith<$Res> {
  factory _$$_AdminSettingsCopyWith(
          _$_AdminSettings value, $Res Function(_$_AdminSettings) then) =
      __$$_AdminSettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool isTestMerchantMode});
}

/// @nodoc
class __$$_AdminSettingsCopyWithImpl<$Res>
    extends _$AdminSettingsCopyWithImpl<$Res>
    implements _$$_AdminSettingsCopyWith<$Res> {
  __$$_AdminSettingsCopyWithImpl(
      _$_AdminSettings _value, $Res Function(_$_AdminSettings) _then)
      : super(_value, (v) => _then(v as _$_AdminSettings));

  @override
  _$_AdminSettings get _value => super._value as _$_AdminSettings;

  @override
  $Res call({
    Object? isTestMerchantMode = freezed,
  }) {
    return _then(_$_AdminSettings(
      isTestMerchantMode: isTestMerchantMode == freezed
          ? _value.isTestMerchantMode
          : isTestMerchantMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_AdminSettings implements _AdminSettings {
  _$_AdminSettings({this.isTestMerchantMode = false});

  factory _$_AdminSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AdminSettingsFromJson(json);

  @override
  @JsonKey()
  final bool isTestMerchantMode;

  @override
  String toString() {
    return 'AdminSettings(isTestMerchantMode: $isTestMerchantMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminSettings &&
            const DeepCollectionEquality()
                .equals(other.isTestMerchantMode, isTestMerchantMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isTestMerchantMode));

  @JsonKey(ignore: true)
  @override
  _$$_AdminSettingsCopyWith<_$_AdminSettings> get copyWith =>
      __$$_AdminSettingsCopyWithImpl<_$_AdminSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminSettingsToJson(this);
  }
}

abstract class _AdminSettings implements AdminSettings {
  factory _AdminSettings({final bool isTestMerchantMode}) = _$_AdminSettings;

  factory _AdminSettings.fromJson(Map<String, dynamic> json) =
      _$_AdminSettings.fromJson;

  @override
  bool get isTestMerchantMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AdminSettingsCopyWith<_$_AdminSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
