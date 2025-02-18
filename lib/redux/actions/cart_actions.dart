import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/eligibleDeliveryCollectionDates.dart';
import 'package:vegan_liverpool/models/restaurant/eligibleOrderDates.dart';
import 'package:vegan_liverpool/models/restaurant/fullfilmentMethods.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:wallet_core/wallet_core.dart';

class UpdateCartItems {
  final List<CartItem> cartItems;
  UpdateCartItems({required this.cartItems});
}

class UpdateComputedCartValues {
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountComputed;

  UpdateComputedCartValues(this.cartSubTotal, this.cartTax, this.cartTotal,
      this.cartDiscountComputed);
}

class UpdateCartDiscount {
  final int cartDiscountPercent;
  final String discountCode;
  UpdateCartDiscount(this.cartDiscountPercent, this.discountCode);
}

class ClearCart {
  ClearCart();
}

class UpdateSlots {
  final List<Map<String, String>> deliverySlots;
  final List<Map<String, String>> collectionSlots;

  UpdateSlots(this.deliverySlots, this.collectionSlots);
}

class UpdateEligibleOrderDates {
  final EligibleOrderDates eligibleCollectionDates;
  final EligibleOrderDates eligibleDeliveryDates;

  UpdateEligibleOrderDates(
      this.eligibleCollectionDates, this.eligibleDeliveryDates);
}

class UpdateSelectedDeliveryAddress {
  final DeliveryAddresses? selectedAddress;
  UpdateSelectedDeliveryAddress(this.selectedAddress);
}

class UpdateSelectedTimeSlot {
  final Map<String, String> selectedTimeSlot;
  UpdateSelectedTimeSlot(this.selectedTimeSlot);
}

class UpdateTipAmount {
  final int tipAmount;
  UpdateTipAmount(this.tipAmount);
}

class CreateOrder {
  final String orderID;
  final String paymentIntentID;
  CreateOrder(this.orderID, this.paymentIntentID);
}

class SetTransferringPayment {
  bool flag;
  SetTransferringPayment(this.flag);
}

class SetError {
  bool flag;
  SetError(this.flag);
}

class SetConfirmed {
  bool flag;
  SetConfirmed(this.flag);
}

class UpdateSelectedAmounts {
  final double GBPxAmount;
  final double PPLAmount;
  UpdateSelectedAmounts(this.GBPxAmount, this.PPLAmount);
}

class SetRestaurantDetails {
  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses restaurantAddress;
  final String walletAddress;
  final int minimumOrder;
  final int platformFee;

  SetRestaurantDetails(
    this.restaurantID,
    this.restaurantName,
    this.restaurantAddress,
    this.walletAddress,
    this.minimumOrder,
    this.platformFee,
  );
}

class SetDeliveryCharge {
  final int deliveryCharge;

  SetDeliveryCharge(this.deliveryCharge);
}

class SetFulfilmentFees {
  final int deliveryCharge;
  final int collectionCharge;

  SetFulfilmentFees(this.deliveryCharge, this.collectionCharge);
}

class SetFulfilmentMethodIds {
  final int deliveryMethodId;
  final int collectionMethodId;

  SetFulfilmentMethodIds(this.deliveryMethodId, this.collectionMethodId);
}

class SetFulfilmentMethod {
  final FulfilmentMethod fulfilmentMethod;
  SetFulfilmentMethod(this.fulfilmentMethod);
}

class SetIsDelivery {
  final bool isDelivery;
  SetIsDelivery(this.isDelivery);
}

class SetDeliveryInstructions {
  final String deliveryInstructions;
  SetDeliveryInstructions(this.deliveryInstructions);
}

ThunkAction getFullfillmentMethods({DateTime? newDate}) {
  return (Store store) async {
    try {
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      FullfilmentMethods fullfilmentMethods;

      if ([null, ""].contains(newDate)) {
        fullfilmentMethods = await peeplEatsService.getFulfilmentSlots(
            vendorID: store.state.cartState.restaurantID,
            dateRequired: formatter.format(DateTime.now()));
      } else {
        fullfilmentMethods = await peeplEatsService.getFulfilmentSlots(
            vendorID: store.state.cartState.restaurantID,
            dateRequired: formatter.format(newDate!));
      }
      store.dispatch(UpdateSlots(fullfilmentMethods.deliverySlots,
          fullfilmentMethods.collectionSlots));

      store.dispatch(UpdateEligibleOrderDates(
          fullfilmentMethods.eligibleCollectionDates,
          fullfilmentMethods.eligibleDeliveryDates));

      store.dispatch(SetFulfilmentFees(
        fullfilmentMethods.deliveryMethod == null
            ? 0
            : fullfilmentMethods.deliveryMethod!['priceModifier'] ?? 0,
        fullfilmentMethods.collectionMethod == null
            ? 0
            : fullfilmentMethods.collectionMethod!['priceModifier'] ?? 0,
      ));

      store.dispatch(SetFulfilmentMethodIds(
          fullfilmentMethods.deliveryMethod!['id'],
          fullfilmentMethods.collectionMethod!['id']));
    } catch (e, s) {
      log.error('ERROR - getFullfillmentMethods $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getFullfillmentMethods $e',
      );
    }
  };
}

