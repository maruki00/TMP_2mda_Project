import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/post.dart';
import 'package:sn/ui/compenent/post_text.dart';
import 'package:sn/ui/widget/commentinput.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Postcompenent(
                child: Column(
              children: [
                Userheader(
                    image: AssetImage("assets/images/main_lg.png"),
                    ontap: () {},
                    title: "title",
                    subtitle: "subtitle"),
                PostTextcompenent(
                    child: Text(
                        "kjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdhkjsahglkjsadhglkjsahglakjsdh")),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )),
                    Text("106 Likes"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment,
                          color: Colors.grey,
                        )),
                    Text("106 Likes"),
                  ],
                )
              ],
            )),
            Container(
              child: Column(
                children: [
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                  Postcompenent(
                    child: Userheader(
                        image: AssetImage("assets/images/main_lg.png"),
                        ontap: () {},
                        title: "title",
                        subtitle: "subtitle"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.1)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.green.shade600,
                      ),
                      onPressed: () {},
                    ),
                    hintText: "Your Message",
                    border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: CommentInput()
    );
  }
}
