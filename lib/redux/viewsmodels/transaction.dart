import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/transactions/transaction.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';

class TransactionListViewModel extends Equatable {
  final String walletAddress;
  final List<PaymentTransaction> transactions;
  final Function() refreshFeed;

  TransactionListViewModel({
    required this.walletAddress,
    required this.transactions,
    required this.refreshFeed,
  });

  static TransactionListViewModel fromStore(Store<AppState> store) {
    final List<PaymentTransaction> transactions = List<PaymentTransaction>.from(
            store.state.cashWalletState.transactions.values)
        .map((PaymentTransaction transaction) => transaction.copyWith(
            imageUrl: transaction.imageUrl ??
                store.state.cashWalletState
                    .communities[transaction.communityAddress]?.businesses
                    ?.where(
                      (element) => element.id == transaction.companyId,
                    )
                    .firstOrNull
                    ?.metadata
                    .image ??
                ''))
        .toList()
      ..sort();

    return TransactionListViewModel(
      walletAddress: store.state.userState.walletAddress,
      transactions: List<PaymentTransaction>.from(transactions.reversed),
      refreshFeed: () {
        store.dispatch(refresh());
      },
    );
  }

  @override
  List<Object> get props => [
        walletAddress,
        transactions,
      ];
}
