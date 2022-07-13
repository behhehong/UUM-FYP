import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/data/data.dart';
import 'package:flutter_final_year_project/models/questionmodel.dart';
import 'package:flutter_final_year_project/models/results.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'package:flutter_final_year_project/survey1ques.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';

class ResultPage extends StatefulWidget {
  final User user;

  const ResultPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<QuestionModel> _questions = <QuestionModel>[];
  List<Results> resultList = <Results>[];
  int index = 0;

  @override
  void initState() {
    super.initState();
    _questions = getQuestion();
    _loadResult();
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
                        Text(
                            "Awareness score: ${resultList[index].survey_rating!}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 20),
                        Text(
                          "You score ${resultList[index].survey_score!} out of ${_questions.length * 5}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${resultList[index].question_correct!} Correct, ${resultList[index].question_incorrect!} Incorrect & ${resultList[index].question_notattempt!} Not Attempted out of ${_questions.length}",
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
                              color: Color.fromARGB(255, 21, 101, 192),
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
          content: Text(resultList[index].survey_desc!,
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

  void _loadResult() {
    http.post(
        Uri.parse(
            "https://hubbuddies.com/271513/cyberform/php/load_result.php"),
        body: {
          "email": widget.user.email,
        }).then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200 && data['status'] == 'success') {
        print("Success");
        var extractdata = data['data'];

        if (extractdata['results'] != null) {
          resultList = <Results>[];
          extractdata['results'].forEach((v) {
            resultList.add(Results.fromJson(v));
          });
        }
        print(resultList.length);

        setState(() {
          index = resultList.length - 1;
        });
      } else {
        print("Failed");
      }
    });
  }
}
