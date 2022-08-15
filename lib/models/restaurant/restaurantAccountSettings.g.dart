// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantAccountSettings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantAccountSettings _$$_RestaurantAccountSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_RestaurantAccountSettings(
      employerRestaurantID: json['employerRestaurantID'] as String,
      hasInventoryManagementPermission:
          json['hasInventoryManagementPermission'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RestaurantAccountSettingsToJson(
        _$_RestaurantAccountSettings instance) =>
    <String, dynamic>{
      'employerRestaurantID': instance.employerRestaurantID,
      'hasInventoryManagementPermission':
          instance.hasInventoryManagementPermission,
    };