ThunkAction getEligibleOrderDatesOnly() {
  return (Store store) async {
    try {
      EligibleDeliveryCollectionDates eligibleDates = await peeplEatsService
          .getEligibleOrderDates(vendorID: store.state.cartState.restaurantID);

      store.dispatch(UpdateEligibleOrderDates(
          eligibleDates.eligibleCollectionDates,
          eligibleDates.eligibleDeliveryDates));
    } catch (e, s) {
      log.error('ERROR - getEligibleOrderDatesOnly $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getEligibleOrderDatesOnly $e',
      );
    }
  };
}

ThunkAction updateCartTip(int newTip) {
  return (Store store) async {
    try {
      store.dispatch(UpdateTipAmount(newTip));
      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateCartTip $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCartTip $e',
      );
    }
  };
}

ThunkAction updateCartDiscount(
    String newDiscountCode, VoidCallback errorCallback) {
  return (Store store) async {
    try {
      if (newDiscountCode == 'REMOVE') {
        store.dispatch(UpdateCartDiscount(0, ""));
        store.dispatch(computeCartTotals());
      } else {
        int discountPercent =
            await peeplEatsService.checkDiscountCode(newDiscountCode).onError(
          (error, stackTrace) {
            errorCallback();
            return 0;
          },
        );

        if (discountPercent != 0) {
          store.dispatch(UpdateCartDiscount(discountPercent, newDiscountCode));
          store.dispatch(computeCartTotals());
        }
      }
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      errorCallback();
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction updateCartItems(List<CartItem> itemsToAdd) {
  return (Store store) async {
    try {
      List<CartItem> cartItems = List.from(store.state.cartState.cartItems);

      cartItems.addAll(itemsToAdd);

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction updateCartItemQuantity(CartItem itemToAdd) {
  return (Store store) async {
    try {
      List<CartItem> cartItems = store.state.cartState.cartItems;
      if (itemToAdd.itemQuantity == 0) {
        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);
      } else {
        int index = cartItems.indexWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.insert(index, itemToAdd);
      }

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction computeCartTotals() {
  return (Store store) async {
    try {
      List<CartItem> cartItems = store.state.cartState.cartItems;

      int cartSubTotal = 0;
      int cartTax = 0;
      int cartTotal = 0;
      int deliveryPrice = store.state.cartState.cartDeliveryCharge;
      int platformFee = store.state.cartState.restaurantPlatformFee;
      int cartDiscountPercent = store.state.cartState.cartDiscountPercent;
      int cartDiscountComputed = 0;
      int cartTip = store.state.cartState.selectedTipAmount * 100;

      cartItems.forEach((element) {
        cartSubTotal += element.totalItemPrice;
      });

      // add price of each order Item (which has options included)

      cartDiscountComputed =
          (cartSubTotal * cartDiscountPercent) ~/ 100; // subtotal * discount

      //cartTax = ((cartSubTotal - cartDiscountComputed) * 5) ~/ 100;

      cartTotal =
          (cartSubTotal + cartTax + cartTip + deliveryPrice + platformFee) -
              cartDiscountComputed;

      store.dispatch(UpdateComputedCartValues(
          cartSubTotal, cartTax, cartTotal, cartDiscountComputed));
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction prepareAndSendOrder(void Function(String errorText) errorCallback,
    VoidCallback successCallback) {
  return (Store store) async {
    try {
      if (store.state.cartState.fulfilmentMethod == FulfilmentMethod.none) {
        errorCallback("Please select or create an address");
        return;
      } else if (store.state.cartState.selectedTimeSlot.isEmpty) {
        errorCallback("Please select a time slot");
        return;
      } else if (store.state.cartState.restaurantMinimumOrder >
          store.state.cartState.cartTotal) {
        errorCallback("Your order does not satisfy the minimum order amount");
        return;
      }

      Map<String, dynamic> orderObject = {};

      orderObject.addAll({
        "items": store.state.cartState.cartItems
            .map(
              (e) => {
                "id": int.parse(e.menuItem.menuItemID),
                "quantity": e.itemQuantity,
                "options": e.selectedProductOptions.map(
                  (key, value) =>
                      MapEntry<String, int>(key.toString(), value.optionID),
                ),
              },
            )
            .toList(),
        "total": store.state.cartState.cartTotal,
        "tipAmount": store.state.cartState.selectedTipAmount * 100,
        "marketingOptIn": false,
        "discountCode": store.state.cartState.discountCode,
        "vendor": store.state.cartState.restaurantID,
        "walletAddress": store.state.userState.walletAddress,
      });

      if (store.state.cartState.fulfilmentMethod == FulfilmentMethod.delivery) {
        if (store.state.cartState.selectedDeliveryAddress == null) {
          errorCallback("Please select an address");
          return;
        }
        DeliveryAddresses selectedAddress =
            store.state.cartState.selectedDeliveryAddress!;

        orderObject.addAll(
          {
            "address": {
              "name": store.state.userState.displayName,
              "phoneNumber": selectedAddress.phoneNumber ??
                  store.state.userState.phoneNumber ??
                  "",
              "email": store.state.userState.email == ""
                  ? "email@notprovided.com"
                  : store.state.userState.email,
              "lineOne": selectedAddress.addressLine1,
              "lineTwo": selectedAddress.addressLine2 +
                  ", " +
                  selectedAddress.townCity,
              "city": selectedAddress.townCity,
              "postCode": selectedAddress.postalCode,
              "deliveryInstructions":
                  store.state.cartState.deliveryInstructions,
            },
            "fulfilmentMethod": store.state.cartState.deliveryMethodId,
            "fulfilmentSlotFrom": formatDateForOrderObject(
                store.state.cartState.selectedTimeSlot.entries.first.value),
            "fulfilmentSlotTo": formatDateForOrderObject(
                store.state.cartState.selectedTimeSlot.entries.last.value),
          },
        );
      } else if (store.state.cartState.fulfilmentMethod ==
          FulfilmentMethod.collection) {
        orderObject.addAll(
          {
            "address": {
              "name": "Collection Order",
              "email": "order@collection.com",
              "phoneNumber": "12345678910",
              "lineOne": "10 Collection Street",
              "lineTwo": "",
              "city": "",
              "postCode": "L7 0HG",
              "deliveryInstructions":
                  store.state.cartState.deliveryInstructions,
            },
            "fulfilmentMethod": store.state.cartState.collectionMethodId,
            "fulfilmentSlotFrom": formatDateForOrderObject(
                store.state.cartState.selectedTimeSlot.entries.first.value),
            "fulfilmentSlotTo": formatDateForOrderObject(
                store.state.cartState.selectedTimeSlot.entries.last.value),
          },
        );
      }

      print("Order Object Created: ${json.encode(orderObject).toString()}");

      //Call create order API with prepared orderobject
      Map result = await peeplEatsService
          .createOrder(orderObject)
          .timeout(Duration(seconds: 10), onTimeout: () {
        return {}; //return empty map on timeout to trigger errorCallback
      });

      if (result.isNotEmpty) {
        //Call Peepl Pay API to start checking the paymentIntentID
        Map checkResult = await peeplPayService
            .startPaymentIntentCheck(result['paymentIntentID']);

        print("Order Result $result");

        //Crosscheck the PaymentIntentID with the amount calculcated on device.
        if (checkResult['paymentIntent']['amount'] ==
            store.state.cartState.cartTotal) {
          store.dispatch(CreateOrder(
              result['orderID'].toString(), result['paymentIntentID']));

          //subscribe to firebase topic of orderID
          final String fbOrderId = 'order-' + result['orderID'].toString();
          // if(FirebaseInjectableModule.assertTopicNameIsValid(fbOrderId))
          firebaseMessaging.subscribeToTopic(fbOrderId);

          successCallback();
        } else {
          //check if it is better to just update the total value with the api returned or return an error
          errorCallback("Order totals aren't matching");
        }
      } else {
        errorCallback("Our servers seem to be down");
      }
    } catch (e, s) {
      errorCallback(
          "${I10n.current.something_went_wrong} when preparing and sending the order");
      log.error('ERROR - prepareAndSendOrder $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareAndSendOrder $e',
      );
    }
  };
}

ThunkAction sendTokenPayment(VoidCallback successCallback,
    void Function(String errorText) errorCallback) {
  return (Store store) async {
    // Formulate Error Message
    String errMsg = '';
    try {
      //Set loading to true
      store.dispatch(SetTransferringPayment(true));

      errMsg = 'fetching GBPx balance';

      //Get tokens for GBPx and PPL
      Token GBPxToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) =>
            token.symbol.toLowerCase() == "GBPx".toString().toLowerCase(),
      );

      errMsg = 'fetching PPL balance';

      Token PPLToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) => token.symbol.toLowerCase() == "PPL".toString().toLowerCase(),
      );

      errMsg = 'transferring GBPx balance to recipient';
      //If Selected GBPx amount is not 0, transfer GBPx
      Map<String, dynamic> GBPxResponse =
          store.state.cartState.selectedGBPxAmount != 0.0
              ? double.parse(GBPxToken.getBalance().replaceAll(",", "")) >
                      store.state.cartState.selectedGBPxAmount
                  ? await walletApi.tokenTransfer(
                      getIt<Web3>(instanceName: 'fuseWeb3'),
                      store.state.userState.walletAddress,
                      GBPxToken.address,
                      store.state.cartState.restaurantWalletAddress,
                      store.state.cartState.selectedGBPxAmount.toString(),
                      externalId: store.state.cartState.paymentIntentID,
                    )
                  : {}
              : {};

      print(GBPxResponse);

      errMsg = 'transferring PPL balance to recipient';
      //If Selected PPL Amount is not 0, transfer PPL
      Map<String, dynamic> PPLResponse =
          store.state.cartState.selectedPPLAmount != 0.0
              ? double.parse(PPLToken.getBalance().replaceAll(",", "")) >
                      store.state.cartState.selectedPPLAmount
                  ? await walletApi.tokenTransfer(
                      getIt<Web3>(instanceName: 'fuseWeb3'),
                      store.state.userState.walletAddress,
                      PPLToken.address,
                      store.state.cartState.restaurantWalletAddress,
                      store.state.cartState.selectedPPLAmount.toString(),
                      externalId: store.state.cartState.paymentIntentID,
                    )
                  : {}
              : {};

      print(PPLResponse);

      //Make periodic API calls to check the order status
      //If status is paid, then set loading = false, and confirmed = true

      errMsg = '';
      if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
        errMsg = 'waiting for order status response after transferring payment';
        Timer.periodic(
          const Duration(seconds: 4),
          (timer) async {
            final Future<Map<dynamic, dynamic>> checkOrderResponse =
                peeplEatsService
                    .checkOrderStatus(store.state.cartState.orderID);

            checkOrderResponse.then(
              (completedValue) {
                if (completedValue['paymentStatus'] == "paid") {
                  store.dispatch(SetTransferringPayment(false));
                  store.dispatch(SetConfirmed(true));
                  successCallback();
                  timer.cancel();
                }
              },
            );
          },
        );
      }
    } catch (e, s) {
      store.dispatch(SetError(true));
      errorCallback(errMsg);
      log.error('ERROR - sendTokenPayment $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendTokenPayment $e',
      );
    }
  };
}

ThunkAction setRestaurantDetails({
  required String restaurantID,
  required String restaurantName,
  required DeliveryAddresses restaurantAddress,
  required String walletAddress,
  required int minimumOrder,
  required int platformFee,
  required VoidCallback sendSnackBar,
}) {
  return (Store store) async {
    try {
      //If cart has existing items -> clear cart, set new restaurant details, show snackbar if cart had items.

      if (store.state.cartState.restaurantName.isNotEmpty &&
          store.state.cartState.restaurantID.isNotEmpty) {
        sendSnackBar();
        store.dispatch(ClearCart());
        store.dispatch(
          SetRestaurantDetails(
            restaurantID,
            restaurantName,
            restaurantAddress,
            walletAddress,
            minimumOrder,
            platformFee,
          ),
        );
      } else {
        store.dispatch(
          SetRestaurantDetails(
            restaurantID,
            restaurantName,
            restaurantAddress,
            walletAddress,
            minimumOrder,
            platformFee,
          ),
        );
      }
      // If cart does not have existing items -> set new restaurant details

    } catch (e, s) {
      store.dispatch(SetError(true));
      log.error('ERROR - setRestaurantDetails $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setRestaurantDetails $e',
      );
    }
  };
}
