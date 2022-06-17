import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _image;
  String pathAsset = "assets/images/profilepic.png";

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
          title: const Text('Update'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: _image == null
                                ? Image.asset(pathAsset)
                                : Image.file(_image),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 20.0,
                        child: InkWell(
                          onTap: () {
                            _showPickOptionsDialog();
                          },
                          child: const Icon(Icons.camera_alt,
                              color: Color(0xFF919191), size: 28.0),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'First Name',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    // labelStyle: TextStyle(
                    //   color: focusNode.hasFocus
                    //       ? const Color.fromARGB(255, 9, 56, 95)
                    //       : const Color(0xFF919191),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 9, 56, 95)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Last Name',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    // labelStyle: TextStyle(
                    //   color: focusNode.hasFocus
                    //       ? const Color.fromARGB(255, 9, 56, 95)
                    //       : const Color(0xFF919191),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 9, 56, 95)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    // labelStyle: TextStyle(
                    //   color: focusNode.hasFocus
                    //       ? const Color.fromARGB(255, 9, 56, 95)
                    //       : const Color(0xFF919191),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Color.fromARGB(255, 9, 56, 95)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gender',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: genderId,
                      onChanged: (val) {
                        setState(() {
                          genderId = 1;
                        });
                      },
                    ),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(width: 20),
                    Radio(
                      value: 2,
                      groupValue: genderId,
                      onChanged: (val) {
                        setState(() {
                          genderId = 2;
                        });
                      },
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: locationId,
                      onChanged: (val) {
                        setState(() {
                          locationId = 1;
                        });
                      },
                    ),
                    Text(
                      'Rural',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(width: 20),
                    Radio(
                      value: 2,
                      groupValue: locationId,
                      onChanged: (val) {
                        setState(() {
                          locationId = 2;
                        });
                      },
                    ),
                    Text(
                      'Urban',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Education Level',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 8,
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 10,
                    color: const Color.fromARGB(255, 9, 56, 95),
                    onPressed: () {
                      _updateProfile();
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  _showPickOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: Colors.blue,
              ),
              title: const Text("Pick from Gallery"),
              onTap: () => {
                Navigator.of(context).pop(),
                _galleryPicker(),
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera, color: Colors.blue),
              title: const Text("Take a Picture"),
              onTap: () => {
                Navigator.of(context).pop(),
                _cameraPicker(),
              },
            )
          ],
        ),
      ),
    );
  }

  _galleryPicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800,
      maxWidth: 800,
    );
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _cropImage();
    }
  }

  _cameraPicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 800,
      maxWidth: 800,
    );
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _cropImage();
    }
  }

  Future<void> _cropImage() async {
    String base64Image = base64Encode(_image!.readAsBytesSync());

    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: _image!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Color(0xFF1565C0),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      _image = croppedFile;
      setState(() {});
    }
  }

  void _updateProfile() {}
}
