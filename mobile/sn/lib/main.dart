import 'package:flutter/material.dart';
import 'package:sn/ui/sign/in.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: Home() //Home(),
      ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: Loginpage(),
    );
  }
}
