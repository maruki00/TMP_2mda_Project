import 'package:flutter/material.dart';

class PostTextcompenent extends StatelessWidget {
  final Widget child;
  const PostTextcompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10))),
        child: child);
  }
}
