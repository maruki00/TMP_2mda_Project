import 'package:flutter/material.dart';

class Bottoncompenent extends StatelessWidget {
  final Widget child;
  const Bottoncompenent({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 35,
      child: child,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.white10),
      ),
    );
  }
}
