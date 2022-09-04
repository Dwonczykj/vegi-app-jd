import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/deliveryMapViewFloatingBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';

class SwitchDeliveryCollectionModal extends StatefulWidget {
  const SwitchDeliveryCollectionModal({Key? key}) : super(key: key);
  @override
  _SwitchDeliveryCollectionModalState createState() =>
      _SwitchDeliveryCollectionModalState();
}

class _SwitchDeliveryCollectionModalState
    extends State<SwitchDeliveryCollectionModal> {
  String _dropdownValue = "L1";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      onInit: (store) {
        store.dispatch(fetchProductOptions(
            store.state.menuItemState.menuItem!.menuItemID));
      },
      builder: (_, viewmodel) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stack(
                  //   children: [
                  //     Container(
                  //       width: double.infinity,
                  //       height: 350.0,
                  //       child: CachedNetworkImage(
                  //         imageUrl: viewmodel.menuItem!.imageURL,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     Positioned(
                  //       bottom: -1,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey[800]!,
                  //               offset: Offset(0, -5),
                  //               blurRadius: 10,
                  //             )
                  //           ],
                  //           borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
                  //           color: Colors.white,
                  //         ),
                  //         width: MediaQuery.of(context).size.width,
                  //         height: 30,
                  //       ),
                  //     ),

                  //   ],
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              viewmodel.isDelivery
                                  ? "Delivering To "
                                  : "Collection",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            viewmodel
                                    .isDelivery //TODO Convert Delivery to dropdown button list to within the bottom modal
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 1.5),
                                    child: DropdownButton<String>(
                                      menuMaxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      alignment: Alignment.centerLeft,
                                      isDense: true,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: "Europa",
                                      ),
                                      value: _dropdownValue,
                                      borderRadius: BorderRadius.circular(10),
                                      underline: SizedBox.shrink(),
                                      items: viewmodel.postalCodes
                                          .map(
                                            (value) => DropdownMenuItem<String>(
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              value: value,
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _dropdownValue = value!;
                                          viewmodel.changeOutCode(value);
                                        });
                                      },
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DeliveryMapViewFloatingBar(
              selectedOutCode: _dropdownValue,
            ),
          ],
        );
      },
    );
  }
}
