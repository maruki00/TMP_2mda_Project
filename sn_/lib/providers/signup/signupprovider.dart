import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn/model/baseapi.dart';
import 'package:sn/model/user.dart';
import "package:dio/dio.dart";

class SignupProvider with ChangeNotifier {
  late User user;
  late String imgpath = "../../../assets/images/avatar.png";

  SignupProvider();

  uploadImage(String imgpath) {
    this.imgpath = imgpath;
    notifyListeners();
  }

  signup(User user) {
    this.user = user;
    final resp = BaseApi.post("http://127.0.0.1/user/register", {
      "username": user.username,
      "password": user.password,
      "address_email": user.addressemail,
      "fullname": user.fullname,
      "file": MultipartFile.fromFile(user.imagepath),
      "phone_number": user.phonenumber
    });
    resp.then((value) => print(value));
  }

  Future<void> getImage(BuildContext context) async {
    final ImagePicker image = ImagePicker();
    dynamic img;
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Source'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () async {
                  img = await image.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                  return await img.path;
                },
                child: const Text('From Gallory'),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  img = await image.pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                  return await img.path;
                },
                child: const Text('From Camera'),
              ),
            ],
          );
        });
    imgpath = img.path;
    notifyListeners();
  }
}
