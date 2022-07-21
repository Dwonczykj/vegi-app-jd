import 'dart:async';

import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/services/apis/firestore.dart';

//TODO: Add UpdateItemEpic, AddItemEpic
final allEpics = combineEpics<AppState>([paymentRequestEpic, transactionEpic]);

Stream<dynamic> paymentRequestEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .whereType<RequestPaymentRequestDataEventsAction>()
      .flatMap((requestAction) {
    return getUserPaymentRequest(requestAction.paymentId)
        .map(
            (paymentRequest) => PaymentRequestOnDataEventAction(paymentRequest))
        .takeUntil(actions
            .where((action) => action is CancelPaymentRequestDataEventsAction));
  });
}

Stream<dynamic> transactionEpic(
    Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .whereType<RequestTransactionDataEventsAction>()
      .flatMap((requestAction) {
    return getUserTransactions(store)
        .map((transactions) => TransactionOnDataEventAction(transactions))
        .takeUntil(actions
            .where((action) => action is CancelTransactionDataEventsAction));
  });
}
