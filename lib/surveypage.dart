import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/survey1.dart';
import 'login.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF1565C0),
            title: const Text('Surveys'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              )
            ]),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF1565C0)),
                accountName: Text('Beh He-Hong'),
                accountEmail: Text('hehongbeh@gmail.com'),
                currentAccountPicture: CircleAvatar(
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
                      builder: (context) => const HomePage(),
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
                      builder: (context) => const Survey(),
                    ),
                  );
                },
              ),
              createDrawerItem(
                icon: Icons.person,
                text: 'My Profile',
                onTap: () {},
              ),
              createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () {},
              ),
              createDrawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  Navigator.of(context).pop();
                  showAlertDialog(context);
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
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
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Survey1(),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
