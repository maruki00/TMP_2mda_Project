import 'package:flutter/material.dart';
import 'package:sn/model/post.dart';
import 'package:sn/model/user.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class ProfileProvider extends ChangeNotifier {
  late User _user;
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  User get user => _user;
  bool isBusy = false;

  setBusy(bool busy) {
    isBusy = busy;
    notifyListeners();
  }

  Future laod(var id) async {
    _posts.clear();
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post("http://192.168.0.100/user/profile",
        {'token': token, 'user_id': id}).then((res) {
      _user = User.fromJson(res);
    }).whenComplete(() {
      notifyListeners();
    });

    await BaseApi.post_list("http://192.168.0.100/post/foruser",
        {'token': token, 'user_id': id}).then((res) {
      if (!res.contains("Error")) {
        print("Posts result: $res");
        for (var data in res) {
          final p = Post.fromJson(data);
          if (p.isNotNull()) _posts.add(p);
        }
      }
      notifyListeners();
    });
  }

  Future follow(var id) async {
    print("Followed id ${id}");
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post(
            "http://192.168.0.100/follow", {'token': token, "user_id": id})
        .then((res) {
      print("Res= $res");
      if (!res.containsKey("Error")) {
        laod(id);
      }
      notifyListeners();
    });
  }

  Future unfollow(var id) async {
    print("Followed id ${id}");
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post(
            "http://192.168.0.100/unfollow", {'token': token, "user_id": id})
        .then((res) {
      print("Res= $res");
      if (!res.containsKey("Error")) {
        laod(id);
      }
      notifyListeners();
    });
  }

  likepost(var id) async {
    final token = await UserStorage.getToken().then((value) => value);
    final action = int.parse("${posts[id].likes}") == 0 ? 'add' : 'delete';
    await BaseApi.post("http://192.168.0.100/like/$action",
        {'token': token, 'post_id': "${posts[id].id}"}).then((res) {
      if (!res.containsKey("Error")) {
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
