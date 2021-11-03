import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/botton.dart';
import 'package:sn/ui/compenent/post.dart';
import 'package:sn/ui/widget/post.dart';
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
        ),
        body: (bottom: 0, child: Text("dfdfd")));
    //SingleChildScrollView(
    //  child: Column(
    //    children: [
    //      Postcompenent(
    //          child: Column(
    //        children: [
    //          Userheader(
    //              image: AssetImage("assets/images/main_lg.png"),
    //              ontap: () {},
    //              title: "title",
    //              subtitle: "subtitle"),
    //          Container(
    //              width: double.infinity,
    //              margin: EdgeInsets.all(4),
    //              padding: EdgeInsets.all(14),
    //              decoration: BoxDecoration(
    //                  color: Colors.grey.shade100,
    //                  borderRadius: BorderRadius.only(
    //                      bottomLeft: Radius.circular(10),
    //                      bottomRight: Radius.circular(10),
    //                      topRight: Radius.circular(10))),
    //              child: Text("kjsahglkjsadhglkjsahglakjsdh")),
    //          Row(
    //            children: [
    //              IconButton(
    //                  onPressed: () {},
    //                  icon: Icon(
    //                    Icons.favorite_rounded,
    //                    color: Colors.red,
    //                  )),
    //              Text("106 Likes"),
    //              IconButton(
    //                  onPressed: () {},
    //                  icon: Icon(
    //                    Icons.comment,
    //                    color: Colors.grey,
    //                  )),
    //              Text("106 Likes"),
    //            ],
    //          )
    //        ],
    //      )),
    //      Postcompenent(
    //        child: Row(
    //          children: [
    //            Bottoncompenent(
    //              child: TextField(
    //                decoration: InputDecoration(hintText: "sfdgsf"),
    //              ),
    //            )
    //          ],
    //        ),
    //      ),
    //    ],
    //  ),
    //));
    //bottomNavigationBar: Container());
  }

  List<Widget> generateComments(int lenght) {
    return <Widget>[];
  }
}
