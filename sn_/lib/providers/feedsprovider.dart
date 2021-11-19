import 'package:flutter/material.dart';
import 'package:sn/model/post.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class FeedsProvider extends ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  bool isBusy = false;

  setBusy(bool busy) {
    isBusy = busy;
    notifyListeners();
  }

  Future<List<Post>> getPosts() async {
    setBusy(true);
    print("tken: ${UserStorage.getToken()}");
    final res = await BaseApi.post_list(
        "http://192.168.0.100/post/feeds", {'token': UserStorage.getToken()});
    print(res);
    for (var data in res) {
      _posts.add(Post(data['id'], data['post_body'], data['posted_date'],
          data['user_id'], data['comments'], data['likes'], data['isliked']));
    }
    notifyListeners();
    setBusy(false);
    return _posts;
  }

  likepost() {}
}
