import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cpasswordController = new TextEditingController();

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
                      const Text(
                        "Create Account",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                        color: Colors.white,
                        child: TextField(
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
                        child: TextField(
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
                        child: TextField(
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
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              icon: Icon(
                                Icons.security_outlined,
                                color: Colors.black,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        color: Colors.white,
                        child: TextField(
                          obscureText: true,
                          controller: cpasswordController,
                          decoration: const InputDecoration(
                              labelText: "Confirm Password",
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
          if (response.body == "Failed") {
            print("Failed");
            Fluttertoast.showToast(
                msg: "Email has been used. Please try again",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0);
            return;
          } else {
            print("Success");
            Fluttertoast.showToast(
                msg: "Sign up success!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
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
  }
}
