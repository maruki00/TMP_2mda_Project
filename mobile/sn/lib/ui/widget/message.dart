import 'package:flutter/material.dart';

class Messagefield extends StatelessWidget {
  final String message;
  final Alignment derecition;
  const Messagefield(
      {Key? key, required this.message, required this.derecition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: derecition,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: derecition != Alignment.topRight
                ? Colors.blue.shade100
                : Colors.pink.shade100,
            borderRadius: BorderRadius.only(
                topLeft: derecition != Alignment.topRight
                    ? Radius.circular(0)
                    : Radius.circular(10),
                topRight: derecition != Alignment.topLeft
                    ? Radius.circular(0)
                    : Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        width: size.width * 0.4,
        child: Text(
          message,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
