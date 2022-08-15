import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/inventory/screens/product_manage_screen.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

class EditMenuItemScreen extends ProductManageScreen {
  EditMenuItemScreen({Key? key, required RestaurantMenuItem menuItem})
      : super(
          key: key,
          menuItemID: menuItem.menuItemID,
          itemName: menuItem.name,
          itemDescription: menuItem.description,
          itemBasePrice: menuItem.price,
          priority: menuItem.priority,
          isAvailable: true,
          isFeatured: menuItem.isFeatured,
          featuredItemImage: menuItem.imageURL,
          productOptions: menuItem.listOfProductOptions,
          category: menuItem.category,
          extras: menuItem.extras,
          barcodeData: null,
        );
}
