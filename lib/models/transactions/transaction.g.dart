// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentTransaction _$$_PaymentTransactionFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentTransaction(
      id: json['id'] as String,
      senderAddress: json['SenderAddress'] as String,
      receiverAddress: json['ReceiverAddress'] as String,
      companyId: json['companyId'] as String,
      companyName: json['companyName'] as String,
      assetsUsed: (json['assetsUsed'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
      gRePTPriceInfo: json['gRePTPriceInfo'] == null
          ? null
          : Price.fromJson(json['gRePTPriceInfo'] as Map<String, dynamic>),
      fiatAmountOwed: json['fiatAmountOwed'] as num,
      gRePTUsedWhole: BigInt.parse(json['gRePTUsedWhole'] as String),
      gRePTUsedDecimals: json['gRePTUsedDecimals'] as int,
      gRePTRewardedWhole: BigInt.parse(json['gRePTRewardedWhole'] as String),
      gRePTRewardedDecimals: json['gRePTRewardedDecimals'] as int,
      timestamp: json['timestamp'] as int,
      imageUrl: json['imageUrl'] as String?,
      communityAddress: json['communityAddress'] as String?,
      originNetwork: json['originNetwork'] as String?,
      voided: json['voided'] as bool? ?? false,
      priceChange: json['priceChange'] as num? ?? 0,
      walletActions:
          walletActionsFromJson(json['walletActions'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_PaymentTransactionToJson(
        _$_PaymentTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SenderAddress': instance.senderAddress,
      'ReceiverAddress': instance.receiverAddress,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'assetsUsed': instance.assetsUsed.map((e) => e.toJson()).toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'address': instance.address,
      'gRePTPriceInfo': instance.gRePTPriceInfo?.toJson(),
      'fiatAmountOwed': instance.fiatAmountOwed,
      'gRePTUsedWhole': instance.gRePTUsedWhole.toString(),
      'gRePTUsedDecimals': instance.gRePTUsedDecimals,
      'gRePTRewardedWhole': instance.gRePTRewardedWhole.toString(),
      'gRePTRewardedDecimals': instance.gRePTRewardedDecimals,
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
      'communityAddress': instance.communityAddress,
      'originNetwork': instance.originNetwork,
      'voided': instance.voided,
      'priceChange': instance.priceChange,
      'walletActions': instance.walletActions?.toJson(),
    };
