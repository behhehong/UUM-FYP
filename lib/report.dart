import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/profile.dart';
import 'package:flutter_final_year_project/surveypage.dart';

class Report extends StatefulWidget {
  int score = 0, totalQuestion = 0;

  final User user;
  Report({Key? key, required this.user}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String greeting = "";
  int result = 0;

  @override
  void initState() {
    super.initState();

    var percentage = (widget.score / (widget.totalQuestion * 20)) * 100;
    if (percentage >= 76) {
      greeting = "HIGH";
      result = 4;
    } else if (percentage >= 51 && percentage < 76) {
      greeting = "AVERAGE";
      result = 3;
    } else if (percentage >= 25 && percentage < 51) {
      greeting = "BELOW AVERAGE";
      result = 2;
    } else if (percentage < 25) {
      greeting = "LOW";
      result = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1565C0),
            title: const Text('Report'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(user: widget.user),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
              )
            ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Survey(
                          user: widget.user,
                        ),
                      ),
                    );
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
                createDrawerItem(
                  icon: Icons.assignment,
                  text: 'Report',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Report(
                          user: widget.user,
                        ),
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
            child: Center(
              child: Container(
                child: Text('Hello World'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
