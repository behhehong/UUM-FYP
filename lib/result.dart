import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'package:flutter_final_year_project/survey1ques.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'homepage.dart';

class Result extends StatefulWidget {
  int score = 0,
      totalQuestion = 0,
      correct = 0,
      incorrect = 0,
      notAttempted = 0;
  final User user;

  Result(
      {Key? key,
      required this.user,
      required this.score,
      required this.totalQuestion,
      required this.correct,
      required this.incorrect,
      required this.notAttempted})
      : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";
  String comment = "";

  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestion * 5)) * 100;
    if (percentage >= 76) {
      greeting = "HIGH";
      comment =
          "You are aware of security threats and how to mitigate them. You have the knowledge of security standards and policies and also apply them.";
    } else if (percentage >= 51 && percentage < 76) {
      greeting = "AVERAGE";
      comment =
          "You are aware of security threats, have the knowledge of security policies and standards but do not apply them.";
    } else if (percentage >= 25 && percentage < 51) {
      greeting = "BELOW AVERAGE";
      comment =
          "You are aware of security threats but have no knowledge of security standards and policies and also do not take any measures against them or take part in activities that put you at risk.";
    } else if (percentage < 25) {
      greeting = "LOW";
      comment =
          "You are not aware of security threats and policies and can easily be exploited by the activities you took part in.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/colorful.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 130),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Description',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    onTap: () {
                      _showDialog(context);
                    }),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            FontAwesomeIcons.check,
                            size: 50,
                            color: Color(0xFF1565C0),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text("Awareness score: $greeting",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Text(
                          "You score ${widget.score} out of ${widget.totalQuestion * 5}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${widget.correct} Correct, ${widget.incorrect} Incorrect & ${widget.notAttempted} Not Attempted out of ${widget.totalQuestion}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Survey1(user: widget.user)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 45),
                            child: const Text(
                              "Replay Quiz Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xFF1565C0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(user: widget.user)));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 30),
                            child: const Text("Go to Home",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF1565C0))),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                  color: const Color(0xFF1565C0), width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Comments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          content: Text(comment,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF1565C0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
