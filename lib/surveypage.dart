import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/data/data.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/models/questionmodel.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/profile.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'login.dart';

class Survey extends StatefulWidget {
  final User user;
  const Survey({Key? key, required this.user}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  List<QuestionModel> _questions = <QuestionModel>[];

  @override
  void initState() {
    super.initState();
    _questions = getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          title: const Text('Surveys'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF1565C0)),
                accountName: Text("${widget.user.last_name.toString()} "
                    " ${widget.user.first_name.toString()}"),
                accountEmail: Text(widget.user.email.toString()),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdna.artstation.com/p/assets/images/images/033/435/166/medium/rishav-gupta-naruto.jpg?1609603275'),
                ),
              ),
              createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(user: widget.user),
                    ),
                  );
                },
              ),
              createDrawerItem(
                icon: Icons.history_edu,
                text: 'Surveys',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              createDrawerItem(
                icon: Icons.person,
                text: 'My Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(user: widget.user),
                    ),
                  );
                },
              ),
              // createDrawerItem(
              //   icon: Icons.settings,
              //   text: 'Settings',
              //   onTap: () {},
              // ),
              createDrawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  Navigator.of(context).pop();
                  logOut(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                InkWell(
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            3.0,
                            3.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Survey 1",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${_questions.length} Questions | ${_questions.length * 5} Marks",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 15)),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Survey1(user: widget.user)));
                            },
                            icon:
                                const Icon(Icons.keyboard_arrow_right_outlined),
                            iconSize: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  splashColor: Colors.white,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Survey1(user: widget.user),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
