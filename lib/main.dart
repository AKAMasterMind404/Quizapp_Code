import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshipquizapp/bluePrints.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internshipquizapp/finalPage.dart';
import 'package:internshipquizapp/trial.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => builder(),
      'page1': (context) => builder(),
      'page2': (context) => lastPage(),
    },
  ));
}

FutureBuilder builder() {
  return FutureBuilder(
    // Initialize FlutterFire
    future: Firebase.initializeApp(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return trial();
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return app();
      }
      return trial();
    },
  );
}

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  Map q1 = {};
  Map q2 = {};
  Map q3 = {};
  Map q4 = {};
  Map q5 = {};

  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void setData() async {
    await dataGetter();
  }

  @override
  void initState() {
    _startTimer();
    initializeFlutterFire();
    setData();
    super.initState();
  }

  /////////////////////////
  Future dataGetter() async {
    try {
      await FirebaseFirestore.instance
          .collection('Questions')
          .doc('set2')
          .get()
          .then((val) {
        setState(() {
          q1 = val.data()['q1'];
          q2 = val.data()['q2'];
          q3 = val.data()['q3'];
          q4 = val.data()['q4'];
          q5 = val.data()['q5'];
        });
      });
    } catch (exception) {}
  }

  /////////////////////////
  void _startTimer() {
    t = 30;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (t > 0) {
          t--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  int maxtime = 30;
  int t = 30;
  Timer _timer;

  Color plainWhite = Colors.white;
  bool attempted = false;
  int i0 = 0, i1 = 0, i2 = 0, i3 = 0;

  String bg1 = 'lib/Assets/purpleSpirals1.png';
  String bg2 = 'lib/Assets/purpleSpirals2.jpg';
  String bg3 = 'lib/Assets/purpleSpirals3.jpg';
  String bg4 = 'lib/Assets/purpleSpirals4.jpg';
  String bg5 = 'lib/Assets/purpleSpirals5.jpg';
  String bg6 = 'lib/Assets/purpleSpirals6.jpg';

  @override
  Widget build(BuildContext context) {
    Map currentQuestion = q4;
    void changeState(int right) {
      switch (right) {
        case 0:
          i0 = 1;
          break;
        case 1:
          i1 = 1;
          break;
        case 2:
          i2 = 1;
          break;
        case 3:
          i3 = 1;
          break;
      }
    }

    // Show a loader until FlutterFire is initialized
    if (_error || !_initialized || currentQuestion == {}) {
      return Container(
        child: trial(),
      );
    }

    try {
      return SafeArea(
          child: Scaffold(
              body: Container(
        child: Stack(children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(bg6)),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18))),
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 140, bottom: 40),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  i0 = currentQuestion['rightOption'] == 0
                                      ? 1
                                      : 2;
                                  changeState(currentQuestion['rightOption']);
                                });
                              },
                              child: horizontal_Button(
                                  question: currentQuestion,
                                  index: 0,
                                  whatToShow: i0)),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  i1 = currentQuestion['rightOption'] == 1
                                      ? 1
                                      : 2;
                                  changeState(currentQuestion['rightOption']);
                                });
                              },
                              child: horizontal_Button(
                                  question: currentQuestion,
                                  index: 1,
                                  whatToShow: i1)),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  i2 = currentQuestion['rightOption'] == 2
                                      ? 1
                                      : 2;
                                  changeState(currentQuestion['rightOption']);
                                });
                              },
                              child: horizontal_Button(
                                  question: currentQuestion,
                                  index: 2,
                                  whatToShow: i2)),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  i3 = currentQuestion['rightOption'] == 3
                                      ? 1
                                      : 2;
                                  changeState(currentQuestion['rightOption']);
                                });
                              },
                              child: horizontal_Button(
                                  question: currentQuestion,
                                  index: 3,
                                  whatToShow: i3)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(    // ICON BUTTON TOP
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'page2');
//                    print("Hello, World!");
                  }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
//                    print("Hello, World!");
                  }),
            ],
          ),

          // FLOATING WIDGET
          //

          Stack(
            children: [
              floatingContainer(
                  question: currentQuestion['q'],
                  question_Number: 17,
                  total_questions: 20,
                  correct: 5,
                  wrong: 12),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 400),
                // IMPORTANT TOP
                alignment: Alignment.center,
                child: CircleAvatar(
                  child: Text(
                    "$t",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 400),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.purple),
                        strokeWidth: 5,
                        value: (t / maxtime),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      )));
    } catch (exception) {
      return trial();
    }
  }
}
