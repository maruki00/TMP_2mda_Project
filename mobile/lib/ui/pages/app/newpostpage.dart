import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/model/user.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/widgets/button/buttonwidget.dart';

class NewPostPage extends StatefulWidget {
  NewPostPage();

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  TextEditingController postcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, post, child) {
      return SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 30),
        Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Text(
              "What's New.?",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFFFFFF),
              border: Border.all(color: Colors.grey, width: 0.4)),
          child: Column(
            children: [
              TextFormField(
                  controller: postcontroller,
                  maxLines: 15,
                  decoration: InputDecoration(
                    hintText: "What's on your mind",
                    border: InputBorder.none,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ButtonWidget(
            click: () async {
              await post.Addpost(postcontroller.text.toString()).then((res) {
                print(res);
                if (res.toLowerCase() == "success") {
                  postcontroller.clear();
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${res.isNotEmpty ? res : "Opps ..."}")));
              });
            },
            title: "Add Post")
      ]));
    });
  }
}
