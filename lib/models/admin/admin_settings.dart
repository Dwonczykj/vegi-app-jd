import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_settings.freezed.dart';
part 'admin_settings.g.dart';

@immutable
@Freezed()
class AdminSettings with _$AdminSettings {
  @JsonSerializable()
  factory AdminSettings({
    @Default(false) bool isTestMerchantMode,
  }) = _AdminSettings;

  factory AdminSettings.fromJson(Map<String, dynamic> json) =>
      _$AdminSettingsFromJson(json);
}
