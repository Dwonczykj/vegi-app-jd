import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/inventory/screens/product_manage_screen.dart';
// import 'package:decimal/decimal.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:vegan_liverpool/features/shared/dialogs/scan_qr.dart';
// import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/redux/viewsmodels/inventory.dart';

class AddMenuItemScreen extends ProductManageScreen {
  AddMenuItemScreen({Key? key})
      : super(
          key: key,
          menuItemID: null,
          category: null,
          extras: null,
          itemName: "",
          itemDescription: "",
          itemBasePrice: 0.0,
          priority: 0,
          isAvailable: true,
          isFeatured: false,
          featuredItemImage: null,
          productOptions: null,
          barcodeData: null,
        );
}

// class AddItemScreen extends StatefulWidget {
//   const AddItemScreen({Key? key}) : super(key: key);

//   @override
//   _AddItemScreenState createState() => _AddItemScreenState();
// }

// class _AddItemScreenState extends State<AddItemScreen> {
//   String? barcodeData;
//   String itemName = "";
//   String itemDescription = "";

//   Decimal itemBasePrice = Decimal.zero;

//   int priority = 0;

//   bool isAvailable = true;

//   bool isFeatured =
//       false; //only accessible to edit to platform admins not merchant accounts
//   String? featuredItemImage;

//   //... placeholder for esc attributes

//   Future<String?> scanBarcode() async {
//     return await showDialog<String>(
//       context: context,
//       builder: (context) => ScanQRDialog(),
//     );
//   }

//   void scan() async {
//     String? barcodeData = await scanBarcode();
//     setState(() {
//       barcodeData = barcodeData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, InventoryViewModel>(
//       converter: InventoryViewModel.fromStore,
//       distinct: true,
//       // onInit: (store) {
//       //   store.state.cartState.restaurantID != ""
//       //       ? store.dispatch(getFullfillmentMethods())
//       //       : null;
//       // },
//       builder: (_, viewmodel) {
//         return Scaffold(
//             appBar: CustomAppBar(
//               pageTitle: "Add Product",
//               otherAction: IconButton(
//                 onPressed: () => scan(),
//                 icon: ImageIcon(
//                   AssetImage("assets/images/scan.png"),
//                 ),
//               ),
//             ),
//             body: Container(
//                 child: Column(
//               children: [
//                 Row(
//                   children: [],
//                 )
//               ],
//             )) //todo: use a scrollable one to stop overrenders
//             );
//       },
//     );
//   }

//   Widget totalsPriceItemTile(String title, String trailing) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(color: Colors.grey),
//           ),
//           Text(
//             trailing,
//             style: TextStyle(fontWeight: FontWeight.w900),
//           ),
//         ],
//       ),
//     );
//   }
// }
