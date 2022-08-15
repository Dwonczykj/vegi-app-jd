// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryState _$$_InventoryStateFromJson(Map<String, dynamic> json) =>
    _$_InventoryState(
      restaurantItems: (json['restaurantItems'] as List<dynamic>?)
              ?.map((e) => RestaurantMenuItem.fromJson(e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_InventoryStateToJson(_$_InventoryState instance) =>
    <String, dynamic>{
      'restaurantItems':
          instance.restaurantItems.map((e) => e.toJson()).toList(),
    };
