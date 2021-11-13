import 'package:flutter/material.dart';
import 'package:sn/ui/widget/navbar.dart';
import 'package:sn/ui/widget/post.dart';
import 'package:sn/ui/widget/users.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(physics: AlwaysScrollableScrollPhysics(), children: [
      Navbarui(),
      UsersnavUI(),
      //PostUI(),
      SizedBox(
        height: 501,
      )
    ]);
  }
}
