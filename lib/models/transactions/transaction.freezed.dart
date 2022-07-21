// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentTransaction _$PaymentTransactionFromJson(Map<String, dynamic> json) {
  return _PaymentTransaction.fromJson(json);
}

/// @nodoc
mixin _$PaymentTransaction {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'SenderAddress')
  String get senderAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReceiverAddress')
  String get receiverAddress => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  List<Token> get assetsUsed => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Price? get gRePTPriceInfo => throw _privateConstructorUsedError;
  num get fiatAmountOwed => throw _privateConstructorUsedError;
  BigInt get gRePTUsedWhole => throw _privateConstructorUsedError;
  int get gRePTUsedDecimals => throw _privateConstructorUsedError;
  BigInt get gRePTRewardedWhole => throw _privateConstructorUsedError;
  int get gRePTRewardedDecimals => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get communityAddress => throw _privateConstructorUsedError;
  String? get originNetwork => throw _privateConstructorUsedError;
  bool get voided => throw _privateConstructorUsedError;
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
  $PaymentTransactionCopyWith<PaymentTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTransactionCopyWith<$Res> {
  factory $PaymentTransactionCopyWith(
          PaymentTransaction value, $Res Function(PaymentTransaction) then) =
      _$PaymentTransactionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'SenderAddress') String senderAddress,
      @JsonKey(name: 'ReceiverAddress') String receiverAddress,
      String companyId,
      String companyName,
      List<Token> assetsUsed,
      List<Item> items,
      String address,
      Price? gRePTPriceInfo,
      num fiatAmountOwed,
      BigInt gRePTUsedWhole,
      int gRePTUsedDecimals,
      BigInt gRePTRewardedWhole,
      int gRePTRewardedDecimals,
      int timestamp,
      String? imageUrl,
      String? communityAddress,
      String? originNetwork,
      bool voided,
      num priceChange,
      @JsonKey(ignore: true) num priceDiff,
      @JsonKey(ignore: true) int priceDiffLimitInDays,
      @JsonKey(ignore: true) List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  $PriceCopyWith<$Res>? get gRePTPriceInfo;
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class _$PaymentTransactionCopyWithImpl<$Res>
    implements $PaymentTransactionCopyWith<$Res> {
  _$PaymentTransactionCopyWithImpl(this._value, this._then);

  final PaymentTransaction _value;
  // ignore: unused_field
  final $Res Function(PaymentTransaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderAddress = freezed,
    Object? receiverAddress = freezed,
    Object? companyId = freezed,
    Object? companyName = freezed,
    Object? assetsUsed = freezed,
    Object? items = freezed,
    Object? address = freezed,
    Object? gRePTPriceInfo = freezed,
    Object? fiatAmountOwed = freezed,
    Object? gRePTUsedWhole = freezed,
    Object? gRePTUsedDecimals = freezed,
    Object? gRePTRewardedWhole = freezed,
    Object? gRePTRewardedDecimals = freezed,
    Object? timestamp = freezed,
    Object? imageUrl = freezed,
    Object? communityAddress = freezed,
    Object? originNetwork = freezed,
    Object? voided = freezed,
    Object? priceChange = freezed,
    Object? priceDiff = freezed,
    Object? priceDiffLimitInDays = freezed,
    Object? stats = freezed,
    Object? walletActions = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderAddress: senderAddress == freezed
          ? _value.senderAddress
          : senderAddress // ignore: cast_nullable_to_non_nullable
              as String,
      receiverAddress: receiverAddress == freezed
          ? _value.receiverAddress
          : receiverAddress // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      assetsUsed: assetsUsed == freezed
          ? _value.assetsUsed
          : assetsUsed // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gRePTPriceInfo: gRePTPriceInfo == freezed
          ? _value.gRePTPriceInfo
          : gRePTPriceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      fiatAmountOwed: fiatAmountOwed == freezed
          ? _value.fiatAmountOwed
          : fiatAmountOwed // ignore: cast_nullable_to_non_nullable
              as num,
      gRePTUsedWhole: gRePTUsedWhole == freezed
          ? _value.gRePTUsedWhole
          : gRePTUsedWhole // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gRePTUsedDecimals: gRePTUsedDecimals == freezed
          ? _value.gRePTUsedDecimals
          : gRePTUsedDecimals // ignore: cast_nullable_to_non_nullable
              as int,
      gRePTRewardedWhole: gRePTRewardedWhole == freezed
          ? _value.gRePTRewardedWhole
          : gRePTRewardedWhole // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gRePTRewardedDecimals: gRePTRewardedDecimals == freezed
          ? _value.gRePTRewardedDecimals
          : gRePTRewardedDecimals // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      communityAddress: communityAddress == freezed
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      originNetwork: originNetwork == freezed
          ? _value.originNetwork
          : originNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      voided: voided == freezed
          ? _value.voided
          : voided // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $PriceCopyWith<$Res>? get gRePTPriceInfo {
    if (_value.gRePTPriceInfo == null) {
      return null;
    }

    return $PriceCopyWith<$Res>(_value.gRePTPriceInfo!, (value) {
      return _then(_value.copyWith(gRePTPriceInfo: value));
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
abstract class _$$_PaymentTransactionCopyWith<$Res>
    implements $PaymentTransactionCopyWith<$Res> {
  factory _$$_PaymentTransactionCopyWith(_$_PaymentTransaction value,
          $Res Function(_$_PaymentTransaction) then) =
      __$$_PaymentTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'SenderAddress') String senderAddress,
      @JsonKey(name: 'ReceiverAddress') String receiverAddress,
      String companyId,
      String companyName,
      List<Token> assetsUsed,
      List<Item> items,
      String address,
      Price? gRePTPriceInfo,
      num fiatAmountOwed,
      BigInt gRePTUsedWhole,
      int gRePTUsedDecimals,
      BigInt gRePTRewardedWhole,
      int gRePTRewardedDecimals,
      int timestamp,
      String? imageUrl,
      String? communityAddress,
      String? originNetwork,
      bool voided,
      num priceChange,
      @JsonKey(ignore: true) num priceDiff,
      @JsonKey(ignore: true) int priceDiffLimitInDays,
      @JsonKey(ignore: true) List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson) WalletActions? walletActions});

  @override
  $PriceCopyWith<$Res>? get gRePTPriceInfo;
  @override
  $WalletActionsCopyWith<$Res>? get walletActions;
}

