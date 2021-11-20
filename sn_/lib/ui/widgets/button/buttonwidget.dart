import 'package:flutter/material.dart';
import './button.dart';

class ButtonWidget extends StatelessWidget {
  final Function click;
  final String title;
  final Color forecolor;
  final Color backcolor;
  const ButtonWidget(
      {Key? key,
      required this.click,
      required this.title,
      this.forecolor = Colors.white,
      this.backcolor = Colors.pink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Buttoncompenent(
        child: TextButton(
      child: Text(title),
      onPressed: () {
        click();
      },
      style: TextButton.styleFrom(
        primary: forecolor,
        backgroundColor: backcolor,
        alignment: Alignment.center,
      ),
    ));
  }
}
