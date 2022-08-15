import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart' as intl;
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/contacts/screens/send_amount.dart';
import 'package:vegan_liverpool/features/shared/dialogs/scan_qr.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/inventory.dart';

class ProductManageScreen extends StatefulWidget {
  final String menuItemID;
  final String itemName;
  final String itemDescription;

  final num itemBasePrice;

  final int priority;

  final bool isAvailable;

  final bool
      isFeatured; //only accessible to edit to platform admins not merchant accounts
  final String? featuredItemImage;

  final List<ProductOptionsCategory>? productOptions;

  final Map<String, int>? extras;

  final String? category;

  final String? barcodeData;
  //!... placeholder for ESC attributes

  //TODO: Do i need to consider String Category and Map<String,int> extras

  ProductManageScreen({
    Key? key,
    required String? menuItemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemBasePrice,
    required this.isAvailable,
    required this.isFeatured,
    required this.featuredItemImage,
    required this.productOptions,
    this.priority = 0,
    this.barcodeData,
    required this.category,
    required this.extras,
  })  : this.menuItemID = menuItemID ?? '',
        super(key: key);

  @override
  _ProductManageScreenState createState() => _ProductManageScreenState();
}

class _ProductManageScreenState extends State<ProductManageScreen> {
  String? barcodeData;
  String itemName = "";
  String itemDescription = "";

  num itemBasePrice = 0.0;

  int priority = 0;

  bool isAvailable = true;

  bool isFeatured =
      false; //only accessible to edit to platform admins not merchant accounts
  String? featuredItemImage;

  List<ProductOptionsCategory> productOptions = <ProductOptionsCategory>[];

  Map<String, int> extras = <String, int>{};
  String category = '';

  //!... placeholder for ESC attributes

  //Input Controllers
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController basePriceController;
  late TextEditingController basePriceController2;
  late TextEditingController priorityIntController;
  late TextEditingController isAvailableController;
  late TextEditingController isFeaturedController;
  late TextEditingController featuredImageController;

  bool get isEdit => widget.menuItemID == '';

  Future<String?> scanBarcode() async {
    return await showDialog<String>(
      context: context,
      builder: (context) => ScanQRDialog(),
    );
  }

  void scan() async {
    String? barcodeData = await scanBarcode();
    setState(() {
      barcodeData = barcodeData;
    });
  }

  @override
  void initState() {
    barcodeData = widget.barcodeData;
    nameController = TextEditingController(text: widget.itemName);
    descriptionController = TextEditingController(text: widget.itemDescription);
    basePriceController =
        TextEditingController(text: widget.itemBasePrice.toString());
    basePriceController2 =
        TextEditingController(text: widget.itemBasePrice.toString());
    priorityIntController =
        TextEditingController(text: widget.priority.toString());
    isAvailable = widget.isAvailable;
    isFeatured = widget.isFeatured;
    featuredImageController =
        TextEditingController(text: widget.featuredItemImage);
    productOptions = widget.productOptions ?? <ProductOptionsCategory>[];

    if (widget.category != null) category = widget.category!;
    if (widget.extras != null) extras = widget.extras!;

    super.initState();

    // nameController.addListener(_printLatestValue);
    // descriptionController.addListener(_printLatestValue);
    // basePriceController.addListener(_printLatestValue);
    // priorityIntController.addListener(_printLatestValue);
    // isAvailableController.addListener(_printLatestValue);
    // isFeaturedController.addListener(_printLatestValue);
    // featuredImageController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    basePriceController.dispose();
    basePriceController2.dispose();
    priorityIntController.dispose();
    isAvailableController.dispose();
    isFeaturedController.dispose();
    featuredImageController.dispose();

    super.dispose();
  }

