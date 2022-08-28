import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuViewFloatingBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
// import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
// import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class DetailCartItemView extends StatefulWidget {
  final CartItem item;
  const DetailCartItemView({Key? key, required this.item}) : super(key: key);
  @override
  _DetailCartItemViewState createState() => _DetailCartItemViewState();
}

class _DetailCartItemViewState extends State<DetailCartItemView> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      converter: UserCartViewModel.fromStore,
      // onInit: (store) {

      // },
      builder: (_, viewmodel) {
        return Stack(
          children: [
            Scaffold(
              body: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350.0,
                        child: CachedNetworkImage(
                          imageUrl: widget.item.menuItem.imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[800]!,
                                offset: Offset(0, -5),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(100)),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.menuItem.name,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          cFPrice(widget.item.totalItemPrice),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          parseHtmlString(widget.item.menuItem.description),
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.item.selectedProductOptions.length,
                          itemBuilder: (_, index) => ListTile(
                            // onTap: () => setState(() {
                            //   _selectedIndex = index;
                            //   viewmodel.selectedOptions[widget.productOptionsCategory.categoryID] =
                            //       widget.productOptionsCategory.listOfOptions[index];

                            //   viewmodel.reCalcTotals();
                            // }),
                            // selected: _selectedIndex == index,
                            // selectedTileColor: themeShade100,
                            dense: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // leading: Checkbox(
                            //   activeColor: Colors.grey[800],
                            //   value: _selectedIndex == index,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       _selectedIndex = index;
                            //       viewmodel.selectedOptions[widget.productOptionsCategory.categoryID] =
                            //           widget.productOptionsCategory.listOfOptions[index];

                            //       viewmodel.reCalcTotals();
                            //     });
                            //   },
                            // ),
                            title: Text(
                              widget.item.selectedProductOptions[index]!.name,
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                            trailing: Text(
                              cFPrice(widget
                                  .item.selectedProductOptions[index]!.price),
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              Padding(padding: EdgeInsets.only(bottom: 5)),
                        ),
                        // ProductOptionsView(),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DetailMenuViewFloatingBar(),
          ],
        );
      },
    );
  }
}
