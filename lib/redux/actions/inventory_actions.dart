import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/action_utils.dart';
import 'package:vegan_liverpool/services.dart';

class UpdateMenuItemInInventory {
  final RestaurantMenuItem menuItem;

  const UpdateMenuItemInInventory(this.menuItem);
}

class AddMenuItemToInventory {
  final RestaurantMenuItem menuItem;

  const AddMenuItemToInventory(this.menuItem);
}

class DiscontinueMenuItemInInventory {
  final String menuItemID;

  const DiscontinueMenuItemInInventory(this.menuItemID);
}

class SetIsLoadingInventoryPage {
  final bool isLoading;
  SetIsLoadingInventoryPage(this.isLoading);
}

class UpdateInventoryCatalog {
  final List<RestaurantMenuItem> items;
  UpdateInventoryCatalog(this.items);
}

ThunkAction addMenuItemToInventoryAC(RestaurantMenuItem menuItem) {
  return (Store store) async {
    thunkActionCatchError('addMenuItemToInventoryAC', () {
      store.dispatch(AddMenuItemToInventory(menuItem));
    });
  };
}

ThunkAction updateMenuItemInInventoryAC(RestaurantMenuItem menuItem) {
  return (Store store) async {
    thunkActionCatchError('updateMenuItemInInventoryAC', () {
      store.dispatch(UpdateMenuItemInInventory(menuItem));
    });
  };
}

ThunkAction discontinueMenuItemInInventoryAC(String menuItemID) {
  return (Store store) async {
    thunkActionCatchError('discontinueMenuItemInInventoryAC', () {
      store.dispatch(DiscontinueMenuItemInInventory(menuItemID));
    });
  };
}

ThunkAction fetchMenuItemsForRestaurantAC(UserState userState) {
  return (Store store) async {
    thunkActionCatchError('fetchMenuItemsForRestaurantAC', () async {
      if (!userState.isMerchantAccount()) return;

      store.dispatch(SetIsLoadingInventoryPage(true));

      final items = await peeplEatsService.getRestaurantMenuItems(
          userState.merchantAccountSettings!.employerRestaurantID);

      store.dispatch(UpdateInventoryCatalog(items));

      store.dispatch(SetIsLoadingInventoryPage(false));
    });
  };
}
