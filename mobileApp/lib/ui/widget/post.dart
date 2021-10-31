import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/post.dart';
import 'package:sn/ui/compenent/users.dart';
import 'package:sn/ui/widget/user_title.dart';

class PostUI extends StatefulWidget {
  const PostUI({Key? key}) : super(key: key);

  @override
  _PostUIState createState() => _PostUIState();
}

class _PostUIState extends State<PostUI> {
  @override
  Widget build(BuildContext context) {
    return Postcompenent(child: Text(""));
  }
}
