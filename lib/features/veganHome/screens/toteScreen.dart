import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/cart/SingleCartItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/cart/detailCartItemView.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
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
        store.state.cartState.restaurantID != "" ? store.dispatch(getFullfillmentMethods()) : null;
      },
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: CustomAppBar(
            pageTitle: "Cart",
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

                                // only allows the user swipe from right to left
                                direction: DismissDirection.endToStart,

                                // Remove this product from the list
                                // In production enviroment, you may want to send some request to delete it on server side
                                onDismissed: (_) {
                                  final updatedElement =
                                      element.copyWith(itemQuantity: 0);
                                  viewmodel.updateCartItem(updatedElement);
                                },

                                child: GestureDetector(
                                  child: SingleCartItem(orderItem: element),
                                  onTap: () => {
                                    showBarModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          DetailCartItemView(item: element),
                                    ),
                                  },
                                ),

                                // This will show up when the user performs dismissal action
                                // It is a red background and a trash icon
                                background: Container(
                                  color: Colors.red,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  alignment: Alignment.centerRight,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
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
                            cFPrice(viewmodel.cartDeliveryCharge),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: ShimmerButton(
                              baseColor: themeShade400,
                              highlightColor: themeShade300,
                              buttonAction: () {
                                if (viewmodel.minimumOrderAmount > viewmodel.cartTotal) {
                                  showErrorSnack(
                                      context: context,
                                      title: "This restaurant has a minimum order!",
                                      message: "Try adding more items to your tote!");
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
                  subtitle: "Try adding an item from one of our amazing restauarants to fill this page up!",
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
