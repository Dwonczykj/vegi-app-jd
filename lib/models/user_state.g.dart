// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      installedAt: json['installedAt'] == null
          ? null
          : DateTime.parse(json['installedAt'] as String),
      isContactsSynced: json['isContactsSynced'] as bool? ?? null,
      isLoggedOut: json['isLoggedOut'] as bool? ?? false,
      backup: json['backup'] as bool? ?? false,
      depositBannerShowed: json['depositBannerShowed'] as bool? ?? false,
      homeBackupDialogShowed: json['homeBackupDialogShowed'] as bool? ?? false,
      walletAddress: json['walletAddress'] as String? ?? '',
      networks: (json['networks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mnemonic: (json['mnemonic'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      privateKey: json['privateKey'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      accountAddress: json['accountAddress'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      receiveBackupDialogShowed:
          json['receiveBackupDialogShowed'] as bool? ?? false,
      warnSendDialogShowed: json['warnSendDialogShowed'] as bool? ?? false,
      isoCode: json['isoCode'] as String? ?? '',
      jwtToken: json['jwtToken'] as String? ?? '',
      displayName: json['displayName'] as String? ?? 'Anom',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      email: json['email'] as String? ?? '',
      verificationId: json['verificationId'] as String? ?? null,
      identifier: json['identifier'] as String? ?? '',
      syncedContacts: (json['syncedContacts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      reverseContacts: (json['reverseContacts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      currency: json['currency'] == null
          ? 'usd'
          : currencyJson(json['currency'] as String?),
      authType: json['authType'] == null
          ? BiometricAuth.none
          : authTypeFromJson(json['authType'] as String),
      locale: json['locale'] == null
          ? null
          : localeFromJson(json['locale'] as Map<String, dynamic>?),
      walletModules: json['walletModules'] == null
          ? null
          : WalletModules.fromJson(
              json['walletModules'] as Map<String, dynamic>),
      listOfDeliveryAddresses:
          (json['listOfDeliveryAddresses'] as List<dynamic>?)
                  ?.map((e) => DeliveryAddresses.fromJson(e))
                  .toList() ??
              const [],
      hasSavedSeedPhrase: json['hasSavedSeedPhrase'] as bool? ?? false,
      initialLoginDateTime: json['initialLoginDateTime'] as String? ?? "",
      showSeedPhraseBanner: json['showSeedPhraseBanner'] as bool? ?? false,
      adminSettings: json['adminSettings'] == null
          ? null
          : AdminSettings.fromJson(
              json['adminSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'installedAt': instance.installedAt?.toIso8601String(),
      'isContactsSynced': instance.isContactsSynced,
      'isLoggedOut': instance.isLoggedOut,
      'backup': instance.backup,
      'depositBannerShowed': instance.depositBannerShowed,
      'homeBackupDialogShowed': instance.homeBackupDialogShowed,
      'walletAddress': instance.walletAddress,
      'networks': instance.networks,
      'mnemonic': instance.mnemonic,
      'privateKey': instance.privateKey,
      'pincode': instance.pincode,
      'accountAddress': instance.accountAddress,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'receiveBackupDialogShowed': instance.receiveBackupDialogShowed,
      'warnSendDialogShowed': instance.warnSendDialogShowed,
      'isoCode': instance.isoCode,
      'jwtToken': instance.jwtToken,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'verificationId': instance.verificationId,
      'identifier': instance.identifier,
      'syncedContacts': instance.syncedContacts,
      'reverseContacts': instance.reverseContacts,
      'currency': instance.currency,
      'authType': EnumToString.convertToString(instance.authType),
      'locale': localeToJson(instance.locale),
      'walletModules': instance.walletModules?.toJson(),
      'listOfDeliveryAddresses':
          instance.listOfDeliveryAddresses.map((e) => e.toJson()).toList(),
      'hasSavedSeedPhrase': instance.hasSavedSeedPhrase,
      'initialLoginDateTime': instance.initialLoginDateTime,
      'showSeedPhraseBanner': instance.showSeedPhraseBanner,
      'adminSettings': adminSettingsToJson(instance.adminSettings),
    };
