// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/signup.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                  child: Center(
                    child: Image.asset('assets/images/logo.png', height:250, width: 200, fit: BoxFit.fitHeight),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Please sign in to continue"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                        color: Colors.white,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              icon: const Icon(
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
                          decoration: const InputDecoration(
                              labelText: "Password",
                              icon: const Icon(
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
                            child: const Text("Sign In"),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _forgetpassdialog;
                      },
                      child: const Text("Forget Password?")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: const Text("No account yet? Sign up now!"),
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
        builder: (_) => const AlertDialog(
              title: const Text('Dialog Title'),
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
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
