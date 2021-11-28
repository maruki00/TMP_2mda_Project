import 'package:flutter/material.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class SigninProvider extends ChangeNotifier {
  bool busy = false;
  String user = "";
  String pass = "";

  setbusy(bool bs) {
    busy = bs;
    notifyListeners();
  }

  Future<bool> isAuth() async {
    var token = await UserStorage.getToken().then((value) => value);
    var username = await UserStorage.getUsername().then((value) => value);
    var fullname = await UserStorage.getFullname().then((value) => value);
    var id = await UserStorage.getId().then((value) => value);
    var img = await UserStorage.getImgpath().then((value) => value);
    print("token:${token}\tusername:${username}\tfullname:${fullname}");
    return (img.toString().isNotEmpty &&
            id.toString().isNotEmpty &&
            token.toString().isNotEmpty &&
            token != null &&
            username.toString().isNotEmpty &&
            username != null &&
            fullname.toString().isNotEmpty) &&
        fullname != null;
  }

  Future<bool> Login(String username, String pwd) async {
    bool ret = false;
    await BaseApi.post("http://192.168.0.100/user/login",
        {"username": username, "password": pwd}).then((res) {
      setbusy(true);
      if (res.containsKey("Error")) {
        ret = false;
      } else {
        UserStorage.setid("${res['id']}");
        UserStorage.setUsername("${res['username']}");
        UserStorage.setToken("${res['token']}");
        UserStorage.setfullname("${res['fullname']}");
        UserStorage.setImagepath("${res['imagepath']}");
        ret = true;
      }
      notifyListeners();
      setbusy(false);
    });
    return ret;
  }
}
