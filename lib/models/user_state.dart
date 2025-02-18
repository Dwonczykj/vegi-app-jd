import 'package:contacts_service/contacts_service.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/admin/admin_settings.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/wallet/wallet_modules.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

String currencyJson(String? currency) => currency == null ? 'usd' : currency;

authTypeFromJson(String auth) =>
    EnumToString.fromString(BiometricAuth.values, auth);

Locale localeFromJson(Map<String, dynamic>? map) => map == null
    ? Locale('en', 'US')
    : Locale(map['languageCode'], map['countryCode']);

Map<String, dynamic> adminSettingsToJson(AdminSettings? adminSettings) =>
    adminSettings?.toJson() ?? {};

Map<String, dynamic> localeToJson(Locale? locale) => locale == null
    ? {'languageCode': 'en', 'countryCode': 'US'}
    : {'languageCode': locale.languageCode, 'countryCode': locale.countryCode};

@Freezed()
class UserState with _$UserState {
  const UserState._();

  @JsonSerializable()
  factory UserState({
    DateTime? installedAt,
    @Default(null) bool? isContactsSynced,
    @Default(false) bool isLoggedOut,
    @Default(false) bool backup,
    @Default(false) bool? depositBannerShowed,
    @Default(false) bool? homeBackupDialogShowed,
    @Default('') String walletAddress,
    @Default([]) List<String> networks,
    @Default([]) List<String> mnemonic,
    @Default('') String privateKey,
    @Default('') String pincode,
    @Default('') String accountAddress,
    @Default('') String countryCode,
    @Default('') String phoneNumber,
    @Default(false) bool receiveBackupDialogShowed,
    @Default(false) bool warnSendDialogShowed,
    @Default('') String isoCode,
    @Default('') String jwtToken,
    @Default('Anom') String displayName,
    @Default('') String avatarUrl,
    @Default('') String email,
    @Default(null) String? verificationId,
    @Default('') String identifier,
    @Default([]) List<String> syncedContacts,
    @Default({}) Map<String, String> reverseContacts,
    @Default(null) @JsonKey(ignore: true) dynamic signupErrorMessage,
    @Default(null) @JsonKey(ignore: true) dynamic verifyErrorMessage,
    @JsonKey(fromJson: currencyJson) @Default('usd') String currency,
    @JsonKey(ignore: true) @Default(false) bool isLoginRequest,
    @JsonKey(ignore: true) @Default(false) bool isVerifyRequest,
    @Default(BiometricAuth.none)
    @JsonKey(fromJson: authTypeFromJson, toJson: EnumToString.convertToString)
        BiometricAuth authType,
    @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
    @Default(null)
        Locale? locale,
    @JsonKey(ignore: true) @Default([]) List<Contact> contacts,
    @Default(null) @JsonKey(ignore: true) PhoneAuthCredential? credentials,
    WalletModules? walletModules,
    @Default([]) List<DeliveryAddresses> listOfDeliveryAddresses,
    @Default(false) bool hasSavedSeedPhrase,
    @Default("") String initialLoginDateTime,
    @Default(false) bool showSeedPhraseBanner,
    @JsonKey(toJson: adminSettingsToJson) AdminSettings? adminSettings,
  }) = _UserState;

  factory UserState.initial() => UserState(
        networks: [],
        mnemonic: [],
        contacts: [],
        syncedContacts: [],
        reverseContacts: Map<String, String>(),
        displayName: "Anom",
        backup: false,
        authType: BiometricAuth.none,
        receiveBackupDialogShowed: false,
        homeBackupDialogShowed: false,
        currency: 'usd',
        listOfDeliveryAddresses: [],
        adminSettings: null,
      );

  factory UserState.fromJson(dynamic json) => _$UserStateFromJson(json);

  bool checkIfAdmin() {
    bool isAdmin = false;
    try {
      final admin_address = dotenv.get('TEMP_ADMIN_ADDRESSES');
      if (admin_address.contains(',')) {
        isAdmin =
            admin_address.toLowerCase().split(',').contains(accountAddress);
      } else {
        isAdmin = admin_address.toLowerCase() == accountAddress;
      }
      return isAdmin;
    } catch (e, s) {
      log.error('ERROR - UserState.checkIfAdmin $e');
      Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - UserState.checkIfAdmin $e',
      );
    }
    ;
    return isAdmin;
  }
}

class UserStateConverter
    implements JsonConverter<UserState, Map<String, dynamic>?> {
  const UserStateConverter();

  @override
  UserState fromJson(Map<String, dynamic>? json) =>
      json != null ? UserState.fromJson(json) : UserState.initial();

  @override
  Map<String, dynamic> toJson(UserState instance) => instance.toJson();
}
