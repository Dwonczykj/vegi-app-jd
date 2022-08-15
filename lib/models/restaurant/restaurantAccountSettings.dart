import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurantAccountSettings.freezed.dart';
part 'restaurantAccountSettings.g.dart';

@immutable
@Freezed()
class RestaurantAccountSettings with _$RestaurantAccountSettings {
  @JsonSerializable()
  factory RestaurantAccountSettings({
    required String employerRestaurantID,
    @Default(false) bool hasInventoryManagementPermission,
  }) = _RestaurantAccountSettings;

  factory RestaurantAccountSettings.fromJson(Map<String, dynamic> json) =>
      _$RestaurantAccountSettingsFromJson(json);
}
