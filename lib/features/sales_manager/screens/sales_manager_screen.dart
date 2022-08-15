import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/inventory/screens/add_menu_item_screen.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/MenuStickyHeader.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleFeaturedMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/singleRegularMenuItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/restaurantMenuAppBar.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

class SalesManagerScreen extends StatefulWidget {
  const SalesManagerScreen({Key? key, required this.menuList})
      : super(key: key);

  @override
  State<SalesManagerScreen> createState() => _SalesManagerScreenState();

  final List<RestaurantMenuItem> menuList;
}

class _SalesManagerScreenState extends State<SalesManagerScreen> {
  List<RestaurantMenuItem> _featuredList = [];
  List<RestaurantMenuItem> _regularList = [];

  @override
  void initState() {
    widget.menuList.forEach((element) {
      element.isFeatured
          ? _featuredList.add(element)
          : _regularList.add(element);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantMenuAppBar(),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        openBuilder: (BuildContext context, VoidCallback _) {
          return AddMenuItemScreen();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(56 / 2),
          ),
        ),
        closedColor: themeShade400,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.grey[800],
              ),
            ),
          );
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: MenuStickyHeader(title: "Featured Items"),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      SingleFeaturedMenuItem(menuItem: _featuredList[index]),
                  childCount: _featuredList.length,
                ),
              ),
            ),
          ),
          SliverStickyHeader(
            header: MenuStickyHeader(
              title: "Regular Items",
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      SingleRegularMenuItem(menuItem: _regularList[index]),
                  childCount: _regularList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
