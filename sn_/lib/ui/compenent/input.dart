import 'package:flutter/material.dart';

class Inputcompennt extends StatelessWidget {
  final Widget child;
  const Inputcompennt({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.only(
          left: 15), //EdgeInsets.symmetric(vertical: 1, horizontal: 0),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white54,
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
    );
  }
}
