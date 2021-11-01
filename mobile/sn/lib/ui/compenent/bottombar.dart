import 'package:flutter/material.dart';

class Bottombarcomepenent extends StatelessWidget {
  final Widget child;
  const Bottombarcomepenent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      margin: const EdgeInsets.all(0),
      color: Colors.white70,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}
