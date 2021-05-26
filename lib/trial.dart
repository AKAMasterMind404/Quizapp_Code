import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class trial extends StatefulWidget {
  @override
  _trialState createState() => _trialState();
}

class _trialState extends State<trial> {
  String bg6 = 'lib/Assets/purpleSpirals6.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "Loading...",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        SpinKitWave(
//          controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
          duration: Duration(seconds: 30),
          color: Colors.black,
          size: 50.0,
        ),
      ],
    )));
  }
}
