import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
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
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      // backgroundColor: themeShade500,
                                    ),
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
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "Collection",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      // backgroundColor: themeShade500,
                                    ),
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
                        // SizedBox(
                        //   height: 100,
                        // ),
                        DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: ["L1", "L2", "L3"],
                          // dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration),
                          onChanged: (item) {
                            if (item != null) viewmodel.changeOutCode(item);
                          },
                          selectedItem: ["L1", "L2", "L3"].first,
                        ),
                        // DirectSelectContainer(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       verticalDirection: VerticalDirection.down,
                        //       children: <Widget>[
                        //         Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Column(
                        //             children: <Widget>[
                        //               Container(
                        //                 alignment:
                        //                     AlignmentDirectional.centerStart,
                        //                 margin: EdgeInsets.only(left: 4),
                        //                 child: Text("Postcode"),
                        //               ),
                        //               Padding(
                        //                 padding: const EdgeInsets.fromLTRB(
                        //                     0, 8, 0, 0),
                        //                 child: Card(
                        //                   child: Row(
                        //                     mainAxisSize: MainAxisSize.max,
                        //                     children: <Widget>[
                        //                       // Container(
                        //                       //     padding: EdgeInsets.all(4.0),
                        //                       //     child:
                        //                       //         SizedBox(height: 150.0),
                        //                       //     color: Colors.greenAccent),
                        //                       Container(
                        //                         color: Colors.purple[100],
                        //                         constraints: BoxConstraints(
                        //                             maxHeight: 150,
                        //                             maxWidth: 200),
                        //                         padding:
                        //                             EdgeInsets.only(left: 12),
                        //                         child: DirectSelectList<String>(
                        //                             values:
                        //                                 // viewmodel.postalCodes,
                        //                                 ['L1', 'L2', 'L3'],
                        //                             defaultItemIndex: 0,
                        //                             itemBuilder: (value) =>
                        //                                 DirectSelectItem<
                        //                                     String>(
                        //                                   itemHeight: 56,
                        //                                   itemBuilder:
                        //                                       ((context,
                        //                                               value) =>
                        //                                           Text(
                        //                                             value,
                        //                                             style: TextStyle(
                        //                                                 fontSize:
                        //                                                     20),
                        //                                           )),
                        //                                   value: value,
                        //                                 ),
                        //                             focusedItemDecoration:
                        //                                 _getDslDecoration(),
                        //                             onItemSelectedListener:
                        //                                 (item, index, context) {
                        //                               viewmodel
                        //                                   .changeOutCode(item);
                        //                             }),
                        //                       ),
                        //                       Container(
                        //                           child: SizedBox(height: 400),
                        //                           color: Colors.blueAccent),
                        //                       Padding(
                        //                         padding:
                        //                             EdgeInsets.only(right: 8),
                        //                         child: Icon(
                        //                           Icons.unfold_more,
                        //                           color: Colors.black38,
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // DeliveryMapViewFloatingBar(
            //   selectedOutCode: _dropdownValue,
            // ),
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
