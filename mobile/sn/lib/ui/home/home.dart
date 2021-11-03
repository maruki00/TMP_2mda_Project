import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/bottombar.dart';
import 'package:sn/ui/home/feeds.dart';
import 'package:sn/ui/home/new_post.dart';
import 'package:sn/ui/home/post.dart';
import 'package:sn/ui/home/profile.dart';
import 'package:sn/ui/sign/in.dart';
import 'package:sn/ui/sign/up.dart';
import 'package:sn/ui/widget/bottombar.dart';
import 'package:sn/ui/widget/navbar.dart';
import 'package:sn/ui/widget/post.dart';
import 'package:sn/ui/widget/users.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget? wgt;

  @override
  void initState() {
    super.initState();
    wgt = Feeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wgt, //Homepage(),
      bottomNavigationBar: Bottombarcomepenent(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Feeds();
                  });
                },
                icon: Icon(Icons.home_outlined)),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Postpage();
                  });
                },
                icon: Icon(Icons.mail_outline)),
            FloatingActionButton(
              tooltip: "Add new post",
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  wgt = Newpostpage();
                });
              },
              backgroundColor: Colors.pink,
              focusColor: Colors.black,
            ),
            //IconButton(
            //  padding: EdgeInsets.only(bottom: 20),
            //  highlightColor: Colors.pink,
            //  iconSize: 50,
            //  focusColor: Colors.amberAccent,
            //  onPressed: () {
            //    setState(() {
            //      wgt = Newpostpage();
            //    });
            //  },
            //  icon: Icon(Icons.add),
            //  color: Colors.pink,
            //),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Registerpage();
                  });
                },
                icon: Icon(Icons.search_sharp)),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Profilepage();
                  });
                },
                icon: Icon(Icons.manage_accounts_outlined)),
          ],
        ),
      ),
    );
  }
}
