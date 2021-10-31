import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userscompenent extends StatelessWidget {
  final Widget child;
  const Userscompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        margin: EdgeInsets.all(0),
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.all(0),
        child: child);
  }
}
