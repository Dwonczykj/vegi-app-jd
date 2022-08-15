import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'inventory_state.freezed.dart';
part 'inventory_state.g.dart';

@Freezed()
class InventoryState with _$InventoryState {
  const InventoryState._();

  @JsonSerializable()
  factory InventoryState({
    @Default([]) List<RestaurantMenuItem> restaurantItems,
  }) = _InventoryState;

  factory InventoryState.initial() => InventoryState(
        restaurantItems: [],
      );

  factory InventoryState.fromJson(dynamic json) =>
      _$InventoryStateFromJson(json);
}

class InventoryStateConverter
    implements JsonConverter<InventoryState, Map<String, dynamic>?> {
  const InventoryStateConverter();

  @override
  InventoryState fromJson(Map<String, dynamic>? json) =>
      json != null ? InventoryState.fromJson(json) : InventoryState.initial();

  @override
  Map<String, dynamic> toJson(InventoryState instance) => instance.toJson();
}
