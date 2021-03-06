import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/models/questionmodel.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/result.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:http/http.dart' as http;

import 'data/data.dart';

class Survey1Ques extends StatefulWidget {
  final User user;

  const Survey1Ques({Key? key, required this.user}) : super(key: key);

  @override
  State<Survey1Ques> createState() => _Survey1QuesState();
}

class _Survey1QuesState extends State<Survey1Ques> {
  List<QuestionModel> _questions = <QuestionModel>[];
  var number = 1;
  int groupValue = 0;
  int index = 0;
  int correct = 0,
      incorrect = 0,
      notAttempted = 0,
      points = 0,
      right = 0,
      wrong = 0,
      missed = 0;
  var buttonText = "Next";
  String rating = "";
  String comment = "";

  @override
  void initState() {
    super.initState();
    _questions = getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'SURVEY 1',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            flexibleSpace: const Image(
              image: AssetImage('assets/images/plain.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/plain.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressBar(
                        maxSteps: _questions.length,
                        progressType: LinearProgressBar.progressTypeLinear,
                        currentStep: index + 1,
                        progressColor: const Color(0xFF1565C0),
                        backgroundColor: Colors.grey,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                        semanticsLabel: "Label",
                        semanticsValue: "Value",
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Question ${index + 1}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _questions[index].getQuestion(),
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 180),
                    newMethod(1, "Agree"),
                    const SizedBox(height: 8),
                    newMethod(2, "Disagree"),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            height: 56,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index == 0) {
                        } else if (right == 1) {
                          setState(() {
                            correct--;
                            index--;
                            groupValue = 0;
                            right = 0;
                            wrong = 0;
                            missed = 0;
                            buttonText = "Next";
                          });
                        } else if (wrong == 1) {
                          setState(() {
                            incorrect--;
                            index--;
                            groupValue = 0;
                            right = 0;
                            wrong = 0;
                            missed = 0;
                            buttonText = "Next";
                          });
                        } else {
                          setState(() {
                            notAttempted--;
                            index--;
                            groupValue = 0;
                            right = 0;
                            wrong = 0;
                            missed = 0;
                            buttonText = "Next";
                          });
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Text("Prev",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (index < _questions.length - 1) {
                        if (_questions[index].getAnswer() == "Agree" &&
                            groupValue == 1) {
                          setState(() {
                            points += 5;
                            correct++;
                            index++;
                            groupValue = 0;
                            right = 1;
                            wrong = 0;
                            missed = 0;
                          });
                        } else if (_questions[index].getAnswer() ==
                                "Disagree" &&
                            groupValue == 2) {
                          setState(() {
                            points += 5;
                            correct++;
                            index++;
                            groupValue = 0;
                            right = 1;
                            wrong = 0;
                            missed = 0;
                          });
                        } else if (groupValue == 0) {
                          setState(() {
                            notAttempted++;
                            index++;
                            groupValue = 0;
                            right = 0;
                            wrong = 0;
                            missed = 1;
                          });
                        } else {
                          setState(() {
                            incorrect++;
                            index++;
                            groupValue = 0;
                            right = 0;
                            wrong = 1;
                            missed = 0;
                          });
                        }
                      } else {
                        if (_questions[index].getAnswer() == "Agree" &&
                            groupValue == 1) {
                          setState(() {
                            points += 5;
                            correct++;
                            right = 1;
                            wrong = 0;
                            missed = 0;
                            passedtoResult(context);
                          });
                        } else if (_questions[index].getAnswer() ==
                                "Disagree" &&
                            groupValue == 2) {
                          setState(() {
                            points += 5;
                            correct++;
                            right = 1;
                            wrong = 0;
                            missed = 0;
                            passedtoResult(context);
                          });
                        } else if (groupValue == 0) {
                          setState(() {
                            notAttempted++;
                            right = 0;
                            wrong = 0;
                            missed = 1;
                            passedtoResult(context);
                          });
                        } else {
                          setState(() {
                            incorrect++;
                            right = 0;
                            wrong = 1;
                            missed = 0;
                            passedtoResult(context);
                          });
                        }
                      }
                      if (index == _questions.length - 1) {
                        setState(() {
                          buttonText = "Submit";
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: const Color(0xFF1565C0),
                      child: Text(buttonText,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
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

  ClipRRect newMethod(int values, String text) {
    Color containerColor = const Color(0xFFE0E0E0);
    Color textColor = Colors.black;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: InkWell(
        child: Container(
          color: containerColor,
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.white,
                ),
                child: Radio(
                  onChanged: (e) => something(e as int),
                  activeColor: Colors.deepOrange,
                  value: values,
                  groupValue: groupValue,
                ),
              ),
              Text(text, style: TextStyle(color: textColor, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }

  void something(int e) {
    setState(() {
      if (e == 1) {
        groupValue = 1;
      } else if (e == 2) {
        groupValue = 2;
      }
    });
  }

  passedtoResult(BuildContext context) {
    var percentage = (points / (_questions.length * 5)) * 100;
    if (percentage >= 76) {
      rating = "HIGH";
      comment =
          "You are aware of security threats and how to mitigate them. You have the knowledge of security standards and policies and also apply them.";
    } else if (percentage >= 51 && percentage < 76) {
      rating = "AVERAGE";
      comment =
          "You are aware of security threats, have the knowledge of security policies and standards but do not apply them.";
    } else if (percentage >= 25 && percentage < 51) {
      rating = "BELOW AVERAGE";
      comment =
          "You are aware of security threats but have no knowledge of security standards and policies and also do not take any measures against them or take part in activities that put you at risk.";
    } else if (percentage < 25) {
      rating = "LOW";
      comment =
          "You are not aware of security threats and policies and can easily be exploited by the activities you took part in.";
    }
    // set up the buttons
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        _insertResult();
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        setState(() {
          if (index == 0) {
          } else if (right == 1) {
            setState(() {
              correct--;
              groupValue = 0;
              right = 0;
              wrong = 0;
              missed = 0;
            });
          } else if (wrong == 1) {
            setState(() {
              incorrect--;
              groupValue = 0;
              right = 0;
              wrong = 0;
              missed = 0;
            });
          } else {
            setState(() {
              notAttempted--;
              groupValue = 0;
              right = 0;
              wrong = 0;
              missed = 0;
            });
          }
        });
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text("Do you wish to submit?"),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _insertResult() {
    http.post(
        Uri.parse(
            "https://hubbuddies.com/271513/cyberform/php/insert_result.php"),
        body: {
          "userid": widget.user.user_Id,
          "email": widget.user.email.toString(),
          "correct": correct.toString(),
          "incorrect": incorrect.toString(),
          "notattempt": notAttempted.toString(),
          "score": points.toString(),
          "rating": rating,
          "comment": comment,
        }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    ).then((response) {
      var jsondata = jsonDecode(response.body);

      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        print("Success");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              user: widget.user,
            ),
          ),
        );
      } else {
        print("Failed");
      }
    });
  }
}
