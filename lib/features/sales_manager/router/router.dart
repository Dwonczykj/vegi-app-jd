import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/account/screens/profile.dart';
import 'package:vegan_liverpool/features/onboard/screens/show_user_mnemonic.dart';
import 'package:vegan_liverpool/features/onboard/screens/verify_user_mnemonic.dart';
import 'package:vegan_liverpool/features/sales_manager/screens/salesManager.dart';
import 'package:vegan_liverpool/features/topup/screens/topup.dart';
import 'package:vegan_liverpool/features/veganHome/screens/aboutScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/allOrdersPage.dart';
import 'package:vegan_liverpool/features/veganHome/screens/checkoutScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/faqScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/orderConfirmed.dart';
import 'package:vegan_liverpool/features/veganHome/screens/preparingOrderScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/scheduledOrdersPage.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart';

const veganSalesManagerTab = AutoRoute(
  path: 'veganSalesManager',
  name: 'veganSalesManagerTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: SalesManagerScreen,
      name: 'veganSalesManagerScreen',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: ToteScreen,
      name: 'toteScreen',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: CheckoutScreen,
      name: 'checkoutScreen',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: OrderConfirmedScreen,
      name: 'orderConfirmedScreen',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(
      page: ProfileScreen,
      name: 'ProfileScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: TopupScreen,
      name: 'TopUpScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: AllOrdersPage,
      name: 'AllOrdersPage',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ScheduledOrdersPage,
      name: 'ScheduledOrdersPage',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: FAQScreen,
      name: 'FAQScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: AboutScreen,
      name: 'aboutScreen',
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: PreparingOrderPage,
      name: 'PreparingOrderPage',
      guards: [AuthGuard],
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(
      page: ShowUserMnemonicScreen,
      name: 'showUserMnemonic',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: VerifyUserMnemonic,
      name: 'verifyUserMnemonic',
      guards: [AuthGuard],
    ),
  ],
);
