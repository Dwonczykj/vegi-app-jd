import 'package:firebase_auth/firebase_auth.dart';
import 'package:vegan_liverpool/models/restaurant/fullfilmentMethods.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

const Object requiresAdmin = _RequiresAdmin();

class _RequiresAdmin {
  //TODO: Check that the method invoked is in a class where user has to be signed in to use the methods.
  const _RequiresAdmin();
}

abstract class IRestaraurantManagementService {
  // Restaurants
  // outCode refers to postcode that restaurants deliver to: i.e. 'L1'
  Future<List<RestaurantItem>> featuredRestaurants(String outCode);

  Future<List<RestaurantItem>> activeRestaurants(String outCode);

  @requiresAdmin
  Future<List<RestaurantItem>> adminAllRestaurants(String outCode);

  // Products
  Future<List<RestaurantMenuItem>> getRestaurantMenuItems(String restaurantID);

  Future<List<ProductOptionsCategory>> getProductOptions(String itemID);

  Future<int> checkDiscountCode(String discountCode);

  // Orders
  Future<FullfilmentMethods> getFulfilmentSlots(
      {required String vendorID, required String dateRequired});

  Future<Map<dynamic, dynamic>> createOrder(Map<String, dynamic> orderObject);

  Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID);

  Future<List<Map<String, dynamic>>> getPastOrders(String walletAddress);

  Future<List<String>> getPostalCodes();

  // User Details
  Future<String> signIn(String user, String password);

  Future<String> signOut(String user, String password);

  // Merchant Product Management
  Future<bool> createRestaurantMenuItem(RestaurantMenuItem newItem);

  Future<bool> updateRestaurantMenuItem(RestaurantMenuItem newItem);

  Future<bool> registerRestaurantMenuItemToBarcode(
      RestaurantMenuItem newItem, String? barcodeData);

  Future<bool> discontinueRestaurantMenuItem(RestaurantMenuItem newItem);

  // Merchant Admin
  Future<bool> registerUserToBusiness(User user, RestaurantItem business);

  Future<bool> deregisterUserFromBusiness(User user, RestaurantItem business);

  Future<bool> checkUserRegisteredToBusiness(
      User user, RestaurantItem business);

  Future<bool> userIsProductOwnerForRestaurant(
      String restaurantID, String sessionToken);
}

abstract class IRestaraurantDeliveryService {
  // Restaurants
  // outCode refers to postcode that restaurants deliver to: i.e. 'L1'
  Future<List<RestaurantItem>> featuredRestaurants(String outCode);

  // Products
  Future<List<RestaurantMenuItem>> getRestaurantMenuItems(String restaurantID);

  Future<List<ProductOptionsCategory>> getProductOptions(String itemID);

  Future<int> checkDiscountCode(String discountCode);

  // Orders
  Future<FullfilmentMethods> getFulfilmentSlots(
      {required String vendorID, required String dateRequired});

  Future<Map<dynamic, dynamic>> createOrder(Map<String, dynamic> orderObject);

  Future<Map<dynamic, dynamic>> checkOrderStatus(String orderID);

  Future<List<Map<String, dynamic>>> getPastOrders(String walletAddress);

  Future<List<String>> getPostalCodes();
}
