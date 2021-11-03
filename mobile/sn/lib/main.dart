import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/home/post.dart';

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
      home: Postpage(),
    );
  }
}
