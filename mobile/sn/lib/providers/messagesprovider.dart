import 'package:flutter/material.dart';
import 'package:sn/model/message.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class MessagesProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;
  bool isbusy = false;

  setBusy(bool busy) {
    isbusy = busy;
  }

  Future setMessage() async {
    messages.clear();
    setBusy(true);
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post_list(
        "http://192.168.0.100/message/getall", {"token": token}).then((res) {
      for (var data in res) {
        final msg = Message.FromJsom(data);
        if (msg.isNotNull()) _messages.add(msg);
        _messages.add(Message.FromJsom(data));
      }
      notifyListeners();
    });
    setBusy(false);
  }

  //Future send(var msg) async {
  //  final token = await UserStorage.getToken().then((value) => value);
  //  await BaseApi.post_list(
  //      "http://192.168.0.100/message/add", {"token": token}).then((res) {
  //    if (!res.contains("Error")) {
  //      for (var data in res) {
  //        _messages.add(Message.FromJsom(data));
  //      }
  //    }
  //  });
  //  notifyListeners();
  //}
}
