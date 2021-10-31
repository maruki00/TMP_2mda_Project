import 'package:flutter/material.dart';

class Commentcompenent extends StatelessWidget {
  final Widget child;
  const Commentcompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500, width: 0.1)),
    );
  }
}
