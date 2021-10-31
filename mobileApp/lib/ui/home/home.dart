import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const Navbarui(),
            UsersnavUI(),
            SizedBox(
              height: 20,
            ),
            PostUI(),
            PostUI(),
            PostUI(),
            PostUI(),
            PostUI(),
          ])),
      bottomNavigationBar: BottombarUI(),
    );
  }
}
