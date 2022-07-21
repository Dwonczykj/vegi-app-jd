import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/admin/admin_settings.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class AdminViewModel extends Equatable {
  final bool isAdmin;
  final AdminSettings? adminSettings;
  final Function() setAppTestMerchantMode;
  final Function() setAppConsumerMode;

  AdminViewModel({
    required this.isAdmin,
    required this.adminSettings,
    required this.setAppTestMerchantMode,
    required this.setAppConsumerMode,
  });

  static AdminViewModel fromStore(Store<AppState> store) {
    return AdminViewModel(
      isAdmin: store.state.userState.adminSettings != null,
      adminSettings: store.state.userState.adminSettings,
      setAppTestMerchantMode: () {
        store.dispatch(setTestMerchantMode());
      },
      setAppConsumerMode: () {
        store.dispatch(setConsumerMode());
      },
    );
  }

  @override
  List<Object> get props => adminSettings != null
      ? [
          isAdmin,
          adminSettings!,
        ]
      : [
          isAdmin,
        ];
}
