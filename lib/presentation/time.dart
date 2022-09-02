import 'package:flutter/material.dart';

class TimeControl extends StatelessWidget {
  TimeControl({
    required this.location,
    required this.time,
    required this.fetchTime,
  });

  final String location;
  final String time;
  final VoidCallback fetchTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'The time in $location is $time',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
              ),

              // fetch time button
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                            color: Colors.brown,
                          ),
                        )),
                    onPressed: fetchTime,
                    child: const Text(
                      "Click to fetch time",
                      style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    )),
              )
            ]));
  }
}
