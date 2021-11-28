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
        "http://192.168.0.100/post/feeds", {'token': token}).then((res) => res);
    for (var data in res) {
      Post p = Post.fromJson(data);
      if (p.isNotNull()) _posts.add(p);
    }
    notifyListeners();
    setBusy(false);
  }

  Future _LoadFollowers() async {
    setBusy(true);
    _followers.clear();
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post_list(
            "http://192.168.0.100/user/followers", {'token': token})
        .then((res) => res);
    if (!res.contains("Error")) {
      for (var data in res) {
        final u = User.fromJson(data);
        if (u.isNotNull()) _followers.add(u);
      }
    }
    notifyListeners();

    setBusy(false);

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
    await _LoadFollowers();
    await _LoadPosts();
  }

  likepost(var id) async {
    final token = await UserStorage.getToken().then((value) => value);
    final action = int.parse("${posts[id].isLiked}") == 0 ? 'add' : 'delete';
    await BaseApi.post("http://192.168.0.100/like/$action",
        {'token': token, 'post_id': "${posts[id].id}"}).then((res) {
      if (!res.containsKey("Error")) {
        if (action == "add") {
          _posts[id].isLiked = '1';
          _posts[id].likes = "${int.parse("${_posts[id].likes}") + 1}";
        } else {
          _posts[id].isLiked = '0';
          _posts[id].likes = int.parse("${_posts[id].likes}") - 1;
        }
      }
    });
    notifyListeners();
  }
}
