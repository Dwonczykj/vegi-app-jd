// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullfilmentMethods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullfilmentMethods _$$_FullfilmentMethodsFromJson(
        Map<String, dynamic> json) =>
    _$_FullfilmentMethods(
      collectionMethod: json['collectionMethod'] as Map<String, dynamic>?,
      deliveryMethod: json['deliveryMethod'] as Map<String, dynamic>?,
      collectionSlots: (json['collectionSlots'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      deliverySlots: (json['deliverySlots'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      eligibleCollectionDates: EligibleOrderDates.fromJson(
          json['eligibleCollectionDates'] as Map<String, dynamic>),
      eligibleDeliveryDates: EligibleOrderDates.fromJson(
          json['eligibleDeliveryDates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FullfilmentMethodsToJson(
        _$_FullfilmentMethods instance) =>
    <String, dynamic>{
      'collectionMethod': instance.collectionMethod,
      'deliveryMethod': instance.deliveryMethod,
      'collectionSlots': instance.collectionSlots,
      'deliverySlots': instance.deliverySlots,
      'eligibleCollectionDates': instance.eligibleCollectionDates.toJson(),
      'eligibleDeliveryDates': instance.eligibleDeliveryDates.toJson(),
    };
