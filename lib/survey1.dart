import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/survey1ques.dart';
import 'package:flutter_final_year_project/surveypage.dart';
import 'package:google_fonts/google_fonts.dart';

class Survey1 extends StatefulWidget {
  final User user;
  
  const Survey1({Key? key, required this.user}) : super(key: key);

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/plain.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome to Test Awareness 1",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1565C0),
                      )),
                ),
                const SizedBox(height: 15),
                const Text(
                  "This survey is based on a case study from Fahad Bin Sultan University, Saudi Arabia which is researched by Wejdan Aljohani and Nazar Elfadil.",
                  style:
                      TextStyle(color: Colors.black, fontSize: 15, height: 1.5, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 120),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Survey1Ques(user: widget.user)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF1565C0),
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Start the survey",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
