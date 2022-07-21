import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/community/community.dart';
import 'package:vegan_liverpool/models/plugins/plugins.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';

class TransactionTileViewModel extends Equatable {
  final List<Community> communities;
  final Function(Token token) fetchTokenAction;
  final Function(Token token) fetchTokenPrice;
  final Plugins plugins;
  // final Function getSwapListBalances;

  TransactionTileViewModel({
    required this.communities,
    required this.plugins,
    required this.fetchTokenAction,
    required this.fetchTokenPrice,
  });

  static TransactionTileViewModel fromStore(Store<AppState> store) {
    String communityAddress = store.state.cashWalletState.communityAddress;
    Community? community =
        store.state.cashWalletState.communities[communityAddress];
    return TransactionTileViewModel(
      plugins: community?.plugins ?? Plugins(),

      communities: store.state.cashWalletState.communities.values.toList(),
      fetchTokenAction: (Token token) {
        store.dispatch(getTokenWalletActionsCall(token));
      },
      fetchTokenPrice: (Token token) {
        store.dispatch(getTokenPriceCall(token));
      },
      // getTransactionsList: () {
      //   store.dispatch(fetchSwapBalances());
      // },
    );
  }

  @override
  List<Object> get props => [
        communities,
        // tokensImages,
        plugins,
      ];
}
