import 'dart:math';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/cart/SingleCartItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class ToteScreen extends StatefulWidget {
  const ToteScreen({Key? key}) : super(key: key);

  @override
  _ToteScreenState createState() => _ToteScreenState();
}

class _ToteScreenState extends State<ToteScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        store.state.cartState.restaurantID != ""
            ? store.dispatch(getFullfillmentMethods())
            : null;
      },
      builder: (_, viewmodel) {
        final String collectDeliver = viewmodel.isDelivery
            ? I10n.of(context).delivery
            : I10n.of(context).collection;
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              pageTitle: "Cart for $collectDeliver",
              otherAction: IconButton(
                onPressed: () => viewmodel.clearCart(),
                icon: ImageIcon(
                  AssetImage("assets/images/clear-shopping-tote.png"),
                ),
              ),
            ),
            body: viewmodel.cartItems.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: viewmodel.cartItems
                              .map<Widget>(
                                (element) => Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.horizontal,
                                  confirmDismiss: (direction) async {
                                    if (direction ==
                                        DismissDirection.endToStart) {
                                      final updatedElement =
                                          element.copyWith(itemQuantity: 0);
                                      viewmodel.updateCartItem(updatedElement);
                                      return true;
                                    } else {
                                      final updatedElement = element.copyWith(
                                          internalID: Random(DateTime.now()
                                                  .millisecondsSinceEpoch)
                                              .nextInt(10000));
                                      viewmodel.addCartItem(updatedElement);
                                      return false;
                                    }
                                  },
                                  child: SingleCartItem(orderItem: element),
                                  background: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green.shade400),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    alignment: Alignment.centerLeft,
                                    child: const Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  secondaryBackground: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red.shade400),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    alignment: Alignment.centerRight,
                                    child: const Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList() +
                          [
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Colors.grey[300],
                              indent: 20,
                              endIndent: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            totalsPriceItemTile(
                              "Subtotal",
                              cFPrice(viewmodel.cartSubTotal),
                            ),
                            viewmodel.isDelivery
                                ? totalsPriceItemTile(
                                    "Delivery Charge",
                                    cFPrice(viewmodel.cartDeliveryCharge),
                                  )
                                : SizedBox.shrink(),
                            totalsPriceItemTile(
                              "Service Charge",
                              cFPrice(viewmodel.cartServiceCharge),
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.grey[300],
                              indent: 20,
                              endIndent: 20,
                            ),
                            totalsPriceItemTile(
                              "Total",
                              cFPrice(viewmodel.cartTotal),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ShimmerButton(
                                baseColor: themeShade400,
                                highlightColor: themeShade300,
                                buttonAction: () {
                                  if (viewmodel.minimumOrderAmount >
                                      viewmodel.cartTotal) {
                                    showErrorSnack(
                                        context: context,
                                        title:
                                            "This restaurant has a minimum order!",
                                        message:
                                            "Try adding more items to your tote!");
                                    return;
                                  }
                                  context.router.push(CheckoutScreen());
                                },
                                buttonContent: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_basket_rounded,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Checkout",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                    ),
                  )
                : EmptyStatePage(
                    emoji: "😐",
                    title: "No items in your bag… yet!",
                    subtitle:
                        "Try adding an item from one of our amazing restauarants to fill this page up!",
                  ),
          ),
        );
      },
    );
  }

  Widget totalsPriceItemTile(String title, String trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            trailing,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
