import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './text.dart';

class ClickableTextWidget extends StatelessWidget {
  final GestureRecognizer ontap;
  final String label;
  final String clickedText;
  const ClickableTextWidget(
      {Key? key, required this.ontap, this.label = "", this.clickedText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Textcompenent(
        child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: label,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 12)),
        TextSpan(
          text: clickedText,
          style: TextStyle(
              color: Colors.blue.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 15),
          recognizer: ontap,
        )
      ]),
    ));
  }
}
