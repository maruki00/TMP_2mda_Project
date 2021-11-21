import 'package:flutter/material.dart';
import 'package:sn/ui/widgets/user/userwidget.dart';

class PostWidget extends StatelessWidget {
  final Image userimage;
  final Function userTap;
  final String usertitle;
  final String usersubtitle;
  final String postbody;
  final Function onlike;
  final Function oncomment;
  String likes;
  String comments;
  bool isLiked;
  double hieght;
  PostWidget(
      {required this.userTap,
      required this.userimage,
      required this.usertitle,
      required this.usersubtitle,
      required this.postbody,
      required this.onlike,
      required this.oncomment,
      this.isLiked = false,
      this.likes = "0",
      this.comments = "0",
      this.hieght = 155});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      height: 300,
      width: MediaQuery.of(context).size.width * 0.95,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Colors.grey.shade300, width: 0.3),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.brown.shade50,
            )
          ]),
      child: Column(
        children: [
          UserWidget(
            image: userimage,
            ontap: userTap,
            title: usertitle,
            subtitle: usersubtitle,
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: SingleChildScrollView(
                      child: Text(
                    postbody,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  )))),
          Row(
            children: [
              SizedBox(
                width: 2,
              ),
              IconButton(
                onPressed: () {
                  onlike();
                },
                icon: isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 20,
                color: Colors.red,
              ),
              Text(
                "${likes} likes",
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  oncomment();
                },
                icon: Icon(Icons.comment),
                iconSize: 20,
                color: Colors.black54,
              ),
              Text(
                "${comments} likes",
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
