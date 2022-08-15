import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/actions/action_utils.dart';

class AddMenuItemToSale {
  final RestaurantMenuItem menuItem;

  const AddMenuItemToSale(this.menuItem);
}

class RemoveMenuItemFromSale {
  final String menuItemID;

  const RemoveMenuItemFromSale(this.menuItemID);
}

ThunkAction removeMenuItemFromSale(String menuItemID) {
  return (Store store) async {
    thunkActionCatchError('removeMenuItemFromSale', () {
      store.dispatch(RemoveMenuItemFromSale(menuItemID));
    });
  };
}

ThunkAction addMenuItemFromSale(RestaurantMenuItem menuItem) {
  return (Store store) async {
    thunkActionCatchError('addMenuItemFromSale', () {
      store.dispatch(AddMenuItemToSale(menuItem));
    });
  };
}
