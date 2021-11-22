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
    var token;
    await UserStorage.getToken().then((value) {
      token = value;
    });
    var username;
    await UserStorage.getUsername().then((value) {
      username = value;
    });
    var fullname;
    await UserStorage.getFullname().then((value) {
      fullname = value;
    });

    return (token.toString().isNotEmpty &&
            token != null &&
            username.toString().isNotEmpty &&
            username != null &&
            fullname.toString().isNotEmpty) &&
        fullname != null;
  }

  Future<bool> Login(String username, String pwd) async {
    bool ret = false;
    setbusy(true);
    Map<String, dynamic> res = await BaseApi.post(
        "http://192.168.0.100/user/login",
        {"username": username, "password": pwd});
    if (res.containsKey("Error")) {
      ret = false;
    } else {
      print("${res}");
      UserStorage.setUsername("${res['username']}");
      UserStorage.setToken("${res['token']}");
      UserStorage.setfullname("${res['fullname']}");
      ret = true;
    }
    notifyListeners();
    setbusy(false);
    return ret;
  }
}
