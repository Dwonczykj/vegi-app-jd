// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  BigInt get amount => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;
  bool get isNative => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get subtitle => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  Price? get priceInfo => throw _privateConstructorUsedError;
  String? get communityAddress => throw _privateConstructorUsedError;
  String? get originNetwork => throw _privateConstructorUsedError;
  num get priceChange => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  num get priceDiff => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get priceDiffLimitInDays => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Stats> get stats => throw _privateConstructorUsedError;
  @JsonKey(fromJson: walletActionsFromJson)
  WalletActions? get walletActions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String address,
      String name,
      String symbol,
      BigInt amount,
      int decimals,
      bool isNative,
      String? imageUrl,
      @JsonKey(ignore: true) String? subtitle,
      int? timestamp,
      Price? priceInfo,
      String? communityAddress,
      String? originNetwork,
      num priceChange,
      @JsonKey(ignore: true) num priceDiff,
      @JsonKey(ignore: true) int priceDiffLimitInDays,
      @JsonKey(ignore: true) List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  $PriceCopyWith<$Res>? get priceInfo;
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? amount = freezed,
    Object? decimals = freezed,
    Object? isNative = freezed,
    Object? imageUrl = freezed,
    Object? subtitle = freezed,
    Object? timestamp = freezed,
    Object? priceInfo = freezed,
    Object? communityAddress = freezed,
    Object? originNetwork = freezed,
    Object? priceChange = freezed,
    Object? priceDiff = freezed,
    Object? priceDiffLimitInDays = freezed,
    Object? stats = freezed,
    Object? walletActions = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: isNative == freezed
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      priceInfo: priceInfo == freezed
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      communityAddress: communityAddress == freezed
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      originNetwork: originNetwork == freezed
          ? _value.originNetwork
          : originNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChange: priceChange == freezed
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as num,
      priceDiff: priceDiff == freezed
          ? _value.priceDiff
          : priceDiff // ignore: cast_nullable_to_non_nullable
              as num,
      priceDiffLimitInDays: priceDiffLimitInDays == freezed
          ? _value.priceDiffLimitInDays
          : priceDiffLimitInDays // ignore: cast_nullable_to_non_nullable
              as int,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stats>,
      walletActions: walletActions == freezed
          ? _value.walletActions
          : walletActions // ignore: cast_nullable_to_non_nullable
              as WalletActions?,
    ));
  }

  @override
  $PriceCopyWith<$Res>? get priceInfo {
    if (_value.priceInfo == null) {
      return null;
    }

    return $PriceCopyWith<$Res>(_value.priceInfo!, (value) {
      return _then(_value.copyWith(priceInfo: value));
    });
  }

  @override
  $WalletActionsCopyWith<$Res>? get walletActions {
    if (_value.walletActions == null) {
      return null;
    }

    return $WalletActionsCopyWith<$Res>(_value.walletActions!, (value) {
      return _then(_value.copyWith(walletActions: value));
    });
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String address,
      String name,
      String symbol,
      BigInt amount,
      int decimals,
      bool isNative,
      String? imageUrl,
      @JsonKey(ignore: true) String? subtitle,
      int? timestamp,
      Price? priceInfo,
      String? communityAddress,
      String? originNetwork,
      num priceChange,
      @JsonKey(ignore: true) num priceDiff,
      @JsonKey(ignore: true) int priceDiffLimitInDays,
      @JsonKey(ignore: true) List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  @override
  $PriceCopyWith<$Res>? get priceInfo;
  @override
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? address = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? amount = freezed,
    Object? decimals = freezed,
    Object? isNative = freezed,
    Object? imageUrl = freezed,
    Object? subtitle = freezed,
    Object? timestamp = freezed,
    Object? priceInfo = freezed,
    Object? communityAddress = freezed,
    Object? originNetwork = freezed,
    Object? priceChange = freezed,
    Object? priceDiff = freezed,
    Object? priceDiffLimitInDays = freezed,
    Object? stats = freezed,
    Object? walletActions = freezed,
  }) {
    return _then(_$_Item(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BigInt,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      isNative: isNative == freezed
          ? _value.isNative
          : isNative // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      priceInfo: priceInfo == freezed
          ? _value.priceInfo
          : priceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      communityAddress: communityAddress == freezed
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      originNetwork: originNetwork == freezed
          ? _value.originNetwork
          : originNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChange: priceChange == freezed
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as num,
      priceDiff: priceDiff == freezed
          ? _value.priceDiff
          : priceDiff // ignore: cast_nullable_to_non_nullable
              as num,
      priceDiffLimitInDays: priceDiffLimitInDays == freezed
          ? _value.priceDiffLimitInDays
          : priceDiffLimitInDays // ignore: cast_nullable_to_non_nullable
              as int,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stats>,
      walletActions: walletActions == freezed
          ? _value.walletActions
          : walletActions // ignore: cast_nullable_to_non_nullable
              as WalletActions?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Item extends _Item with DiagnosticableTreeMixin {
  _$_Item(
      {required this.address,
      required this.name,
      required this.symbol,
      required this.amount,
      required this.decimals,
      this.isNative = false,
      this.imageUrl,
      @JsonKey(ignore: true) this.subtitle,
      this.timestamp,
      this.priceInfo,
      this.communityAddress,
      this.originNetwork,
      this.priceChange = 0,
      @JsonKey(ignore: true) this.priceDiff = 0,
      @JsonKey(ignore: true) this.priceDiffLimitInDays = 0,
      @JsonKey(ignore: true) this.stats = const [],
      @JsonKey(fromJson: walletActionsFromJson) this.walletActions})
      : super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String address;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final BigInt amount;
  @override
  final int decimals;
  @override
  @JsonKey()
  final bool isNative;
  @override
  final String? imageUrl;
  @override
  @JsonKey(ignore: true)
  final String? subtitle;
  @override
  final int? timestamp;
  @override
  final Price? priceInfo;
  @override
  final String? communityAddress;
  @override
  final String? originNetwork;
  @override
  @JsonKey()
  final num priceChange;
  @override
  @JsonKey(ignore: true)
  final num priceDiff;
  @override
  @JsonKey(ignore: true)
  final int priceDiffLimitInDays;
  @override
  @JsonKey(ignore: true)
  final List<Stats> stats;
  @override
  @JsonKey(fromJson: walletActionsFromJson)
  final WalletActions? walletActions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(address: $address, name: $name, symbol: $symbol, amount: $amount, decimals: $decimals, isNative: $isNative, imageUrl: $imageUrl, subtitle: $subtitle, timestamp: $timestamp, priceInfo: $priceInfo, communityAddress: $communityAddress, originNetwork: $originNetwork, priceChange: $priceChange, priceDiff: $priceDiff, priceDiffLimitInDays: $priceDiffLimitInDays, stats: $stats, walletActions: $walletActions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('decimals', decimals))
      ..add(DiagnosticsProperty('isNative', isNative))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('priceInfo', priceInfo))
      ..add(DiagnosticsProperty('communityAddress', communityAddress))
      ..add(DiagnosticsProperty('originNetwork', originNetwork))
      ..add(DiagnosticsProperty('priceChange', priceChange))
      ..add(DiagnosticsProperty('priceDiff', priceDiff))
      ..add(DiagnosticsProperty('priceDiffLimitInDays', priceDiffLimitInDays))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('walletActions', walletActions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.decimals, decimals) &&
            const DeepCollectionEquality().equals(other.isNative, isNative) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.priceInfo, priceInfo) &&
            const DeepCollectionEquality()
                .equals(other.communityAddress, communityAddress) &&
            const DeepCollectionEquality()
                .equals(other.originNetwork, originNetwork) &&
            const DeepCollectionEquality()
                .equals(other.priceChange, priceChange) &&
            const DeepCollectionEquality().equals(other.priceDiff, priceDiff) &&
            const DeepCollectionEquality()
                .equals(other.priceDiffLimitInDays, priceDiffLimitInDays) &&
            const DeepCollectionEquality().equals(other.stats, stats) &&
            const DeepCollectionEquality()
                .equals(other.walletActions, walletActions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(decimals),
      const DeepCollectionEquality().hash(isNative),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(priceInfo),
      const DeepCollectionEquality().hash(communityAddress),
      const DeepCollectionEquality().hash(originNetwork),
      const DeepCollectionEquality().hash(priceChange),
      const DeepCollectionEquality().hash(priceDiff),
      const DeepCollectionEquality().hash(priceDiffLimitInDays),
      const DeepCollectionEquality().hash(stats),
      const DeepCollectionEquality().hash(walletActions));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  factory _Item(
      {required final String address,
      required final String name,
      required final String symbol,
      required final BigInt amount,
      required final int decimals,
      final bool isNative,
      final String? imageUrl,
      @JsonKey(ignore: true)
          final String? subtitle,
      final int? timestamp,
      final Price? priceInfo,
      final String? communityAddress,
      final String? originNetwork,
      final num priceChange,
      @JsonKey(ignore: true)
          final num priceDiff,
      @JsonKey(ignore: true)
          final int priceDiffLimitInDays,
      @JsonKey(ignore: true)
          final List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson)
          final WalletActions? walletActions}) = _$_Item;
  _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get symbol => throw _privateConstructorUsedError;
  @override
  BigInt get amount => throw _privateConstructorUsedError;
  @override
  int get decimals => throw _privateConstructorUsedError;
  @override
  bool get isNative => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String? get subtitle => throw _privateConstructorUsedError;
  @override
  int? get timestamp => throw _privateConstructorUsedError;
  @override
  Price? get priceInfo => throw _privateConstructorUsedError;
  @override
  String? get communityAddress => throw _privateConstructorUsedError;
  @override
  String? get originNetwork => throw _privateConstructorUsedError;
  @override
  num get priceChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  num get priceDiff => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get priceDiffLimitInDays => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<Stats> get stats => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: walletActionsFromJson)
  WalletActions? get walletActions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
