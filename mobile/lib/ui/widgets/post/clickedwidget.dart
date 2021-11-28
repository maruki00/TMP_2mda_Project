import 'package:flutter/material.dart';

class ClickedWidget extends StatelessWidget {
  final Widget child;
  final Function ontap;
  const ClickedWidget({required this.child, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: child,
        onTap: () => ontap());
  }
}
