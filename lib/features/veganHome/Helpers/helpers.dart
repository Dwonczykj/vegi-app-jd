import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:platform/platform.dart';

String cFPrice(int price) {
  //isPence ? price = price ~/ 100 : price;
  return "£" + (price / 100).toStringAsFixed(2);
}

String cFPriceNoDec(int price) {
  //isPence ? price = price ~/ 100 : price;
  return "£" + (price / 100).toStringAsFixed(0);
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

String mapPreviewImage({required double latitude, required double longitude}) {
  final _apiKey = Platform.operatingSystemValues == Platform.iOS
      ? dotenv.env['MAP_API_KEY_IOS'] ?? ""
      : dotenv.env['MAP_API_KEY_ANDROID'] ?? "";

  return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$_apiKey&style=feature:|element:|visibility:simplified';
}

String mapToString(Map<String, String> map) {
  DateTime startTime = DateTime.parse(map.entries.first.value);
  DateTime endTime = DateTime.parse(map.entries.last.value);

  return "${startTime.hour.toString()}:00 - ${endTime.hour.toString()}:00";
}

String mapToStringDate(Map<String, String> map) {
  DateTime startTime = DateTime.parse(map.entries.first.value);
  DateFormat formatter = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY);
  return formatter.format(startTime);
}

String formatDateForOrderObject(String date) {
  return date.replaceFirst("T", " ").replaceFirst(".000Z", "");
}

String formatDate(DateTime dateToFormat) {
  DateFormat formatter = DateFormat("HH:mm - EEE, dd MMM");

  return formatter.format(dateToFormat);
}

String formatDateForCalendar(DateTime dateToFormat) {
  DateFormat formatter = DateFormat("EEE, dd MMM");

  return formatter.format(dateToFormat);
}

List<Map<String, dynamic>> sanitizeOrdersList(Map<String, dynamic> orderObj) {
  List<Map<String, dynamic>> listOfOrders = [];

  orderObj['orders'].forEach((singleOrder) {
    //Order Details
    Map<String, dynamic> sanitizedOrderObject = {};

    sanitizedOrderObject["orderID"] = singleOrder['id'];
    sanitizedOrderObject["total"] = cFPrice(singleOrder['total']);
    sanitizedOrderObject["orderedDateTime"] =
        formatDate(DateTime.fromMillisecondsSinceEpoch(singleOrder['orderedDateTime']).toLocal());
    sanitizedOrderObject["deliveryName"] = singleOrder['deliveryName'];
    sanitizedOrderObject["deliveryEmail"] = singleOrder['deliveryEmail'];
    sanitizedOrderObject["deliveryPhoneNumber"] = singleOrder['deliveryPhoneNumber'];
    sanitizedOrderObject["deliveryAddressLineOne"] = singleOrder['deliveryAddressLineOne'];
    sanitizedOrderObject["deliveryAddressLineTwo"] = singleOrder['deliveryAddressLineTwo'];
    sanitizedOrderObject["deliveryAddressPostCode"] = singleOrder['deliveryAddressPostCode'];
    sanitizedOrderObject["paymentStatus"] =
        singleOrder['paymentStatus'][0].toUpperCase() + singleOrder['paymentStatus'].substring(1);
    sanitizedOrderObject['rewardsIssued'] = singleOrder['rewardsIssued'];
    sanitizedOrderObject["restaurantName"] = singleOrder['vendor']['name'];
    sanitizedOrderObject["restaurantPhoneNumber"] = singleOrder['vendor']['phoneNumber'];
    sanitizedOrderObject['restaurantAccepted'] = singleOrder['restaurantAccepted'];
    sanitizedOrderObject['restaurantAcceptanceStatus'] = singleOrder['restaurantAcceptanceStatus'];
    sanitizedOrderObject["isCollection"] = singleOrder['fulfilmentMethod'] == 2 ? true : false;

    List<Map<String, dynamic>> listOfProductsOrdered = [];
    //Products in Order
    singleOrder['items'].forEach((productItem) {
      Map<String, dynamic> singleProductItem = {};
      singleProductItem['name'] = productItem['product']['name'];
      singleProductItem['basePrice'] = cFPrice(productItem['product']['basePrice']);

      //Options in Product
      if (productItem.containsKey("optionValues")) {
        List<Map<String, dynamic>> listOfChosenProductOptions = [];
        productItem['optionValues'].forEach((productOption) {
          //Add Options in Product to ListOfProductOptions.
          listOfChosenProductOptions.add({
            'name': productOption['option']['name'],
            'chosenOption': productOption['optionValue']['name'],
            'priceModifier': productOption['optionValue']['priceModifier'],
          });
        });
        singleProductItem['options'] = listOfChosenProductOptions;
      }
      //Add SingleProductItem to listOfProductsOrdered, clear listOfProductOptions
      listOfProductsOrdered.add(singleProductItem);
    });
    sanitizedOrderObject['products'] = listOfProductsOrdered;
    listOfOrders.add(sanitizedOrderObject);
  });
  return listOfOrders;
}

bool isScheduledDelivery(Map<String, String> selectedSlot) {
  DateTime startTime = DateTime.parse(selectedSlot.entries.first.value);
  if (startTime.difference(DateTime.now()).inHours > 5) {
    return true;
  } else {
    return false;
  }
}

bool shouldEndOngoing(Map<String, String> selectedSlot) {
  DateTime endTime = DateTime.parse(selectedSlot.entries.last.value);
  if (endTime.isBefore(DateTime.now())) {
    return true;
  } else {
    return false;
  }
}

double getPPLValueFromPence(num penceAmount) {
  return penceAmount / 10;
}

double getPPLRewardsFromPence(num penceAmount) {
  return getPPLValueFromPence((penceAmount * 5) / 100);
}

// Conversion
// 1000GBP => 100,000 => 10,000 PPL Tokens
// 1GBP => 100 pence => 10 PPL tokens

// Reward Conversion Rate (5% reward)
// 1GBP => 100 pence => 5 pence => 0.5 PPL
// 1000GBP => 100,000 pence => 5000 pence => 500 PPL Tokens

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    return this.add(
      Duration(
        days: (day - this.weekday) % DateTime.daysPerWeek,
      ),
    );
  }
}

extension CapitalizeString on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

String sanitizeDateTime(DateTime dateTime) =>
    "${dateTime.year}-${dateTime.month}-${dateTime.day}";
