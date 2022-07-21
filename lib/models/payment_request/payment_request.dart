import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/items/item.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

@immutable
@freezed
class PaymentRequest with _$PaymentRequest {
  @JsonSerializable()
  factory PaymentRequest({
    // @JsonKey(name: 'SendFromAddress') required String sendFromAddress,
    // @JsonKey(name: 'SendToAddress') required String sendToAddress,
    @JsonKey(name: 'PaymentId') required String paymentId,
    @JsonKey(name: 'Amount') required num amount,
    @JsonKey(name: 'Items') required List<Item> items,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';

// class ProfileDao extends ChangeNotifier {
//   final collection = FirebaseFirestore.instance.collection('users');

//   Future<QuerySnapshot> getProfile(String uid) async {
//     var profile = await collection.where('uid', isEqualTo: uid).get();
//     return profile;
//   }
// }