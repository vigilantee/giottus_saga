import 'package:shopping_cart/actions/index.dart';
import 'package:shopping_cart/models/appState.dart';
import 'package:shopping_cart/presentation/time.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TimeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return TimeControl(
          location: vm.location,
          time: vm.time,
          fetchTime: vm.fetchTime,
        );
      },
    );
  }
}

class _ViewModel {
  final String location;
  final String time;
  final VoidCallback fetchTime;

  _ViewModel({
    required this.location,
    required this.time,
    required this.fetchTime,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      location: store.state.time.location,
      time: store.state.time.time,
      fetchTime: () => store.dispatch(FetchTime()),
    );
  }
}
