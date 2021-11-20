import 'package:flutter/material.dart';
import 'package:sn/model/post.dart';
import 'package:sn/model/user.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class FeedsProvider extends ChangeNotifier {
  List<Post> _posts = [];
  List<User> _followers = [];
  List<Post> get posts => _posts;
  List<User> get folowers => _followers;
  bool isBusy = false;

  setBusy(bool busy) {
    isBusy = busy;
    notifyListeners();
  }

  Future getPosts() async {
    setBusy(true);
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post_list(
        "http://192.168.0.100/post/feeds", {'token': token});
    for (var data in res) {
      _posts.add(Post(
          id: data['id'],
          body: data['post_body'],
          posted_date: data['posted_date'],
          user_id: data['user_id'],
          comments: data['comments'],
          likes: data['likes'],
          isLiked: data['isliked']));
    }
    notifyListeners();
    setBusy(false);
  }

  Future setFollowers() async {
    if (_followers.isEmpty) {
      setBusy(true);
      final token = await UserStorage.getToken().then((value) => value);
      final res = await BaseApi.post_list(
          "http://192.168.0.100/user/followers", {'token': token});
      print("${res[0]}");
      for (var data in res) {
        _followers.add(User(
            id: data['id'],
            username: data['username'],
            fullname: data['fullname'],
            addressemail: data['address_email'],
            phonenumber: data['phone_number'],
            imagepath: data['imagepath'],
            password: ""));
      }
      notifyListeners();
      setBusy(false);
    }
  }

  //Future refresh() async {
  //  setBusy(true);
//
  //  final token = await UserStorage.getToken().then((value) => value);
//
  //  var res = await BaseApi.post_list(
  //      "http://192.168.0.100/post/feeds", {'token': token});
  //  for (var data in res) {
  //    _posts.add(Post(
  //        id: data['id'],
  //        body: data['post_body'],
  //        posted_date: data['posted_date'],
  //        user_id: data['user_id'],
  //        comments: data['comments'],
  //        likes: data['likes'],
  //        isLiked: data['isliked']));
  //  }
  //  var _res = await BaseApi.post_list(
  //      "http://192.168.0.100/user/followers", {'token': token});
  //  for (var data in _res) {
  //    _posts.add(Post(
  //        id: data['id'],
  //        body: data['post_body'],
  //        posted_date: data['posted_date'],
  //        user_id: data['user_id'],
  //        comments: data['comments'],
  //        likes: data['likes'],
  //        isLiked: data['isliked']));
  //  }
  //  notifyListeners();
  //  setBusy(false);
  //}

  likepost() {}
}
