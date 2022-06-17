import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  var _image;
  String pathAsset = "assets/images/profilepic.png";
  var defaultImageUrl;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  late int genderId;
  late int locationId;

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                icon: Icon(Icons.edit),
              )
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Container(
            color: Colors.blue,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 4.0,
                                // ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child:
                                      widget.user.user_Id.toString() == 'null'
                                          ? Image.asset(pathAsset)
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  "https://hubbuddies.com/271513/myTutor/assets/profilepic/" +
                                                      widget.user.user_Id
                                                          .toString() +
                                                      '.jpg',
                                            ),
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
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _userInfo(
                                  context,
                                  Icons.person,
                                  "First Name",
                                  widget.user.first_name.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.person,
                                  "Last Name",
                                  widget.user.last_name.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.email,
                                  "Email Address",
                                  widget.user.email.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.numbers,
                                  "Age",
                                  widget.user.age.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.person,
                                  "Gender",
                                  widget.user.gender.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.home,
                                  "Location",
                                  widget.user.location.toString(),
                                ),
                                _userInfo(
                                  context,
                                  Icons.school,
                                  "Education Level",
                                  widget.user.education.toString(),
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
          ))),
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
}
