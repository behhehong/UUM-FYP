import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_final_year_project/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 20.0, color: Colors.black),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('App Name'),
                    WavyAnimatedText('Getting inside...'),
                  ],
                  isRepeatingAnimation: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
