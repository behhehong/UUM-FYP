import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/splashscreen.dart';
import 'package:flutter_final_year_project/login.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'package:flutter_final_year_project/surveypage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Final yp', 
      home: Survey1());
  }
}
