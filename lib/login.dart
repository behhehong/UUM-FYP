// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/signup.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Please sign in to continue"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                        color: Colors.white,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        color: Colors.white,
                        child: TextField(obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(
                                Icons.security_outlined,
                                color: Colors.black,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: MaterialButton(
                            elevation: 10,
                            color: Colors.amberAccent,
                            onPressed: () {_userLogin();},
                            child: Text("Sign In"),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _forgetpassdialog;
                      },
                      child: Text("Forget Password?")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("No account yet? Sign up now!"),
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

  void _forgetpassdialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Dialog Title'),
              content: Text('This is my content'),
            ));
  }

  void _userLogin() {
      String _email = emailController.text.toString();
      String _password = passwordController.text.toString();

      http.post(
        Uri.parse(
            "https://hubbuddies.com/271513/cyberform/php/loginuser.php"),
        body: {"email": _email, "password": _password}).then((response) {
      print(response.body);
      if (response.body == "Failed") {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Login failed. Please try again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        return;
      } else {
        print("Success");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        // List userdata = response.body.split("#");
        // User user = new User(
        //   first_name: userdata[1],
        //   last_name: userdata[2],
        //   email: userdata[3],
        //   date_register: userdata[4],
        //   c_qty: userdata[5],
        // );

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (content) => BottomBar( //Go home
        //               user: user,
        //             )));
      }
    });
  }
}
