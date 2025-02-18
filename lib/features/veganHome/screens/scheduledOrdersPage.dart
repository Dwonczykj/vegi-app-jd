import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class ScheduledOrdersPage extends StatelessWidget {
  const ScheduledOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      builder: (_, viewmodel) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              pageTitle: "Scheduled Orders",
            ),
            body: viewmodel.listOfScheduledOrders.length == 0
                ? EmptyStatePage(
                    emoji: "😐",
                    title: "Pretty empty here, isn't it?",
                    subtitle:
                        "Try scheduling an order from one of our amazing restauarants to fill this page up!",
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    itemBuilder: (_, index) => SingleScheduledOrderCard(
                        orderDetails: viewmodel.listOfScheduledOrders[index]),
                    separatorBuilder: (_, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                    itemCount: viewmodel.listOfScheduledOrders.length),
          ),
        );
      },
    );
  }
}

class SingleScheduledOrderCard extends StatelessWidget {
  const SingleScheduledOrderCard({Key? key, required this.orderDetails}) : super(key: key);

  final OrderDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: themeShade200,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: orderDetails.restaurantName + "\n",
                      children: [
                        TextSpan(
                          text: cFPrice(orderDetails.cartTotal) + "\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        orderDetails.PPLAmountPaid != 0.0
                            ? TextSpan(
                                text: orderDetails.PPLAmountPaid.toStringAsFixed(2) + " ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : WidgetSpan(child: SizedBox.shrink()),
                        WidgetSpan(
                          child: orderDetails.PPLAmountPaid != 0.0
                              ? Image.asset(
                                  "assets/images/avatar-ppl-red.png",
                                  width: 25,
                                )
                              : SizedBox.shrink(),
                        ),
                        orderDetails.PPLAmountPaid != 0.0 ? TextSpan(text: "\n") : WidgetSpan(child: SizedBox.shrink()),
                        TextSpan(
                          text: (orderDetails.GBPxAmountPaid * 5).toStringAsFixed(2) + " ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        WidgetSpan(
                          child: Image.asset(
                            "assets/images/avatar-ppl-red.png",
                            width: 25,
                          ),
                        ),
                        TextSpan(
                          text: " earned",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: mapToStringDate(orderDetails.selectedSlot) + "\n",
                      children: [
                        TextSpan(
                          text: mapToString(orderDetails.selectedSlot) + "\n",
                        ),
                        TextSpan(
                          text: "Status: Paid",
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                padding: const EdgeInsets.only(bottom: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => SingleProductOrderItem(cartItem: orderDetails.cartItems[index]),
                separatorBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                ),
                itemCount: orderDetails.cartItems.length,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: orderDetails.userName + "\n",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: orderDetails.orderAddress.addressLine2 + ",",
                          ),
                          TextSpan(
                            text: orderDetails.orderAddress.addressLine1 + "\n",
                          ),
                          TextSpan(
                            text: orderDetails.orderAddress.townCity + ", ",
                          ),
                          TextSpan(
                            text: orderDetails.orderAddress.postalCode + "\n",
                          ),
                          TextSpan(
                            text: orderDetails.orderAddress.phoneNumber,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProductOrderItem extends StatefulWidget {
  const SingleProductOrderItem({Key? key, required this.cartItem}) : super(key: key);

  final CartItem cartItem;

  @override
  State<SingleProductOrderItem> createState() => _SingleProductOrderItemState();
}

class _SingleProductOrderItemState extends State<SingleProductOrderItem> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                        text: widget.cartItem.menuItem.name,
                        children: [TextSpan(text: "\n${cFPrice(widget.cartItem.totalItemPrice)}")]),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  widget.cartItem.selectedProductOptions.isNotEmpty
                      ? GestureDetector(
                          onTap: () => setState(() {
                            _showOptions = !_showOptions;
                          }),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey[800],
                            child: Icon(
                              _showOptions ? Icons.remove : Icons.add,
                              size: 19,
                              color: themeShade300,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ] +
            widget.cartItem.selectedProductOptions
                .map<int, Widget>(
                  (key, value) => MapEntry(
                    key,
                    _showOptions
                        ? Text.rich(
                            TextSpan(
                              text: value.name,
                              children: [TextSpan(text: " - "), TextSpan(text: cFPrice(value.price))],
                            ),
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        : SizedBox.shrink(),
                  ),
                )
                .values
                .toList());
  }
}
