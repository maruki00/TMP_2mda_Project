import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final String label;
  final double height;
  const HorizontalLine({
    this.label = "",
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.grey.shade400,
              height: height,
            )),
      ),
      Text(label),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.grey.shade400,
              height: height,
            )),
      ),
    ]);
  }
}
