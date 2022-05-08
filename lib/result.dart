import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'package:flutter_final_year_project/survey1ques.dart';

import 'homepage.dart';

void main() => runApp(Result(
      correct: 0,
      incorrect: 0,
      notAttempted: 0,
      score: 0,
      totalQuestion: 0,
    ));

class Result extends StatefulWidget {
  int score = 0,
      totalQuestion = 0,
      correct = 0,
      incorrect = 0,
      notAttempted = 0;
  Result(
      {Key? key,
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

  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestion * 20)) * 100;
    if (percentage >= 90) {
      greeting = "Outstanding";
    } else if (percentage > 80 && percentage < 90) {
      greeting = "Good Work";
    } else if (percentage > 70 && percentage < 80) {
      greeting = "Good Effort";
    } else if (percentage < 70) {
      greeting = "Needs Improvement";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(greeting,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                Text(
                    "You score ${widget.score} out of ${widget.totalQuestion * 20}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 15),
                Text(
                    "${widget.correct} Correct, ${widget.incorrect} Incorrect & ${widget.notAttempted} Not Attempted out of ${widget.totalQuestion}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Survey1()));
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
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: const Text("Go to Home",
                        style: TextStyle(fontSize: 15, color: Colors.blue)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.blue, width: 2),
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
}
