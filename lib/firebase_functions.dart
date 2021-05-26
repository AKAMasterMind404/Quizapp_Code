import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internshipquizapp/trial.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

dataGetter() async {
  List<Map> questionApi = [];
  try {
    await FirebaseFirestore.instance.collection('Questions').doc('set2').get().then((val) {
      questionApi.add(val.data()['q1']);
      questionApi.add(val.data()['q2']);
      questionApi.add(val.data()['q3']);
      questionApi.add(val.data()['q4']);
      questionApi.add(val.data()['q5']);
    });
  } catch (exception) {}
  print(questionApi[0]);
  return questionApi;
}