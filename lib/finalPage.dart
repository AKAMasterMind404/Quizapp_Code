import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internshipquizapp/bluePrints.dart';

class lastPage extends StatefulWidget {
  @override
  _lastPageState createState() => _lastPageState();
}

class _lastPageState extends State<lastPage> {
  List purpleSet = [128, 0, 128];

  @override
//  Color white = Color(Colors.white);
  Widget build(BuildContext context) {
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
                        fit: BoxFit.fill,
                        image: AssetImage("lib/Assets/purpleSpirals6.jpg")),
//                    color: Colors.purpleAccent,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18))),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  // BACKGROUND COLOR BOTTOM QUADRANT
                  padding: const EdgeInsets.only(left:30,right:30),
                  child: Container(
                      margin: EdgeInsets.only(
                          top: 100, bottom: 30, left: 20, right: 20),
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // COLUMN 1
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonFormat(
                                  "Play Again", Colors.blueGrey, Icons.replay,
                                  iconcolor: Colors.white),
                              ButtonFormat("Generate PDF",
                                  Colors.lightBlueAccent, Icons.picture_as_pdf),
                            ],
                          ),
                          Column(
                            // COLUMN 2
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonFormat("Review Answers", Colors.amber,
                                  Icons.remove_red_eye,
                                  iconcolor: Colors.white),
                              ButtonFormat(
                                  "Home", Colors.pink, Icons.home_outlined,
                                  iconcolor: Colors.white),
                            ],
                          ),
                          Column(
                            // COLUMN 3
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonFormat(
                                  "Share Score", Colors.deepPurple, Icons.share,
                                  iconcolor: Colors.white),
                              ButtonFormat("Leaderboard", Colors.grey,
                                  Icons.star_border_purple500_outlined,
                                  iconcolor: Colors.white)
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        // AIR WALA WIDGET
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
//                  print("Hello, World!");
                }),
          ],
        ),

        // FLOATING CONTAINER
        Container(
            margin: EdgeInsets.only(top: 270, left: 20, right: 20, bottom: 250),
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], offset: Offset(4, 4), blurRadius: 4)
            ], borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        secondPageResults(
                            num: 100,
                            suffix: "%",
                            subtitle: "Completion",
                            color: Colors.purple),
                        secondPageResults(
                            num: 13, subtitle: "Correct", color: Colors.green),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        secondPageResults(
                          num: 20,
                          subtitle: "Total Questions",
                          color: Colors.purple,
                        ),
                        secondPageResults(
                            num: 7, subtitle: "Wrong", color: Colors.red),
                      ])
                ])),


        // SCORE CONTAINER
        Container(
          child: Container(
            margin: EdgeInsets.only(right:100,left:100,top:25,bottom: 425),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),

              color: Color.fromRGBO(255,255,255,0.3),
            ),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.only(right:135,left:135,top:60,bottom: 460),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: Color.fromRGBO(255,255,255,0.3), // SECOND INNER
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(),
          margin: EdgeInsets.only(right:145,left:145,top:70,bottom: 470),
//        margin: EdgeInsets.only(right:100,left:100,top:50,bottom: 400),

          child: Column(// INNER MOST
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Score", style: TextStyle(fontSize:15,color: Colors.purple)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "150",
                  style: TextStyle(fontSize:35,fontWeight:FontWeight.bold,color: Colors.purple),
                ),
                Text(
                  "pt",
                  style: TextStyle(fontSize:15,color: Colors.purple),
                )
              ]),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(400),

            color: Colors.white,
          ),
//        radius: 25,
        ),
      ]),
    )));
  }
}