/// @nodoc
class __$$_PaymentTransactionCopyWithImpl<$Res>
    extends _$PaymentTransactionCopyWithImpl<$Res>
    implements _$$_PaymentTransactionCopyWith<$Res> {
  __$$_PaymentTransactionCopyWithImpl(
      _$_PaymentTransaction _value, $Res Function(_$_PaymentTransaction) _then)
      : super(_value, (v) => _then(v as _$_PaymentTransaction));

  @override
  _$_PaymentTransaction get _value => super._value as _$_PaymentTransaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderAddress = freezed,
    Object? receiverAddress = freezed,
    Object? companyId = freezed,
    Object? companyName = freezed,
    Object? assetsUsed = freezed,
    Object? items = freezed,
    Object? address = freezed,
    Object? gRePTPriceInfo = freezed,
    Object? fiatAmountOwed = freezed,
    Object? gRePTUsedWhole = freezed,
    Object? gRePTUsedDecimals = freezed,
    Object? gRePTRewardedWhole = freezed,
    Object? gRePTRewardedDecimals = freezed,
    Object? timestamp = freezed,
    Object? imageUrl = freezed,
    Object? communityAddress = freezed,
    Object? originNetwork = freezed,
    Object? voided = freezed,
    Object? priceChange = freezed,
    Object? priceDiff = freezed,
    Object? priceDiffLimitInDays = freezed,
    Object? stats = freezed,
    Object? walletActions = freezed,
  }) {
    return _then(_$_PaymentTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderAddress: senderAddress == freezed
          ? _value.senderAddress
          : senderAddress // ignore: cast_nullable_to_non_nullable
              as String,
      receiverAddress: receiverAddress == freezed
          ? _value.receiverAddress
          : receiverAddress // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      assetsUsed: assetsUsed == freezed
          ? _value.assetsUsed
          : assetsUsed // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gRePTPriceInfo: gRePTPriceInfo == freezed
          ? _value.gRePTPriceInfo
          : gRePTPriceInfo // ignore: cast_nullable_to_non_nullable
              as Price?,
      fiatAmountOwed: fiatAmountOwed == freezed
          ? _value.fiatAmountOwed
          : fiatAmountOwed // ignore: cast_nullable_to_non_nullable
              as num,
      gRePTUsedWhole: gRePTUsedWhole == freezed
          ? _value.gRePTUsedWhole
          : gRePTUsedWhole // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gRePTUsedDecimals: gRePTUsedDecimals == freezed
          ? _value.gRePTUsedDecimals
          : gRePTUsedDecimals // ignore: cast_nullable_to_non_nullable
              as int,
      gRePTRewardedWhole: gRePTRewardedWhole == freezed
          ? _value.gRePTRewardedWhole
          : gRePTRewardedWhole // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gRePTRewardedDecimals: gRePTRewardedDecimals == freezed
          ? _value.gRePTRewardedDecimals
          : gRePTRewardedDecimals // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      communityAddress: communityAddress == freezed
          ? _value.communityAddress
          : communityAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      originNetwork: originNetwork == freezed
          ? _value.originNetwork
          : originNetwork // ignore: cast_nullable_to_non_nullable
              as String?,
      voided: voided == freezed
          ? _value.voided
          : voided // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$_PaymentTransaction extends _PaymentTransaction
    with DiagnosticableTreeMixin {
  _$_PaymentTransaction(
      {required this.id,
      @JsonKey(name: 'SenderAddress') required this.senderAddress,
      @JsonKey(name: 'ReceiverAddress') required this.receiverAddress,
      required this.companyId,
      required this.companyName,
      required this.assetsUsed,
      required this.items,
      required this.address,
      required this.gRePTPriceInfo,
      required this.fiatAmountOwed,
      required this.gRePTUsedWhole,
      required this.gRePTUsedDecimals,
      required this.gRePTRewardedWhole,
      required this.gRePTRewardedDecimals,
      required this.timestamp,
      this.imageUrl,
      this.communityAddress,
      this.originNetwork,
      this.voided = false,
      this.priceChange = 0,
      @JsonKey(ignore: true) this.priceDiff = 0,
      @JsonKey(ignore: true) this.priceDiffLimitInDays = 0,
      @JsonKey(ignore: true) this.stats = const [],
      @JsonKey(fromJson: walletActionsFromJson) this.walletActions})
      : super._();

  factory _$_PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentTransactionFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'SenderAddress')
  final String senderAddress;
  @override
  @JsonKey(name: 'ReceiverAddress')
  final String receiverAddress;
  @override
  final String companyId;
  @override
  final String companyName;
  @override
  final List<Token> assetsUsed;
  @override
  final List<Item> items;
  @override
  final String address;
  @override
  final Price? gRePTPriceInfo;
  @override
  final num fiatAmountOwed;
  @override
  final BigInt gRePTUsedWhole;
  @override
  final int gRePTUsedDecimals;
  @override
  final BigInt gRePTRewardedWhole;
  @override
  final int gRePTRewardedDecimals;
  @override
  final int timestamp;
  @override
  final String? imageUrl;
  @override
  final String? communityAddress;
  @override
  final String? originNetwork;
  @override
  @JsonKey()
  final bool voided;
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
    return 'PaymentTransaction(id: $id, senderAddress: $senderAddress, receiverAddress: $receiverAddress, companyId: $companyId, companyName: $companyName, assetsUsed: $assetsUsed, items: $items, address: $address, gRePTPriceInfo: $gRePTPriceInfo, fiatAmountOwed: $fiatAmountOwed, gRePTUsedWhole: $gRePTUsedWhole, gRePTUsedDecimals: $gRePTUsedDecimals, gRePTRewardedWhole: $gRePTRewardedWhole, gRePTRewardedDecimals: $gRePTRewardedDecimals, timestamp: $timestamp, imageUrl: $imageUrl, communityAddress: $communityAddress, originNetwork: $originNetwork, voided: $voided, priceChange: $priceChange, priceDiff: $priceDiff, priceDiffLimitInDays: $priceDiffLimitInDays, stats: $stats, walletActions: $walletActions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentTransaction'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('senderAddress', senderAddress))
      ..add(DiagnosticsProperty('receiverAddress', receiverAddress))
      ..add(DiagnosticsProperty('companyId', companyId))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('assetsUsed', assetsUsed))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('gRePTPriceInfo', gRePTPriceInfo))
      ..add(DiagnosticsProperty('fiatAmountOwed', fiatAmountOwed))
      ..add(DiagnosticsProperty('gRePTUsedWhole', gRePTUsedWhole))
      ..add(DiagnosticsProperty('gRePTUsedDecimals', gRePTUsedDecimals))
      ..add(DiagnosticsProperty('gRePTRewardedWhole', gRePTRewardedWhole))
      ..add(DiagnosticsProperty('gRePTRewardedDecimals', gRePTRewardedDecimals))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('communityAddress', communityAddress))
      ..add(DiagnosticsProperty('originNetwork', originNetwork))
      ..add(DiagnosticsProperty('voided', voided))
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
            other is _$_PaymentTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.senderAddress, senderAddress) &&
            const DeepCollectionEquality()
                .equals(other.receiverAddress, receiverAddress) &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality()
                .equals(other.assetsUsed, assetsUsed) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.gRePTPriceInfo, gRePTPriceInfo) &&
            const DeepCollectionEquality()
                .equals(other.fiatAmountOwed, fiatAmountOwed) &&
            const DeepCollectionEquality()
                .equals(other.gRePTUsedWhole, gRePTUsedWhole) &&
            const DeepCollectionEquality()
                .equals(other.gRePTUsedDecimals, gRePTUsedDecimals) &&
            const DeepCollectionEquality()
                .equals(other.gRePTRewardedWhole, gRePTRewardedWhole) &&
            const DeepCollectionEquality()
                .equals(other.gRePTRewardedDecimals, gRePTRewardedDecimals) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.communityAddress, communityAddress) &&
            const DeepCollectionEquality()
                .equals(other.originNetwork, originNetwork) &&
            const DeepCollectionEquality().equals(other.voided, voided) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(senderAddress),
        const DeepCollectionEquality().hash(receiverAddress),
        const DeepCollectionEquality().hash(companyId),
        const DeepCollectionEquality().hash(companyName),
        const DeepCollectionEquality().hash(assetsUsed),
        const DeepCollectionEquality().hash(items),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(gRePTPriceInfo),
        const DeepCollectionEquality().hash(fiatAmountOwed),
        const DeepCollectionEquality().hash(gRePTUsedWhole),
        const DeepCollectionEquality().hash(gRePTUsedDecimals),
        const DeepCollectionEquality().hash(gRePTRewardedWhole),
        const DeepCollectionEquality().hash(gRePTRewardedDecimals),
        const DeepCollectionEquality().hash(timestamp),
        const DeepCollectionEquality().hash(imageUrl),
        const DeepCollectionEquality().hash(communityAddress),
        const DeepCollectionEquality().hash(originNetwork),
        const DeepCollectionEquality().hash(voided),
        const DeepCollectionEquality().hash(priceChange),
        const DeepCollectionEquality().hash(priceDiff),
        const DeepCollectionEquality().hash(priceDiffLimitInDays),
        const DeepCollectionEquality().hash(stats),
        const DeepCollectionEquality().hash(walletActions)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_PaymentTransactionCopyWith<_$_PaymentTransaction> get copyWith =>
      __$$_PaymentTransactionCopyWithImpl<_$_PaymentTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentTransactionToJson(this);
  }
}

