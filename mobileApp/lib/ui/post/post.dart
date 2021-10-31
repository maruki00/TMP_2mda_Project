import 'package:flutter/material.dart';
import 'package:sn/ui/widget/post.dart';
import 'package:sn/ui/sign/widgets/input_ui.dart';
import 'package:sn/ui/widget/bottombar.dart';
import 'package:sn/ui/widget/comment.dart';
import 'package:sn/ui/widget/user_title.dart';

class Postpage extends StatefulWidget {
  const Postpage({Key? key}) : super(key: key);

  @override
  _PostpageState createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            PostUI(),
            SizedBox(
              height: 20,
            ),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            Commentfield(
                commentbody: "asdfasdgasdgasd",
                image: AssetImage("assets/images/main_lg.png"),
                username: "abdellah"),
            //Positioned(
            //  child: TextField(),
            //  bottom: 0,
            //)
          ]),
        ),
        bottomNavigationBar: TextField() //BottombarUI(),
        );
  }
}
