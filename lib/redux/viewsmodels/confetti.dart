import 'package:equatable/equatable.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/home_page_actions.dart';
import 'package:redux/redux.dart';

class ConfettiViewModel extends Equatable {
  final bool playConfetti;

  ConfettiViewModel({
    required this.playConfetti,
  });

  static ConfettiViewModel fromStore(Store<AppState> store) {
    return ConfettiViewModel(
      playConfetti: store.state.homePageState.playConfetti,
    );
  }

  @override
  List<Object> get props => [playConfetti];
}