  intl.NumberFormat intlCurrency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return intl.NumberFormat.simpleCurrency(locale: locale.toString());
    // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    // print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _amountValidator = RegExInputFormatter.withRegex(
      '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InventoryViewModel>(
      converter: InventoryViewModel.fromStore,
      distinct: true,
      // onInit: (store) {
      //   store.state.cartState.restaurantID != ""
      //       ? store.dispatch(getFullfillmentMethods())
      //       : null;
      // },
      builder: (_, viewmodel) {
        return Scaffold(
            appBar: CustomAppBar(
              pageTitle: "Add Product",
              otherAction: IconButton(
                onPressed: () => scan(),
                icon: ImageIcon(
                  AssetImage("assets/images/scan.png"),
                ),
              ),
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: 'Product name',
                                    ),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 16.0),
                                  TextField(
                                    decoration: new InputDecoration(
                                        labelText: "Price (" +
                                            intlCurrency(context)
                                                .currencySymbol +
                                            ")"),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: basePriceController,
                                  ),
                                  SizedBox(height: 16.0),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    I10n.of(context).how_much,
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xFF898989,
                                                      ),
                                                    ),
                                                  ),
                                                  // useMax(),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: AutoSizeTextField(
                                                      maxLines: 1,
                                                      // readOnly: true,
                                                      presetFontSizes: [
                                                        40,
                                                        30,
                                                        20,
                                                        18,
                                                        16,
                                                      ],
                                                      inputFormatters: [
                                                        _amountValidator
                                                      ],
                                                      controller:
                                                          basePriceController,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        fillColor:
                                                            Theme.of(context)
                                                                .canvasColor,
                                                        hintText: '0',
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        disabledBorder:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  // !args.useBridge &&
                                                  //         viewModel
                                                  //             .tokens.isNotEmpty
                                                  //     ? InkWell(
                                                  //         focusColor:
                                                  //             Theme.of(context)
                                                  //                 .canvasColor,
                                                  //         highlightColor:
                                                  //             Theme.of(context)
                                                  //                 .canvasColor,
                                                  //         onTap: () {
                                                  //           showBottomMenu(
                                                  //               viewModel);
                                                  //         },
                                                  //         child: Container(
                                                  //             padding: EdgeInsets
                                                  //                 .symmetric(
                                                  //                     horizontal:
                                                  //                         15,
                                                  //                     vertical:
                                                  //                         5),
                                                  //             decoration:
                                                  //                 BoxDecoration(
                                                  //               shape: BoxShape
                                                  //                   .rectangle,
                                                  //               color: Theme.of(
                                                  //                       context)
                                                  //                   .colorScheme
                                                  //                   .secondary,
                                                  //               borderRadius:
                                                  //                   BorderRadius
                                                  //                       .circular(
                                                  //                           6),
                                                  //             ),
                                                  //             child: Row(
                                                  //               mainAxisSize:
                                                  //                   MainAxisSize
                                                  //                       .min,
                                                  //               children: <
                                                  //                   Widget>[
                                                  //                 Text(
                                                  //                   selectedToken
                                                  //                           ?.symbol ??
                                                  //                       '',
                                                  //                   style:
                                                  //                       TextStyle(
                                                  //                     fontSize:
                                                  //                         20,
                                                  //                     fontWeight:
                                                  //                         FontWeight
                                                  //                             .bold,
                                                  //                   ),
                                                  //                 ),
                                                  //                 SizedBox(
                                                  //                   width: 10,
                                                  //                 ),
                                                  //                 SvgPicture
                                                  //                     .asset(
                                                  //                   'assets/images/dropdown_icon.svg',
                                                  //                   width: 9,
                                                  //                   height: 9,
                                                  //                 )
                                                  //               ],
                                                  //             )),
                                                  //       )
                                                  //     : SizedBox.shrink(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.only(
                                        //     left: 40,
                                        //     top: 20,
                                        //     bottom: 20,
                                        //     right: 40,
                                        //   ),
                                        //   child: Divider(
                                        //     thickness: 1.5,
                                        //   ),
                                        // ),
                                        // NumericKeyboard(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   onKeyboardTap: _onKeyPress,
                                        //   rightButtonFn: () {
                                        //     _onKeyPress('', back: true);
                                        //   },
                                        //   rightIcon: SvgPicture.asset(
                                        //     'assets/images/backspace.svg',
                                        //     // width: 28,
                                        //   ),
                                        //   leftButtonFn: () {
                                        //     if (textEditingController.text
                                        //         .contains('.')) {
                                        //       return;
                                        //     } else {
                                        //       setState(() {
                                        //         textEditingController.text =
                                        //             textEditingController.text +
                                        //                 '.';
                                        //       });
                                        //     }
                                        //   },
                                        //   leftIcon: Icon(
                                        //     Icons.fiber_manual_record,
                                        //     size: 10,
                                        //     color: Theme.of(context)
                                        //         .colorScheme
                                        //         .onSurface,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Validate returns true if the form is valid, or false otherwise.
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            //TODO: Switch to Flushbar
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                          if (isEdit) {
                                            viewmodel.updateMenuItemInInventory(
                                              stateToMenuItem(viewmodel),
                                            );
                                          } else {
                                            viewmodel.addMenuItemToInventory(
                                                stateToMenuItem(viewmodel));
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Product updated!')),
                                          );
                                          context.router
                                              .push(InventoryManagerScreen());
                                        }
                                      },
                                      child: Text(I10n.of(context).save_button),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 40,
                          bottom: 40,
                        ),
                        child: Center(
                          child: PrimaryButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  //TODO: Switch to Flushbar
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                if (isEdit) {
                                  viewmodel.updateMenuItemInInventory(
                                    stateToMenuItem(viewmodel),
                                  );
                                } else {
                                  viewmodel.addMenuItemToInventory(
                                      stateToMenuItem(viewmodel));
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Product updated!')),
                                );
                                context.router.push(InventoryManagerScreen());
                              }
                            },
                            label: this.isEdit
                                ? I10n.of(context).edit
                                : I10n.of(context).add_cash,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ) //todo: use a scrollable one to stop overrenders
            );
      },
    );
  }

  RestaurantMenuItem stateToMenuItem(InventoryViewModel viewModel) {
    return RestaurantMenuItem(
      menuItemID: widget.menuItemID,
      restaurantID: viewModel.userEmployedByRestaurantWithID ??
          '', //TODO: add checks to not load inventory routes or allow inventory actions if not a merchantUserAccount with registered restarantId
      name: nameController.text,
      imageURL: featuredImageController.text,
      category:
          category, //TODO: Add a select dropdown to select the category, might be an api call we can cache to get the values.
      price: (num.parse(basePriceController.text) * 100)
          .round(), //!BUG: This will break when we start not using a currency with a base of 100.
      description: descriptionController.text,
      extras: extras,
      listOfProductOptions: productOptions,
      isFeatured: isFeatured,
      priority: priority,
    );
  }
}
