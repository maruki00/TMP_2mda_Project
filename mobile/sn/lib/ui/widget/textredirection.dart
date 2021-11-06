import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/text.dart';

class TextRedirection extends StatelessWidget {
  final String msg;
  final String text;
  final GestureRecognizer? ontap;
  const TextRedirection(
      {Key? key, required this.msg, required this.text, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Textcompenent(
        child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: msg,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 12)),
        TextSpan(
            text: text,
            style: TextStyle(
                color: Colors.blue.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 15),
            recognizer: ontap)
      ]),
    ));
  }
}
