import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/deliveryMapViewFloatingBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   viewmodel.isDelivery
                            //       ? "Delivering To "
                            //       : "Collection",
                            //   style: TextStyle(
                            //     fontSize: 22,
                            //     fontWeight: FontWeight.w900,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () => {viewmodel.setIsDelivery(true)},
                              child: Container(
                                child: Text(
                                  "Delivery",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    // backgroundColor: themeShade500,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: viewmodel.isDelivery
                                      ? themeShade500
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: const Color(0xFF000000),
                                      width: 4.0,
                                      style: BorderStyle.solid), //Border.all
                                  /*** The BorderRadius widget  is here ***/
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ), //BorderRadius.all
                                ), //BoxDecoration
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {viewmodel.setIsDelivery(false)},
                              child: Container(
                                child: Text(
                                  "Collection",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    // backgroundColor: themeShade500,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: viewmodel.isDelivery
                                      ? Colors.transparent
                                      : themeShade500,
                                  border: Border.all(
                                      color: const Color(0xFF000000),
                                      width: 4.0,
                                      style: BorderStyle.solid), //Border.all
                                  /*** The BorderRadius widget  is here ***/
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ), //BorderRadius.all
                                ), //BoxDecoration
                              ),
                            ),
                            // viewmodel.isDelivery //TODO Convert Delivery to dropdown button list to within the bottom modal
                            //     ? Padding(
                            //         padding: const EdgeInsets.only(bottom: 1.5),
                            //         child: DropdownButton<String>(
                            //           menuMaxHeight:
                            //               MediaQuery.of(context).size.height *
                            //                   0.3,
                            //           alignment: Alignment.centerLeft,
                            //           isDense: true,
                            //           style: TextStyle(
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.w700,
                            //             color: Colors.black,
                            //             fontFamily: "Europa",
                            //           ),
                            //           value: _dropdownValue,
                            //           borderRadius: BorderRadius.circular(10),
                            //           underline: SizedBox.shrink(),
                            //           items: viewmodel.postalCodes
                            //               .map(
                            //                 (value) => DropdownMenuItem<String>(
                            //                   child: Text(
                            //                     value,
                            //                     style: TextStyle(fontSize: 20),
                            //                   ),
                            //                   value: value,
                            //                 ),
                            //               )
                            //               .toList(),
                            //           onChanged: (value) {
                            //             setState(() {
                            //               _dropdownValue = value!;
                            //               viewmodel.changeOutCode(value);
                            //             });
                            //           },
                            //         ),
                            //       )
                            //     : SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 50, 5, 10),
                          child: Card(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                    child: Padding(
                                        child: DirectSelectList<String>(
                                            values: viewmodel.postalCodes,
                                            defaultItemIndex: 0,
                                            itemBuilder: (value) =>
                                                DirectSelectItem<String>(
                                                  itemHeight: 56,
                                                  itemBuilder:
                                                      ((context, value) => Text(
                                                            value,
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          )),
                                                  value: value,
                                                ),
                                            focusedItemDecoration:
                                                _getDslDecoration(),
                                            onItemSelectedListener:
                                                (item, index, context) {
                                              viewmodel.changeOutCode(item);
                                            }),
                                        padding: EdgeInsets.only(left: 12))),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.unfold_more,
                                    color: themeAccent600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
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

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
}
