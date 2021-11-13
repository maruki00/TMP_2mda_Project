import 'package:flutter/material.dart';

class Userheader extends StatelessWidget {
  final ImageProvider image;
  final Function ontap;
  final String title;
  final String subtitle;
  double? height;
  double? width;
  Userheader(
      {Key? key,
      required this.image,
      this.height = 50.0,
      this.width = 50.0,
      required this.ontap,
      required this.title,
      required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        ontap();
      },
      leading: CircleAvatar(
        backgroundColor: Colors.pink.shade100,
        child: ClipOval(
          child: Image(
            height: height,
            width: width,
            image: image,
          ),
        ),
      ),
    );
  }
}
