import 'package:flutter/material.dart';
import 'package:sn/model/message.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class MessageProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;
  bool isbusy = false;

  setBusy(bool busy) {
    isbusy = busy;
  }

  Future setMessage(var id) async {
    messages.clear();
    print("id : ${id}");
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post_list(
            "http://192.168.0.100/message/get", {"token": token, "user_id": id})
        .then((res) {
      print(res);
      setBusy(true);
      if (!res.contains("Error")) {
        for (var data in res) {
          _messages.add(Message.FromJsom(data));
        }
      }
    }).whenComplete(() {
      setBusy(false);
    });
    notifyListeners();
  }

  Future send(var id, var msg) async {
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post("http://192.168.0.100/message/add",
        {"token": token, "user_id": id, "message": msg}).then((res) {
      if (!res.containsKey("Error")) {
        setMessage(id);
      }
    });
    notifyListeners();
  }
}
