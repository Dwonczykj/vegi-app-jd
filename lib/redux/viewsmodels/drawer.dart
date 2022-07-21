// import 'package:equatable/equatable.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/models/plugins/plugins.dart';
// import 'package:redux/redux.dart';
// import 'package:vegan_liverpool/models/community/community.dart';
// import 'package:vegan_liverpool/redux/actions/user_actions.dart';
// import 'package:vegan_liverpool/utils/addresses.dart' as util;

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

import '../../models/app_state.dart';

class DrawerViewModel extends Equatable {
  final Function() logout;
  final Function() firstName;
  final String pplBalance;
  final String gbpxBalance;
  final String avatarUrl;
  final bool isAdmin;

  DrawerViewModel(
      {required this.firstName,
      required this.logout,
      required this.pplBalance,
      required this.gbpxBalance,
      required this.avatarUrl,
      this.isAdmin = false});

  static DrawerViewModel fromStore(Store<AppState> store) {
    CashWalletState cashWalletState = store.state.cashWalletState;

    bool isAdmin = store.state.userState.adminSettings != null;

    return DrawerViewModel(
        logout: () {
          store.dispatch(logoutCall());
        },
        avatarUrl: store.state.userState.avatarUrl,
        firstName: () {
          String fullName = store.state.userState.displayName;
          return fullName.split(' ')[0];
        },
        pplBalance: cashWalletState.tokens[PeeplToken.address]!.getBalance(),
        gbpxBalance: cashWalletState.tokens[GBPxToken.address]!.getBalance(),
        isAdmin: isAdmin);
  }

  @override
  List get props => [
        avatarUrl,
        pplBalance,
        gbpxBalance,
      ];
}
