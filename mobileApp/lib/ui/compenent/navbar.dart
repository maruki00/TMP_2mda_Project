import 'package:flutter/material.dart';

class Navbarcompenent extends StatelessWidget {
  final Widget child;
  const Navbarcompenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink,
      padding: const EdgeInsets.only(top: 25),
      margin: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
      height: 85,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}
