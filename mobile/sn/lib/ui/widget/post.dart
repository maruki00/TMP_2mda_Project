import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/post.dart';
import 'package:sn/ui/compenent/post_text.dart';
import 'package:sn/ui/pages/post.dart';
import 'package:sn/ui/pages/user.dart';
import 'package:sn/ui/widget/user_title.dart';

class PostUI extends StatefulWidget {
  const PostUI({Key? key}) : super(key: key);

  @override
  _PostUIState createState() => _PostUIState();
}

class _PostUIState extends State<PostUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 200,
        child: ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Postcompenent(
                  child: Column(
                children: [
                  Userheader(
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Userpage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                  PostTextcompenent(
                    child: Text(
                        "kjhlaksjd hglkjdshlkjs hflkjshf lkjs flkjsa hfdlkjsa hfdkjasd fkjsadf jksahdfkjashdfkjsdf ksadhf kjsad fsad fncv.xmcvnmx vKJZ dfkhsa dfkj .dkjh "),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            color: Colors.red,
                            tooltip: "106 likes",
                          ),
                          Text(
                            "106 likes",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Postpage()));
                            },
                            icon: Icon(Icons.comment),
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            color: Colors.black54,
                            tooltip: "106 likes",
                          ),
                          Text(
                            "106 likes",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ))
                ],
              ));
            }));
  }
}
