import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_final_year_project/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditImage extends StatefulWidget {
  final User user;
  EditImage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  var _image;
  String pathAsset = "assets/images/profilepic.png";

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
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
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
                      _updateImage();
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

  void _updateImage() {
    String base64Image = base64Encode(_image!.readAsBytesSync());

    http.post(
        Uri.parse(
            "https://hubbuddies.com/271513/cyberform/php/update_image.php"),
        body: {
          "user_Id": widget.user.user_Id,
          "email": widget.user.email,
          "image": base64Image,
        }).then((response) {
      print(response.body);
      print(response.statusCode);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        print("Success");
        Fluttertoast.showToast(
            msg: "Successfully Update",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        print("Failed");
        Fluttertoast.showToast(
            msg: "Failed to Update",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    });
  }
}
