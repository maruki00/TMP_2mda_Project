import 'package:flutter/material.dart';

class Postcompenent extends StatelessWidget {
  final Widget child;
  const Postcompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.centerLeft,
      child: child,
      //height: ,
      width: MediaQuery.of(context).size.width * 0.95,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Colors.grey.shade300, width: 0.3),
          boxShadow: [
            BoxShadow(
                //blurRadius: 0.1,
                offset: Offset(0, 2),
                color: Colors.brown.shade50,
                spreadRadius: 0.1)
          ]),
    );
  }
}
