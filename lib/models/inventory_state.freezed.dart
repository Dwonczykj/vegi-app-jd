// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryState _$InventoryStateFromJson(Map<String, dynamic> json) {
  return _InventoryState.fromJson(json);
}

/// @nodoc
mixin _$InventoryState {
  List<RestaurantMenuItem> get restaurantItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryStateCopyWith<InventoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) then) =
      _$InventoryStateCopyWithImpl<$Res>;
  $Res call({List<RestaurantMenuItem> restaurantItems});
}

/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._value, this._then);

  final InventoryState _value;
  // ignore: unused_field
  final $Res Function(InventoryState) _then;

  @override
  $Res call({
    Object? restaurantItems = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantItems: restaurantItems == freezed
          ? _value.restaurantItems
          : restaurantItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_InventoryStateCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory _$$_InventoryStateCopyWith(
          _$_InventoryState value, $Res Function(_$_InventoryState) then) =
      __$$_InventoryStateCopyWithImpl<$Res>;
  @override
  $Res call({List<RestaurantMenuItem> restaurantItems});
}

/// @nodoc
class __$$_InventoryStateCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res>
    implements _$$_InventoryStateCopyWith<$Res> {
  __$$_InventoryStateCopyWithImpl(
      _$_InventoryState _value, $Res Function(_$_InventoryState) _then)
      : super(_value, (v) => _then(v as _$_InventoryState));

  @override
  _$_InventoryState get _value => super._value as _$_InventoryState;

  @override
  $Res call({
    Object? restaurantItems = freezed,
  }) {
    return _then(_$_InventoryState(
      restaurantItems: restaurantItems == freezed
          ? _value.restaurantItems
          : restaurantItems // ignore: cast_nullable_to_non_nullable
              as List<RestaurantMenuItem>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_InventoryState extends _InventoryState {
  _$_InventoryState({this.restaurantItems = const []}) : super._();

  factory _$_InventoryState.fromJson(Map<String, dynamic> json) =>
      _$$_InventoryStateFromJson(json);

  @override
  @JsonKey()
  final List<RestaurantMenuItem> restaurantItems;

  @override
  String toString() {
    return 'InventoryState(restaurantItems: $restaurantItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryState &&
            const DeepCollectionEquality()
                .equals(other.restaurantItems, restaurantItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(restaurantItems));

  @JsonKey(ignore: true)
  @override
  _$$_InventoryStateCopyWith<_$_InventoryState> get copyWith =>
      __$$_InventoryStateCopyWithImpl<_$_InventoryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventoryStateToJson(this);
  }
}

abstract class _InventoryState extends InventoryState {
  factory _InventoryState({final List<RestaurantMenuItem> restaurantItems}) =
      _$_InventoryState;
  _InventoryState._() : super._();

  factory _InventoryState.fromJson(Map<String, dynamic> json) =
      _$_InventoryState.fromJson;

  @override
  List<RestaurantMenuItem> get restaurantItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InventoryStateCopyWith<_$_InventoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
