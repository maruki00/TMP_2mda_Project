import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Userscompenent extends StatelessWidget {
  final Widget child;
  const Userscompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: double.infinity,
        margin: EdgeInsets.only(left: 8),
        child: child);
  }
}
