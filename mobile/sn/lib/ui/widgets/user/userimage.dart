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
    return
        //Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        ////alignment: Alignment.center,
        //children: [
        Container(
            width: width,
            height: height,
            color: Colors.white,
            padding: EdgeInsets.only(left: 5),
            child: InkWell(
              onTap: () => ontap(),
              child: CircleAvatar(
                  backgroundColor: Colors.pink[50],
                  child: ClipOval(child: image)),
              //Text("${name}")
            ));
    //Text(
    //  "${name.length > 10 ? name.substring(0, 8) + "..." : name}",
    //  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    //),
    //]);
  }
}
