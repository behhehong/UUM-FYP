import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/changePass.dart';
import 'package:flutter_final_year_project/login.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/profile.dart';
import 'package:flutter_final_year_project/report.dart';
import 'package:flutter_final_year_project/surveypage.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          title: const Text('Home Page'),
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
              createDrawerItem(
                icon: Icons.lock,
                text: 'Change Password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePass(user: widget.user),
                    ),
                  );
                },
              ),
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
                SizedBox(
                  child: Center(
                    child: Image.asset('assets/images/banner.png',
                        height: 100, width: 500, fit: BoxFit.fitWidth),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Surveys",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "These are surveys regarding cybersecurity awareness",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1565C0),
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text("Survey 1",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        splashColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Survey(user: widget.user),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[700],
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Survey(user: widget.user)));
                    },
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About us",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The main objective of our app is to determine the level of cybersecurity awareness of users through surveys from different research. This can help increase their awareness towards online cyberattacks to prevent heavy loss such as loss of personal data, bank information leaked and more.",
                    style: TextStyle(fontSize: 15, color: Colors.black87),
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

logOut(BuildContext context) async {
  // set up the buttons
  Widget continueButton = TextButton(
    child: const Text("Confirm"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    },
  );

  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Logout"),
    content: const Text("Are you sure you want to logout?"),
    actions: [
      continueButton,
      cancelButton,
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

Widget createDrawerItem({
  required IconData icon,
  required String text,
  required GestureTapCallback onTap,
}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
