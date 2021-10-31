import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/home/home.dart';
import 'package:sn/ui/widget/bottombar.dart';
import 'package:sn/ui/widget/navbar.dart';
import 'package:sn/ui/widget/post.dart';
import 'package:sn/ui/post/post.dart';
import 'package:sn/ui/sign/in.dart';
import 'package:sn/ui/sign/up.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: home(),
  ));
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: Loginpage(),
    );
  }
}
