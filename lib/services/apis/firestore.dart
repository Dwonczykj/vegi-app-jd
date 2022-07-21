import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vegan_liverpool/constants/firestore_handles.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payment_request/payment_request.dart';
import 'package:vegan_liverpool/models/transactions/transaction.dart';

Stream<PaymentRequest> getUserPaymentRequest(String paymentId) {
  return payment_requests_collection()
      .doc(paymentId)
      .snapshots() // 5
      .mapNotNull((DocumentSnapshot doc) =>
          PaymentRequest.fromJson(doc.data() as Map<String, dynamic>)); // 6
} //! This does not need to be used in an epic as a payment request doesnt change, it is not a stream that updates. It is one immutable object.
// Transactions dont change? Or can they be updated ?
// Items do change, but arent fetched for store so dont need to be in sync? Unless an item is updated?

Stream<Iterable<PaymentTransaction>> getUserTransactions(
    EpicStore<AppState> store) {
  final String walletAddress = store.state.userState.walletAddress;
  return transactions_collection()
      .where('SenderAddress', isEqualTo: walletAddress)
      .snapshots() // 5
      .mapNotNull((QuerySnapshot querySnapshot) => querySnapshot.docs
          .map<PaymentTransaction>((doc) =>
              PaymentTransaction.fromJson(doc.data() as Map<String, dynamic>)));
}
