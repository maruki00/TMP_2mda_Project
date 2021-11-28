import 'package:flutter/material.dart';
import 'package:sn/model/user.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class SearchProvider extends ChangeNotifier {
  List<User> _users = [];
  bool isBusy = false;
  List<User> get users => _users;
  setBusy(bool busy) => isBusy = busy;
  Future setUsers(var key) async {
    setBusy(true);
    users.clear();
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post_list("http://192.168.0.100/user/search",
        {'token': token, "searchkey": key}).then((res) {
      print("resulte of search $res");
      if (!res.contains("Error")) {
        for (var data in res) {
          User u = User.fromJson(data);
          if (data != null) _users.add(u);
        }
      }
      notifyListeners();
    }).whenComplete(() {
      setBusy(false);
    });
  }
}
