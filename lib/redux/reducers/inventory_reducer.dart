import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/inventory_state.dart';
import 'package:vegan_liverpool/redux/actions/inventory_actions.dart';

final CartStateReducers = combineReducers<InventoryState>([
  TypedReducer<InventoryState, UpdateInventoryCatalog>(
      _updateInventoryItemsCatalog),
]);

InventoryState _updateInventoryItemsCatalog(
  InventoryState state,
  UpdateInventoryCatalog action,
) {
  return state.copyWith(restaurantItems: action.items);
}
