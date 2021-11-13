import 'package:flutter/material.dart';
import '../../ui/compenent/comment.dart';
import '../../ui/widget/user_title.dart';

class Commentfield extends StatefulWidget {
  final String username;
  final String commentbody;
  final ImageProvider image;
  const Commentfield(
      {Key? key,
      required this.commentbody,
      required this.image,
      required this.username})
      : super(key: key);

  @override
  _CommentfieldState createState() => _CommentfieldState();
}

class _CommentfieldState extends State<Commentfield> {
  @override
  Widget build(BuildContext context) {
    return Commentcompenent(
        child: Userheader(
      subtitle: widget.commentbody,
      title: widget.username,
      image: widget.image, //AssetImage("assets/images/main_lg.png"),
      ontap: () {},
      height: 50,
      width: 50,
    ));
  }
}
