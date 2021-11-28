import 'package:flutter/material.dart';
import 'package:sn/model/comment.dart';
import 'package:sn/model/post.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/services/userstorage.dart';

class PostProvider extends ChangeNotifier {
  late Post _post; //= Post();
  List<Comment> _comments = [];
  Post get post => _post;
  List<Comment> get comments => _comments;

  bool isBusy = false;
  setBusy(bool busy) {
    isBusy = busy;
    notifyListeners();
  }

  Future setPost(var id) async {
    final token = await UserStorage.getToken().then((value) => value);
    setBusy(true);
    await BaseApi.post(
            "http://192.168.0.100/post/get", {'token': token, 'id': id})
        .then((res) {
      _post = Post.fromJson(res);
      notifyListeners();
    }).whenComplete(() => setBusy(false));
  }

  Future setComments(var id) async {
    comments.clear();
    final token = await UserStorage.getToken().then((value) => value);

    await BaseApi.post_list("http://192.168.0.100/comment/get",
        {'token': token, 'post_id': _post.id}).then((res) {
      setBusy(true);
      for (var data in res) {
        final cmt = Comment.fromJson(data);
        if (cmt.isNotNull()) _comments.add(cmt);
      }
    }).whenComplete(() {
      setBusy(false);
      notifyListeners();
    }); //.whenComplete(() => setBusy(false));
  }

  Future refresh() async {
    await setPost(_post.id);
    await setComments(_post.id);
  }

  Future comment(String comment) async {
    final token = await UserStorage.getToken().then((value) => value);
    await BaseApi.post_list("http://192.168.0.100/comment/add",
        {'token': token, 'post_id': _post.id, "body": comment}).then((res) {
      if (!res.contains("Error")) {
        refresh();
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    });
  }

  Future uncomment(int index) async {
    final token = await UserStorage.getToken().then((value) => value);
    final comment = _comments[index];
    await BaseApi.post_list("http://192.168.0.100/comment/delete", {
      'token': token,
      'post_id': _post.id,
      "comment_id": comment.id
    }).then((res) {
      if (!res.contains("Error")) {
        refresh();
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    });
  }

  likepost() async {
    final token = await UserStorage.getToken().then((value) => value);
    final action = int.parse("${_post.likes}") == 0 ? 'add' : 'delete';
    await BaseApi.post("http://192.168.0.100/like/$action",
        {'token': token, 'post_id': "${_post.id}"}).then((res) {
      if (!res.containsKey("Error")) {
        if (action == "add") {
          _post.isLiked = '1';
          _post.likes = int.parse("${_post.likes}") + 1;
        } else {
          _post.isLiked = '0';
          _post.likes = int.parse("${_post.likes}") - 1;
        }
      }
    });
    notifyListeners();
  }

  Future<String> Addpost(var post) async {
    setBusy(true);
    String ret = "Some thing wrrong";
    final token = await UserStorage.getToken().then((value) => value);
    final res = await BaseApi.post(
            "http://192.168.0.100/post/add", {'token': token, 'post': post})
        .then((res) => res);
    if (res.containsKey("Message")) {
      ret = "Success";
    }
    setBusy(true);
    notifyListeners();
    return ret;
  }
}
