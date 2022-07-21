import 'package:cloud_firestore/cloud_firestore.dart';

class firebase_collections {
  static const String transactions = "transactions";
  static const String payment_requests = "payment_requests";
}

CollectionReference<Map<String, dynamic>> transactions_collection() =>
    FirebaseFirestore.instance.collection(firebase_collections.transactions);

CollectionReference<Map<String, dynamic>> payment_requests_collection() =>
    FirebaseFirestore.instance
        .collection(firebase_collections.payment_requests);
