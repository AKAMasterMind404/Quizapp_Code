import 'package:flutter/material.dart';

Column ButtonFormat(String text, Color color, IconData icon,
    {Color iconcolor}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(2, 2),
                color: Colors.grey[350])
          ],
          color: color,
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: () => null,
        ),
//        radius: 25,
      ),
      SizedBox(
        height: 10,
      ),
      Text(text)
    ],
  );
}

Row secondPageResults(
    {int num,
    Color color,
    String subtitle,
    String prefix = '',
    String suffix = ''}) {
  String ans = num < 10 ? '0' + num.toString() : num.toString();

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "• ",
        style:
            TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.bold),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          prefix + ans + suffix,
          style: TextStyle(
              fontSize: 20, color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black),
        )
      ])
    ],
  );
}

Container floatingContainer(
    {String question,
    int question_Number,
    int total_questions,
    int correct,
    int wrong}) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: getRow(correct, total_questions, Colors.green),
            ), // RIGHT ANSWERS
            Row(
              children: [
                getRow(wrong, total_questions, Colors.red)[1],
                getRow(wrong, total_questions, Colors.red)[0]
              ],
            ), // WRONG ANSWERS
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              "$question_Number",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              " / $total_questions",
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
            "$question",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    ),
    padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 0),
    margin: EdgeInsets.only(left: 30, right: 30, top: 130, bottom: 350),
    // IMPORTANT TOP
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(offset: Offset(4, 4), blurRadius: 6, color: Colors.grey[400])
    ], borderRadius: BorderRadius.circular(12), color: Colors.white),
  );
}

List<Widget> getRow(
  int number,
  int maxQuestions,
  Color color,
) {
  String num = number < 10 ? '0' + number.toString() : number.toString();

  return [
    Text(
      "  $num  ",
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    ),
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 10,
      ),
      padding: EdgeInsets.only(
        left: (number / maxQuestions)*90,
      ),
    ),
  ];
}

Widget horizontal_Button({Map question, int index, int whatToShow}) {
  String option = question["o"][index];

  Map borderColor = {0: Colors.grey[200], 1: Colors.purple, 2: Colors.red};
  Map tick = {0: Icons.circle, 1: Icons.check, 2: Icons.close};

  return Container(
    margin: EdgeInsets.fromLTRB(50, 5, 50, 5),
    // HORIZONTAL LENGTH OF EACH OPTION
    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 2, color: borderColor[whatToShow]),
      boxShadow: [
        BoxShadow(
            color: Colors.grey[200],
            offset: Offset(3, 3),
            spreadRadius: 5,
            blurRadius: 5),
      ],
    ),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$option",
          style: TextStyle(fontWeight: FontWeight.bold, height: 2),
        ),
        CircleAvatar(
          backgroundColor: borderColor[whatToShow],
          minRadius: 2,
          child: Icon(
            tick[whatToShow],
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
