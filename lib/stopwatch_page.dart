import 'dart:async';

import 'package:clock_app/theme_data.dart';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;  //Increment second by 1
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: CustomColors.menuBackgroundColor,
          body: Center(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                    child: Text(
                      "Stopwatch",
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LabelText(
                          label: 'HRS',
                          value: hours.toString().padLeft(0, '0')),
                      LabelText(
                          label: 'MIN',
                          value: minutes.toString().padLeft(0, '0')),
                      LabelText(
                          label: 'SEC',
                          value: seconds.toString().padLeft(0, '0')),
                    ],
                  ),
                  SizedBox(height: 60),
                  Container(
                    width: 150,
                    height: 47,
                    margin: EdgeInsets.only(top: 30),
                    child: RaisedButton(
                      color: Colors.pink[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(isActive ? 'STOP' : 'START'),
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 150,
                    height: 47,
                    margin: EdgeInsets.only(top: 30),
                    child: RaisedButton(
                      color: Colors.pink[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          secondsPassed = 0;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
