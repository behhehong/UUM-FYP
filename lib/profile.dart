import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_year_project/editImage.dart';
import 'package:flutter_final_year_project/editProfile.dart';
import 'package:flutter_final_year_project/homepage.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:flutter_final_year_project/surveypage.dart';
import 'package:flutter_final_year_project/data/data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final User user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<User> userList = <User>[];
  var _image;
  String pathAsset = "assets/images/profilepic.png";
  var defaultImageUrl;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  late int genderId;
  late int locationId;
  String firstName = "",
      lastName = "",
      age = "",
      gender = "",
      location = "",
      education = "",
      userId = "";

  String dropdownvalue = 'UPSR';
  var items = [
    'UPSR',
    'SPM',
    'Diploma/A-level/STPM/Foundation/Matriculation',
    'Degree',
    'Master',
    'PHD',
  ];

  @override
  void initState() {
    super.initState();
    genderId = 1;
    locationId = 1;
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1565C0),
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _showEditProfileDialog(context);
              },
              icon: Icon(Icons.edit),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: reload(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Container(
                  color: Color.fromRGBO(160, 210, 219, 1),
                  height: 950,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0)),
                                      // border: Border.all(
                                      //   color: Colors.white,
                                      //   width: 4.0,
                                      // ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: widget.user.user_Id == null
                                            ? Image.asset(pathAsset)
                                            : _loadImage(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "${widget.user.last_name.toString()} "
                                  " ${widget.user.first_name.toString()}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 25, 20, 0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _userInfo(
                                        context,
                                        Icons.person,
                                        "First Name",
                                        firstName,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.person,
                                        "Last Name",
                                        lastName,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.email,
                                        "Email Address",
                                        widget.user.email,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.numbers,
                                        "Age",
                                        age,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.person,
                                        "Gender",
                                        gender,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.home,
                                        "Location",
                                        location,
                                      ),
                                      _userInfo(
                                        context,
                                        Icons.school,
                                        "Education Level",
                                        education,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Column _userInfo(BuildContext context, logo, text, details) {
    return Column(
      children: [
        Row(
          children: [
            Icon(logo),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                details,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 30,
          color: Colors.grey,
        )
      ],
    );
  }

  void _loadUser() {
    http.post(
        Uri.parse("https://hubbuddies.com/271513/cyberform/php/load_user.php"),
        body: {
          "email": widget.user.email,
        }).then((response) {
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        print("Success");
        var extractdata = data['data'];

        if (extractdata['users'] != null) {
          userList = <User>[];
          extractdata['users'].forEach((v) {
            userList.add(User.fromJson(v));
          });
        }
        setState(() {
          userId = userList[0].user_Id!;
          firstName = userList[0].first_name!;
          lastName = userList[0].last_name!;
          age = userList[0].age!;
          gender = userList[0].gender!;
          location = userList[0].location!;
          education = userList[0].education!;
        });
        _loadImage();
      } else {
        print("Failed");
      }
    });
  }

  reload() async {
    String path =
        "https://hubbuddies.com/271513/cyberform/assets/images/profilepic";
    File profileImage = File("$path/${widget.user.user_Id.toString()}.jpg");

    if (profileImage.existsSync() == false) {
      return Text("File Not Found");
    } else {
      imageCache.clear();
      return Image.file(profileImage);
    }
  }

  _loadImage() {
    setState() {}
    return Image.network(
        "https://hubbuddies.com/271513/cyberform/assets/images/profilepic/" +
            widget.user.user_Id.toString() +
            '.jpg');
  }

  _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          content: const Text('Which part do you want to edit?',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditImage(
                                  user: widget.user,
                                ))).then((value) => _loadUser());
                  },
                  child: const Text(
                    'Image',
                    style: TextStyle(color: Color(0xFF1565C0)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  user: widget.user,
                                ))).then((value) => _loadUser());
                  },
                  child: const Text(
                    'Personal info',
                    style: TextStyle(color: Color(0xFF1565C0)),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
