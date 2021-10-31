import 'package:flutter/material.dart';
import 'package:sn/ui/sign/compenent/botton.dart';

class BottonUI extends StatelessWidget {
  final String text;
  final Function onpressed;
  const BottonUI({Key? key, required this.text, required this.onpressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Bottoncompenent(
      child: ElevatedButton(
        child: Text(text),
        onPressed: () => onpressed(),
      ),
    );
  }
}