abstract class _PaymentTransaction extends PaymentTransaction {
  factory _PaymentTransaction(
      {required final String id,
      @JsonKey(name: 'SenderAddress')
          required final String senderAddress,
      @JsonKey(name: 'ReceiverAddress')
          required final String receiverAddress,
      required final String companyId,
      required final String companyName,
      required final List<Token> assetsUsed,
      required final List<Item> items,
      required final String address,
      required final Price? gRePTPriceInfo,
      required final num fiatAmountOwed,
      required final BigInt gRePTUsedWhole,
      required final int gRePTUsedDecimals,
      required final BigInt gRePTRewardedWhole,
      required final int gRePTRewardedDecimals,
      required final int timestamp,
      final String? imageUrl,
      final String? communityAddress,
      final String? originNetwork,
      final bool voided,
      final num priceChange,
      @JsonKey(ignore: true)
          final num priceDiff,
      @JsonKey(ignore: true)
          final int priceDiffLimitInDays,
      @JsonKey(ignore: true)
          final List<Stats> stats,
      @JsonKey(fromJson: walletActionsFromJson)
          final WalletActions? walletActions}) = _$_PaymentTransaction;
  _PaymentTransaction._() : super._();

  factory _PaymentTransaction.fromJson(Map<String, dynamic> json) =
      _$_PaymentTransaction.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'SenderAddress')
  String get senderAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ReceiverAddress')
  String get receiverAddress => throw _privateConstructorUsedError;
  @override
  String get companyId => throw _privateConstructorUsedError;
  @override
  String get companyName => throw _privateConstructorUsedError;
  @override
  List<Token> get assetsUsed => throw _privateConstructorUsedError;
  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  Price? get gRePTPriceInfo => throw _privateConstructorUsedError;
  @override
  num get fiatAmountOwed => throw _privateConstructorUsedError;
  @override
  BigInt get gRePTUsedWhole => throw _privateConstructorUsedError;
  @override
  int get gRePTUsedDecimals => throw _privateConstructorUsedError;
  @override
  BigInt get gRePTRewardedWhole => throw _privateConstructorUsedError;
  @override
  int get gRePTRewardedDecimals => throw _privateConstructorUsedError;
  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get communityAddress => throw _privateConstructorUsedError;
  @override
  String? get originNetwork => throw _privateConstructorUsedError;
  @override
  bool get voided => throw _privateConstructorUsedError;
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
  _$$_PaymentTransactionCopyWith<_$_PaymentTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
