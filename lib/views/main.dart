import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/views/homepage.dart';
import 'package:flutter_final_year_project/views/splashscreen.dart';
import 'package:flutter_final_year_project/views/login.dart';
import 'package:flutter_final_year_project/views/survey1.dart';
import 'package:flutter_final_year_project/views/survey1ques.dart';
import 'package:flutter_final_year_project/views/surveypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Final yp', 
      home: Survey1Ques());
  }
}
