import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/inventory_actions.dart';

class InventoryViewModel extends Equatable {
  final String? userEmployedByRestaurantWithID;
  final RestaurantItem? restaurantItem;
  final List<RestaurantMenuItem> menuItemsForUserRestaurant;

  final Function(RestaurantMenuItem menuItem) addMenuItemToInventory;
  final Function(RestaurantMenuItem menuItem) updateMenuItemInInventory;
  final Function(String menuItemID) discontinueMenuItemInInventory;

  InventoryViewModel({
    required this.userEmployedByRestaurantWithID,
    required this.restaurantItem,
    required this.menuItemsForUserRestaurant,
    required this.addMenuItemToInventory,
    required this.updateMenuItemInInventory,
    required this.discontinueMenuItemInInventory,
  });

  static InventoryViewModel fromStore(Store<AppState> store) {
    //TODO: Fetch menuItems from the peeplEats API by calling that actionCreater and store the items in the redux state for a merchant user.
    // TODO: Show the loading spinned by dispatching Loading to the store AppState while we fetch these items.
    // TODO: Then we can show the InventoryViewModel. (lib/redux/actions/home_page_actions.dart:50)
    final String? employerRestaurantID =
        store.state.userState.merchantAccountSettings?.employerRestaurantID;
    final RestaurantItem? featuredRestaurant = employerRestaurantID != null
        ? store.state.homePageState.featuredRestaurants.firstWhere(
            (element) => element.restaurantID == employerRestaurantID,
          )
        : null;
    return InventoryViewModel(
      userEmployedByRestaurantWithID: employerRestaurantID,
      restaurantItem: featuredRestaurant,
      menuItemsForUserRestaurant: featuredRestaurant != null
          ? featuredRestaurant.listOfMenuItems
          : <RestaurantMenuItem>[],
      addMenuItemToInventory: (RestaurantMenuItem menuItem) {
        store.dispatch(addMenuItemToInventoryAC(menuItem));
      },
      updateMenuItemInInventory: (RestaurantMenuItem menuItem) {
        store.dispatch(updateMenuItemInInventoryAC(menuItem));
      },
      discontinueMenuItemInInventory: (String menuItemID) {
        store.dispatch(discontinueMenuItemInInventoryAC(menuItemID));
      },
    );
  }

  @override
  List<Object> get props => [];
}
