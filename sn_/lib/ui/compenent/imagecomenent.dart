import 'package:flutter/material.dart';

class Imagecompenent extends StatelessWidget {
  final double hieght;
  final double width;
  final ImageProvider image;
  const Imagecompenent(
      {Key? key,
      required this.width,
      required this.hieght,
      required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.pink.shade100,
        child: ClipOval(
          child: Image(
            image: image,
            height: hieght,
            width: width,
          ),
        ),
      ),
    );
  }
}
