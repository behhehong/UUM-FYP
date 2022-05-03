import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
            title: const Text('Cyberform')),
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
              _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.history_edu,
                text: 'Survey',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.person,
                text: 'My Profile',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }

  Widget _createDrawerItem({
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
}
