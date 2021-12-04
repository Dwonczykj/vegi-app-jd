// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:contacts_service/contacts_service.dart' as _i40;
import 'package:flutter/material.dart' as _i2;

import '../../features/account/screens/account_screen.dart' as _i31;
import '../../features/account/screens/done_backup_screen.dart' as _i34;
import '../../features/account/screens/profile.dart' as _i37;
import '../../features/account/screens/protect_your_wallet.dart' as _i36;
import '../../features/account/screens/settings.dart' as _i35;
import '../../features/account/screens/show_mnemonic.dart' as _i32;
import '../../features/account/screens/social_screen.dart' as _i38;
import '../../features/account/screens/verify_mnemonic.dart' as _i33;
import '../../features/buy/screens/business.dart' as _i28;
import '../../features/buy/screens/buy.dart' as _i27;
import '../../features/contacts/screens/contacts_list.dart' as _i22;
import '../../features/contacts/screens/send_amount.dart' as _i23;
import '../../features/contacts/screens/send_review.dart' as _i24;
import '../../features/contacts/screens/send_success.dart' as _i25;
import '../../features/contacts/send_amount_arguments.dart' as _i41;
import '../../features/home/screens/action_details.dart' as _i18;
import '../../features/home/screens/home.dart' as _i17;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i7;
import '../../features/onboard/screens/security_screen.dart' as _i5;
import '../../features/onboard/screens/signup_screen.dart' as _i9;
import '../../features/onboard/screens/username_screen.dart' as _i11;
import '../../features/onboard/screens/verify_screen.dart' as _i10;
import '../../features/screens/help.dart' as _i21;
import '../../features/screens/inapp_webview_page.dart' as _i26;
import '../../features/screens/main_screen.dart' as _i13;
import '../../features/screens/on_board_screen.dart' as _i8;
import '../../features/screens/pincode_screen.dart' as _i6;
import '../../features/screens/splash_screen.dart' as _i4;
import '../../features/screens/webview_screen.dart' as _i12;
import '../../features/swap/screens/review_swap.dart' as _i30;
import '../../features/swap/screens/swap.dart' as _i29;
import '../../features/topup/screens/topup.dart' as _i19;
import '../../features/topup/screens/topup_explained.dart' as _i20;
import '../../features/veganHome/screens/restaurantMenuScreen.dart' as _i15;
import '../../features/veganHome/screens/toteScreen.dart' as _i16;
import '../../features/veganHome/screens/veganHomeAlternate.dart' as _i14;
import '../../models/actions/wallet_action.dart' as _i39;
import '../../models/community/business.dart' as _i42;
import '../../models/swap/swap.dart' as _i44;
import '../../models/tokens/token.dart' as _i43;
import 'route_guards.dart' as _i3;

