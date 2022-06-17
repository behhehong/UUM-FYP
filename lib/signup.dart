import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/login.dart';
import 'package:flutter_final_year_project/models/policy_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                        child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: firstNameController,
                      decoration: const InputDecoration(
                          labelText: "First Name",
                          icon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: lastNameController,
                          decoration: const InputDecoration(
                              labelText: "Last Name",
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
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
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure1,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure1 = !_isObscure1;
                                });
                              },
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _isObscure2,
                          controller: cpasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            icon: Icon(
                              Icons.security_outlined,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure2 = !_isObscure2;
                                });
                              },
                            ),
                          ),
                        )),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                  //   child: Text.rich(
                  //     TextSpan(
                  //       children: [
                  //         TextSpan(
                  //           text:
                  //               'By tapping Sign Up, you acknowledge that you have read the ',
                  //           style: TextStyle(fontSize: 12),
                  //         ),
                  //         TextSpan(
                  //             text: 'Privacy Policy',
                  //             style: TextStyle(
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.blue,
                  //                 decoration: TextDecoration.underline),
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (context) {
                  //                     return PolicyDialog(
                  //                       mdFileName: 'privacy_policy.md',
                  //                     );
                  //                   },
                  //                 );
                  //               }),
                  //         TextSpan(
                  //           text: ' and agree to the ',
                  //           style: TextStyle(fontSize: 12),
                  //         ),
                  //         TextSpan(
                  //           text: 'Terms & Conditions',
                  //           style: TextStyle(
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.blue,
                  //               decoration: TextDecoration.underline),
                  //         ),
                  //         TextSpan(
                  //           text: '.',
                  //           style: TextStyle(fontSize: 12),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          elevation: 10,
                          color: const Color(0xFF1565C0),
                          onPressed: () {
                            _userSignUp();
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Already have an account? Sign in now!"),
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

  void _userSignUp() {
    String _firstName = firstNameController.text.toString();
    String _lastName = lastNameController.text.toString();
    String _email = emailController.text.toString();
    String _password = passwordController.text.toString();
    String _confirmPassword = cpasswordController.text.toString();
    bool isValid = EmailValidator.validate(_email);

    if (_firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty) {
      if (isValid == true) {
        if (_password == _confirmPassword) {
          http.post(
              Uri.parse(
                  "https://hubbuddies.com/271513/cyberform/php/registeruser.php"),
              body: {
                "firstName": _firstName,
                "lastName": _lastName,
                "email": _email,
                "password": _password
              }).then((response) {
            print(response.body);
            print(response.statusCode);
            var data = jsonDecode(response.body);
            if (response.statusCode == 200 && data['status'] == 'success') {
              print("Success");
              _verify(context);
              return;
            } else {
              print("Failed");
              Fluttertoast.showToast(
                  msg: "Email has been used. Please try again",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            }
          });
        } else {
          Fluttertoast.showToast(
              msg: "Password mismatch!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Invalid Email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please fill in your information",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  _verify(BuildContext context) async {
    // set up the buttons
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Fluttertoast.showToast(
            msg: "Sign up success!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Verfication"),
      content: const Text(
          "Please activate your account through your mailbox to sign in!"),
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
}
