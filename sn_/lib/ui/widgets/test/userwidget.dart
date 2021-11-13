import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final ImageProvider image;
  final Function ontap;
  final String title;
  final String subtitle;

  const UserWidget(
      {Key? key,
      required this.image,
      required this.ontap,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.blue.shade900),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        ontap();
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: ClipOval(
          child: Image(
            height: 50,
            width: 50,
            image: image,
          ),
        ),
      ),
    );
  }
}