class RootRouter extends _i1.RootStackRouter {
  RootRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SplashScreenArgs>(
              orElse: () => const SplashScreenArgs());
          return _i4.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult);
        }),
    ChooseSecurityOption.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.ChooseSecurityOption();
        }),
    PinCodeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.PinCodeScreen();
        }),
    RestoreFromBackupScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.RestoreFromBackupScreen();
        }),
    OnBoardScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.OnBoardScreen();
        }),
    SignUpScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.SignUpScreen();
        }),
    VerifyPhoneNumber.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<VerifyPhoneNumberArgs>(
              orElse: () => const VerifyPhoneNumberArgs());
          return _i10.VerifyPhoneNumber(verificationId: args.verificationId);
        }),
    UserNameScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.UserNameScreen();
        }),
    Webview.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WebviewArgs>();
          return _i12.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted);
        },
        fullscreenDialog: true),
    MainScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<MainScreenArgs>(orElse: () => const MainScreenArgs());
          return _i13.MainScreen(key: args.key);
        }),
    VeganHomeAltTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    HomeTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    TopupTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    HelpTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    ContactsTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    WebviewTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    BuyTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    SwapTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    AccountTab.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    VeganHomeScreenAlt.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.VeganHomeScreenAlternate();
        }),
    RestaurantMenuScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.RestaurantMenuScreen();
        }),
    ToteScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i16.ToteScreen();
        }),
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.HomeScreen();
        }),
    ActionDetailsScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ActionDetailsScreenArgs>();
          return _i18.ActionDetailsScreen(
              action: args.action,
              image: args.image,
              displayName: args.displayName,
              accountAddress: args.accountAddress,
              symbol: args.symbol,
              contact: args.contact);
        }),
    TopupScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i19.TopupScreen();
        }),
    TopupExplained.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<TopupExplainedArgs>(
              orElse: () => const TopupExplainedArgs());
          return _i20.TopupExplained(key: args.key);
        }),
    HelpScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i21.HelpScreen();
        }),
    ContactsList.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ContactsListArgs>(
              orElse: () => const ContactsListArgs());
          return _i22.ContactsList(pageArgs: args.pageArgs);
        }),
    SendAmountScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SendAmountScreenArgs>();
          return _i23.SendAmountScreen(pageArgs: args.pageArgs);
        }),
    SendReviewScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SendReviewScreenArgs>();
          return _i24.SendReviewScreen(pageArgs: args.pageArgs);
        }),
    SendSuccessScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SendSuccessScreenArgs>();
          return _i25.SendSuccessScreen(pageArgs: args.pageArgs);
        }),
    WebViewWidget.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WebViewWidgetArgs>();
          return _i26.WebViewWidget(
              url: args.url, walletAddress: args.walletAddress);
        }),
    BuyScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i27.BuyScreen();
        }),
    BusinessScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<BusinessScreenArgs>();
          return _i28.BusinessScreen(
              business: args.business, token: args.token);
        }),
    SwapScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<SwapScreenArgs>(orElse: () => const SwapScreenArgs());
          return _i29.SwapScreen(
              key: args.key, primaryToken: args.primaryToken);
        }),
    ReviewSwapScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ReviewSwapScreenArgs>();
          return _i30.ReviewSwapScreen(
              tradeInfo: args.tradeInfo,
              rateInfo: args.rateInfo,
              swapRequestBody: args.swapRequestBody);
        }),
    AccountScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i31.AccountScreen();
        }),
    ShowMnemonic.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i32.ShowMnemonic();
        }),
    VerifyMnemonic.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i33.VerifyMnemonic();
        }),
    DoneBackup.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i34.DoneBackup();
        }),
    SettingsScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i35.SettingsScreen();
        }),
    ProtectYourWallet.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i36.ProtectYourWallet();
        }),
    ProfileScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProfileScreenArgs>(
              orElse: () => const ProfileScreenArgs());
          return _i37.ProfileScreen(key: args.key);
        }),
    SocialScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i38.SocialScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i1.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i1.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i1.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i1.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i1.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i1.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i1.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i1.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig(VeganHomeAltTab.name,
              path: 'veganHomeAlt',
              children: [
                _i1.RouteConfig(VeganHomeScreenAlt.name,
                    path: '', guards: [authGuard]),
                _i1.RouteConfig(RestaurantMenuScreen.name,
                    path: 'restaurant-menu-screen', guards: [authGuard]),
                _i1.RouteConfig(ToteScreen.name,
                    path: 'tote-screen', guards: [authGuard])
              ]),
          _i1.RouteConfig(HomeTab.name, path: 'home', guards: [
            authGuard
          ], children: [
            _i1.RouteConfig(HomeScreen.name, path: '', guards: [authGuard]),
            _i1.RouteConfig(ActionDetailsScreen.name,
                path: 'action-details-screen', guards: [authGuard])
          ]),
          _i1.RouteConfig(TopupTab.name, path: 'topup', children: [
            _i1.RouteConfig('#redirect',
                path: '', redirectTo: 'topUp', fullMatch: true),
            _i1.RouteConfig(TopupScreen.name, path: 'topUp'),
            _i1.RouteConfig(TopupExplained.name, path: 'topup-explained')
          ]),
          _i1.RouteConfig(HelpTab.name,
              path: 'help',
              children: [_i1.RouteConfig(HelpScreen.name, path: '')]),
          _i1.RouteConfig(ContactsTab.name, path: 'contacts', guards: [
            authGuard
          ], children: [
            _i1.RouteConfig(ContactsList.name, path: '', guards: [authGuard]),
            _i1.RouteConfig(SendAmountScreen.name,
                path: 'send-amount', guards: [authGuard]),
            _i1.RouteConfig(SendReviewScreen.name,
                path: 'send-review', guards: [authGuard]),
            _i1.RouteConfig(SendSuccessScreen.name,
                path: 'send-success', guards: [authGuard])
          ]),
          _i1.RouteConfig(WebviewTab.name,
              path: 'webview',
              children: [_i1.RouteConfig(WebViewWidget.name, path: '')]),
          _i1.RouteConfig(BuyTab.name, path: 'buy', children: [
            _i1.RouteConfig(BuyScreen.name, path: ''),
            _i1.RouteConfig(BusinessScreen.name, path: 'business-screen')
          ]),
          _i1.RouteConfig(SwapTab.name, path: 'swap', guards: [
            authGuard
          ], children: [
            _i1.RouteConfig(SwapScreen.name, path: '', guards: [authGuard]),
            _i1.RouteConfig(ReviewSwapScreen.name,
                path: 'review-swap-screen', guards: [authGuard])
          ]),
          _i1.RouteConfig(AccountTab.name, path: 'account', guards: [
            authGuard
          ], children: [
            _i1.RouteConfig(AccountScreen.name, path: '', guards: [authGuard]),
            _i1.RouteConfig(ShowMnemonic.name,
                path: 'show-mnemonic', guards: [authGuard]),
            _i1.RouteConfig(VerifyMnemonic.name,
                path: 'verify-mnemonic', guards: [authGuard]),
            _i1.RouteConfig(DoneBackup.name,
                path: 'done-backup', guards: [authGuard]),
            _i1.RouteConfig(SettingsScreen.name,
                path: 'settings-screen', guards: [authGuard]),
            _i1.RouteConfig(ProtectYourWallet.name,
                path: 'protect-your-wallet', guards: [authGuard]),
            _i1.RouteConfig(ProfileScreen.name,
                path: 'profile-screen', guards: [authGuard]),
            _i1.RouteConfig(SocialScreen.name,
                path: 'social-screen', guards: [authGuard]),
            _i1.RouteConfig(TopupScreen.name,
                path: 'topUp', guards: [authGuard])
          ])
        ]),
        _i1.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

