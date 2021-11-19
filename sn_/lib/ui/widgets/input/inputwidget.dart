import 'package:flutter/material.dart';
import './inputcompenent.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final dynamic suffix;
  final dynamic prefix;
  final bool isEnable;
  const InputWidget(
      {required this.controller,
      required this.hint,
      this.prefix = null,
      this.suffix = null, //const Text(""),
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Inputcompennt(
        child: TextField(
      controller: controller,
      enabled: isEnable,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: suffix,
          prefixIcon: prefix //suffix
          ),
    ));
  }
}
