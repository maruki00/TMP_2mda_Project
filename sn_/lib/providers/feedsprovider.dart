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

  Future _LoadPosts() async {
    setBusy(true);
    _posts.clear();
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post_list(
        "http://192.168.0.100/post/feeds", {'token': token}).then((res) {
      if (!res.contains("Error")) {
        for (var data in res) {
          _posts.add(Post(
              id: data['id'],
              body: data['post_body'],
              posted_date: data['posted_date'],
              user_id: data['user_id'],
              comments: data['comments'],
              likes: data['likes'],
              isLiked: data['isliked'],
              user: data['user'],
              userimage: data['imagepath']));
        }
      }
      notifyListeners();
    }).whenComplete(() {
      setBusy(false);
    });
  }

  Future _LoadFollowers() async {
    setBusy(true);
    _followers.clear();
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post_list(
        "http://192.168.0.100/user/followers", {'token': token}).then((res) {
      if (!res.contains("Error")) {
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
      }
      notifyListeners();
    }).whenComplete(() {
      setBusy(false);
    });

    //setBusy(false);
  }

  Future getPosts() async {
    _LoadPosts();
  }

  Future setFollowers() async {
    if (_followers.isEmpty) {
      _LoadFollowers();
    }
  }

  Future refresh() async {
    _LoadFollowers();
    _LoadPosts();
  }

  likepost(var id) async {
    final token = await UserStorage.getToken().then((value) => value);
    final action = int.parse("${posts[id].likes}") == 0 ? 'add' : 'delete';
    final res = await BaseApi.post("http://192.168.0.100/like/$action",
        {'token': token, 'post_id': "${posts[id].id}"}).then((res) {
      print("like res: ${res}");
      if (!res.containsKey("Error")) {
        //posts[id].isLiked = 1; //int.parse("${posts[id].isLiked}");
        if (action == "add") {
          posts[id].isLiked = '1';
          posts[id].likes = int.parse("${posts[id].likes}") + 1;
        } else {
          posts[id].isLiked = '0';
          posts[id].likes = int.parse("${posts[id].likes}") - 1;
        }
      }
    });
    notifyListeners();
  }
}
