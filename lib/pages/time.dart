import 'package:flutter/material.dart';
import 'package:shopping_cart/containers/time_container.dart';
// import 'package:redux_thunk/redux_thunk.dart';
// import '../../redux/main.dart';
// import '../../redux/time/action.dart';
// import '../../redux/middleware.dart';

// import 'package:time_app/reducer.dart';

// import 'app_state.dart';
// import 'middleware.dart';
typedef FetchTime = void Function();

class TimePage extends StatefulWidget {
  // List<dynamic> locations = [];

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Redux demo"),
        ),
        body: TimeContainer());
  }
}
