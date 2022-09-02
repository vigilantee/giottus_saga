import 'package:shopping_cart/actions/index.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/models/time.dart';

final timeReducer = combineReducers<Time>([
  TypedReducer<Time, FetchTime>(_fetchTimeReducer),
  TypedReducer<Time, FetchTimeSuccess>(_fetchTimeSuccessReducer),
  TypedReducer<Time, FetchTimeFailure>(_fetchTimeFailureReducer),
]);

Time _fetchTimeReducer(Time state, FetchTime action) {
  return state.copyWith(
    isFetching: true,
    isError: false,
  );
}

Time _fetchTimeSuccessReducer(Time state, FetchTimeSuccess action) {
  return state.copyWith(
    time: action.time.time ?? state.time,
    location: action.time.location ?? state.location,
    isFetching: false,
    isError: false,
  );
}

Time _fetchTimeFailureReducer(Time state, FetchTimeFailure action) {
  return state.copyWith(
    isFetching: false,
    isError: true,
  );
}
