import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

void main() => runApp(const Survey1Ques());

class Survey1Ques extends StatefulWidget {
  const Survey1Ques({Key? key}) : super(key: key);

  @override
  State<Survey1Ques> createState() => _Survey1QuesState();
}

class _Survey1QuesState extends State<Survey1Ques> {
  var currentStep = 1;
  var number = 1;
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Survey 1',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressBar(
                    maxSteps: 6,
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: currentStep,
                    progressColor: Colors.deepOrange,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                    semanticsLabel: "Label",
                    semanticsValue: "Value",
                    minHeight: 5,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Question $number",
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password doesn't follow keyboard pattern",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 180),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    color: const Color(0xFFE0E0E0),
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Radio(
                            onChanged: (e) => something(e as int),
                            activeColor: Colors.blue,
                            value: 1,
                            groupValue: groupValue,
                          ),
                        ),
                        const Text("Agree")
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    color: const Color(0xFFE0E0E0),
                    child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Radio(
                            onChanged: (e) => something(e as int),
                            activeColor: Colors.blue,
                            value: 2,
                            groupValue: groupValue,
                          ),
                        ),
                        const Text("Disagree")
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

  void something(int e) {
    setState(() {
      if (e == 1) {
        groupValue = 1;
      } else if (e == 2) {
        groupValue = 2;
      }
    });
  }
}
