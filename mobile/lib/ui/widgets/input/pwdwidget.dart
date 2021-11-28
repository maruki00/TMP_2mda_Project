import 'package:flutter/material.dart';
import './inputcompenent.dart';

class PwdWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isEnable;
  //final Widget suffix;
  const PwdWidget(
      {required this.controller, required this.hint, this.isEnable = true});

  @override
  _PwdFieldWidgetState createState() => _PwdFieldWidgetState();
}

class _PwdFieldWidgetState extends State<PwdWidget> {
  bool isPwd = true;
  @override
  Widget build(BuildContext context) {
    return Inputcompennt(
        child: TextField(
      controller: widget.controller,
      obscureText: isPwd,
      enabled: widget.isEnable,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPwd = !isPwd;
              });
            },
            icon: isPwd
                ? const Icon(
                    Icons.visibility,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          )),
    ));
  }
}
