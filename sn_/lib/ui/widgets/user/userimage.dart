import 'package:flutter/material.dart';

class UserimageWidget extends StatelessWidget {
  final Function ontap;
  final Image image;
  final double width;
  final double height;
  final String name;
  const UserimageWidget(
      {required this.ontap,
      required this.image,
      required this.width,
      required this.height,
      this.name = "abdo"});
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
          width: width,
          height: height,
          color: Colors.white,
          padding: EdgeInsets.all(2),
          child: InkWell(
            onTap: () => ontap(),
            child: CircleAvatar(
                backgroundColor: Colors.pink[50],
                child: ClipOval(child: image)),
            //Text("${name}")
          )),
      Text("${name.length > 10 ? name.substring(0, 8) + "..." : name}"),
    ]);
  }
}
