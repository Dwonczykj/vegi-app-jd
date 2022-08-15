import 'package:auto_route/auto_route.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/inventory/screens/add_menu_item_screen.dart';
import 'package:vegan_liverpool/features/inventory/screens/edit_menu_item_screen.dart';
import 'package:vegan_liverpool/features/inventory/screens/inventory_manager_screen.dart';

const inventoryManagerTab = AutoRoute(
  path: 'inventoryManager',
  name: 'inventoryManagerTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: InventoryManagerScreen,
      name: 'inventoryManagerScreen',
      guards: [AuthGuard, MerchantAuthGuard],
    ),
    CustomRoute(
      page: AddMenuItemScreen,
      name: 'addMenuItemScreen',
      guards: [AuthGuard, MerchantAuthGuard],
    ),
    CustomRoute(
      page: EditMenuItemScreen,
      name: 'editMenuItemScreen',
      guards: [AuthGuard, MerchantAuthGuard],
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
);
