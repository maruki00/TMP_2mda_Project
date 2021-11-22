import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Image image;
  final Function ontap;
  final String title;
  final String subtitle;
  final String timeago;

  const MessageWidget(
      {required this.image,
      required this.ontap,
      required this.title,
      required this.timeago,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 4, right: 4),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade400, width: 0.2)),
        child: ListTile(
          focusColor: Colors.grey.shade400,
          title: Text(
            title,
            style: TextStyle(color: Colors.blue.shade900),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "10 month ago",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              Text(
                "${subtitle}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          onTap: () {
            ontap();
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: ClipOval(child: image),
          ),
        ));
  }
}
