import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/inventory/screens/add_menu_item_screen.dart';
import 'package:vegan_liverpool/features/inventory/screens/edit_menu_item_screen.dart';
import 'package:vegan_liverpool/features/inventory/widgets/inventory_manager_app_bar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/inventory_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/inventory.dart';

class InventoryManagerScreen extends StatefulWidget {
  const InventoryManagerScreen({Key? key}) : super(key: key);

  @override
  State<InventoryManagerScreen> createState() => _InventoryManagerScreenState();
}

class _InventoryManagerScreenState extends State<InventoryManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InventoryViewModel>(
        converter: InventoryViewModel.fromStore,
        distinct: true,
        onInit: (store) {
          store.dispatch(fetchMenuItemsForRestaurantAC(store.state
              .userState)); //TODO: Implement a InventoryState of the redux store that stores all the menuItems.
        },
        builder: (_, viewmodel) {
          final _featuredList = viewmodel.menuItemsForUserRestaurant
              .where((element) => element.isFeatured)
              .toList();
          final _regularList = viewmodel.menuItemsForUserRestaurant
              .where((element) => !element.isFeatured)
              .toList();
          return Scaffold(
            appBar: InventoryManagerAppBar(),
            floatingActionButton: OpenContainer(
              transitionDuration: const Duration(milliseconds: 500),
              openBuilder: (BuildContext context, VoidCallback _) {
                return AddMenuItemScreen();
              },
              closedElevation: 6.0,
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(56 / 2),
                ),
              ),
              closedColor: themeShade400,
              closedBuilder:
                  (BuildContext context, VoidCallback openContainer) {
                return SizedBox(
                  height: 56,
                  width: 56,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    ),
                  ),
                );
              },
            ),
            body: CustomScrollView(
              slivers: [
                SliverStickyHeader(
                  header: MenuStickyHeader(title: "Featured Items"),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            EditMenuItemScreen(menuItem: _featuredList[index]),
                        childCount: _featuredList.length,
                      ),
                    ),
                  ),
                ),
                SliverStickyHeader(
                  header: MenuStickyHeader(
                    title: "Regular Items",
                  ),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    sliver: SliverList(
                      //TODO: Implement Swipe to delete
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            EditMenuItemScreen(menuItem: _regularList[index]),
                        childCount: _regularList.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
