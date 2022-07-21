// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentRequest _$$_PaymentRequestFromJson(Map<String, dynamic> json) =>
    _$_PaymentRequest(
      paymentId: json['PaymentId'] as String,
      amount: json['Amount'] as num,
      items: (json['Items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaymentRequestToJson(_$_PaymentRequest instance) =>
    <String, dynamic>{
      'PaymentId': instance.paymentId,
      'Amount': instance.amount,
      'Items': instance.items.map((e) => e.toJson()).toList(),
    };