class SplashScreen extends _i1.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i2.Key? key, void Function(bool)? onLoginResult})
      : super(name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i2.Key? key;

  final void Function(bool)? onLoginResult;
}

class ChooseSecurityOption extends _i1.PageRouteInfo {
  const ChooseSecurityOption() : super(name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

class PinCodeScreen extends _i1.PageRouteInfo {
  const PinCodeScreen() : super(name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

class RestoreFromBackupScreen extends _i1.PageRouteInfo {
  const RestoreFromBackupScreen()
      : super(name, path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

class OnBoardScreen extends _i1.PageRouteInfo {
  const OnBoardScreen() : super(name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

class SignUpScreen extends _i1.PageRouteInfo {
  const SignUpScreen() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

class VerifyPhoneNumber extends _i1.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({String? verificationId})
      : super(name,
            path: '/verify-phone-number',
            args: VerifyPhoneNumberArgs(verificationId: verificationId));

  static const String name = 'VerifyPhoneNumber';
}

class VerifyPhoneNumberArgs {
  const VerifyPhoneNumberArgs({this.verificationId});

  final String? verificationId;
}

class UserNameScreen extends _i1.PageRouteInfo {
  const UserNameScreen() : super(name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

class Webview extends _i1.PageRouteInfo<WebviewArgs> {
  Webview(
      {required String url,
      required String title,
      void Function(String)? onPageStarted})
      : super(name,
            path: '/web-view-screen',
            args: WebviewArgs(
                url: url, title: title, onPageStarted: onPageStarted));

  static const String name = 'Webview';
}

class WebviewArgs {
  const WebviewArgs(
      {required this.url, required this.title, this.onPageStarted});

  final String url;

  final String title;

  final void Function(String)? onPageStarted;
}

class MainScreen extends _i1.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/main-screen',
            args: MainScreenArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i2.Key? key;
}

class VeganHomeAltTab extends _i1.PageRouteInfo {
  const VeganHomeAltTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'veganHomeAlt', initialChildren: children);

  static const String name = 'VeganHomeAltTab';
}

class HomeTab extends _i1.PageRouteInfo {
  const HomeTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

class TopupTab extends _i1.PageRouteInfo {
  const TopupTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

class HelpTab extends _i1.PageRouteInfo {
  const HelpTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'help', initialChildren: children);

  static const String name = 'HelpTab';
}

class ContactsTab extends _i1.PageRouteInfo {
  const ContactsTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'contacts', initialChildren: children);

  static const String name = 'ContactsTab';
}

class WebviewTab extends _i1.PageRouteInfo {
  const WebviewTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'webview', initialChildren: children);

  static const String name = 'WebviewTab';
}

class BuyTab extends _i1.PageRouteInfo {
  const BuyTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'buy', initialChildren: children);

  static const String name = 'BuyTab';
}

class SwapTab extends _i1.PageRouteInfo {
  const SwapTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'swap', initialChildren: children);

  static const String name = 'SwapTab';
}

class AccountTab extends _i1.PageRouteInfo {
  const AccountTab({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

class VeganHomeScreenAlt extends _i1.PageRouteInfo {
  const VeganHomeScreenAlt() : super(name, path: '');

  static const String name = 'VeganHomeScreenAlt';
}

class RestaurantMenuScreen extends _i1.PageRouteInfo {
  const RestaurantMenuScreen() : super(name, path: 'restaurant-menu-screen');

  static const String name = 'RestaurantMenuScreen';
}

class ToteScreen extends _i1.PageRouteInfo {
  const ToteScreen() : super(name, path: 'tote-screen');

  static const String name = 'ToteScreen';
}

class HomeScreen extends _i1.PageRouteInfo {
  const HomeScreen() : super(name, path: '');

  static const String name = 'HomeScreen';
}

class ActionDetailsScreen extends _i1.PageRouteInfo<ActionDetailsScreenArgs> {
  ActionDetailsScreen(
      {required _i39.WalletAction action,
      _i2.ImageProvider<Object>? image,
      required String displayName,
      String? accountAddress,
      required String symbol,
      _i40.Contact? contact})
      : super(name,
            path: 'action-details-screen',
            args: ActionDetailsScreenArgs(
                action: action,
                image: image,
                displayName: displayName,
                accountAddress: accountAddress,
                symbol: symbol,
                contact: contact));

  static const String name = 'ActionDetailsScreen';
}

class ActionDetailsScreenArgs {
  const ActionDetailsScreenArgs(
      {required this.action,
      this.image,
      required this.displayName,
      this.accountAddress,
      required this.symbol,
      this.contact});

  final _i39.WalletAction action;

  final _i2.ImageProvider<Object>? image;

  final String displayName;

  final String? accountAddress;

  final String symbol;

  final _i40.Contact? contact;
}

class TopupScreen extends _i1.PageRouteInfo {
  const TopupScreen() : super(name, path: 'topUp');

  static const String name = 'TopupScreen';
}

class TopupExplained extends _i1.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i2.Key? key})
      : super(name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i2.Key? key;
}

class HelpScreen extends _i1.PageRouteInfo {
  const HelpScreen() : super(name, path: '');

  static const String name = 'HelpScreen';
}

class ContactsList extends _i1.PageRouteInfo<ContactsListArgs> {
  ContactsList({_i41.SendFlowArguments? pageArgs})
      : super(name, path: '', args: ContactsListArgs(pageArgs: pageArgs));

  static const String name = 'ContactsList';
}

class ContactsListArgs {
  const ContactsListArgs({this.pageArgs});

  final _i41.SendFlowArguments? pageArgs;
}

class SendAmountScreen extends _i1.PageRouteInfo<SendAmountScreenArgs> {
  SendAmountScreen({required _i41.SendFlowArguments pageArgs})
      : super(name,
            path: 'send-amount',
            args: SendAmountScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendAmountScreen';
}

class SendAmountScreenArgs {
  const SendAmountScreenArgs({required this.pageArgs});

  final _i41.SendFlowArguments pageArgs;
}

class SendReviewScreen extends _i1.PageRouteInfo<SendReviewScreenArgs> {
  SendReviewScreen({required _i41.SendFlowArguments pageArgs})
      : super(name,
            path: 'send-review',
            args: SendReviewScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendReviewScreen';
}

class SendReviewScreenArgs {
  const SendReviewScreenArgs({required this.pageArgs});

  final _i41.SendFlowArguments pageArgs;
}

class SendSuccessScreen extends _i1.PageRouteInfo<SendSuccessScreenArgs> {
  SendSuccessScreen({required _i41.SendFlowArguments pageArgs})
      : super(name,
            path: 'send-success',
            args: SendSuccessScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendSuccessScreen';
}

class SendSuccessScreenArgs {
  const SendSuccessScreenArgs({required this.pageArgs});

  final _i41.SendFlowArguments pageArgs;
}

class WebViewWidget extends _i1.PageRouteInfo<WebViewWidgetArgs> {
  WebViewWidget({required String url, required String walletAddress})
      : super(name,
            path: '',
            args: WebViewWidgetArgs(url: url, walletAddress: walletAddress));

  static const String name = 'WebViewWidget';
}

class WebViewWidgetArgs {
  const WebViewWidgetArgs({required this.url, required this.walletAddress});

  final String url;

  final String walletAddress;
}

class BuyScreen extends _i1.PageRouteInfo {
  const BuyScreen() : super(name, path: '');

  static const String name = 'BuyScreen';
}

class BusinessScreen extends _i1.PageRouteInfo<BusinessScreenArgs> {
  BusinessScreen({required _i42.Business business, required _i43.Token token})
      : super(name,
            path: 'business-screen',
            args: BusinessScreenArgs(business: business, token: token));

  static const String name = 'BusinessScreen';
}

class BusinessScreenArgs {
  const BusinessScreenArgs({required this.business, required this.token});

  final _i42.Business business;

  final _i43.Token token;
}

class SwapScreen extends _i1.PageRouteInfo<SwapScreenArgs> {
  SwapScreen({_i2.Key? key, _i43.Token? primaryToken})
      : super(name,
            path: '',
            args: SwapScreenArgs(key: key, primaryToken: primaryToken));

  static const String name = 'SwapScreen';
}

class SwapScreenArgs {
  const SwapScreenArgs({this.key, this.primaryToken});

  final _i2.Key? key;

  final _i43.Token? primaryToken;
}

class ReviewSwapScreen extends _i1.PageRouteInfo<ReviewSwapScreenArgs> {
  ReviewSwapScreen(
      {required _i44.TradeInfo tradeInfo,
      required _i44.TradeInfo rateInfo,
      required _i44.SwapRequestBody swapRequestBody})
      : super(name,
            path: 'review-swap-screen',
            args: ReviewSwapScreenArgs(
                tradeInfo: tradeInfo,
                rateInfo: rateInfo,
                swapRequestBody: swapRequestBody));

  static const String name = 'ReviewSwapScreen';
}

class ReviewSwapScreenArgs {
  const ReviewSwapScreenArgs(
      {required this.tradeInfo,
      required this.rateInfo,
      required this.swapRequestBody});

  final _i44.TradeInfo tradeInfo;

  final _i44.TradeInfo rateInfo;

  final _i44.SwapRequestBody swapRequestBody;
}

class AccountScreen extends _i1.PageRouteInfo {
  const AccountScreen() : super(name, path: '');

  static const String name = 'AccountScreen';
}

class ShowMnemonic extends _i1.PageRouteInfo {
  const ShowMnemonic() : super(name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

class VerifyMnemonic extends _i1.PageRouteInfo {
  const VerifyMnemonic() : super(name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

class DoneBackup extends _i1.PageRouteInfo {
  const DoneBackup() : super(name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

class SettingsScreen extends _i1.PageRouteInfo {
  const SettingsScreen() : super(name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

class ProtectYourWallet extends _i1.PageRouteInfo {
  const ProtectYourWallet() : super(name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

class ProfileScreen extends _i1.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i2.Key? key})
      : super(name, path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i2.Key? key;
}

class SocialScreen extends _i1.PageRouteInfo {
  const SocialScreen() : super(name, path: 'social-screen');

  static const String name = 'SocialScreen';
}
