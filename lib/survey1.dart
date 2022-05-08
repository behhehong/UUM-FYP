import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/survey1ques.dart';
import 'package:flutter_final_year_project/surveypage.dart';

class Survey1 extends StatefulWidget {
  const Survey1({Key? key}) : super(key: key);

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          title: const Text('Survey 1'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Survey(),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Welcome to Survey 1",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Survey1Ques()));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: const Text("Start", style: TextStyle(fontSize: 15))),
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFF1565C0))),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  defaultDialog(context);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: const Text("Description",
                        style: TextStyle(fontSize: 15))),
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xFF1565C0))),
          ]),
        ),
      ),
    );
  }
}

defaultDialog(BuildContext context) async {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Description"),
    content: const Text(
        "This survey is based on a case study from Fahad Bin Sultan University, Saudi Arabia"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
