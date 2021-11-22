import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final Image image;
  final Function ontap;
  final String title;
  final String subtitle;
  final String timeago;
  final Function ondelete;

  const CommentWidget(
      {required this.image,
      required this.ontap,
      required this.title,
      required this.timeago,
      required this.subtitle,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () => ondelete(),
        icon: Icon(Icons.delete_forever),
        iconSize: 20,
      ),
      onTap: () {
        ontap();
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: ClipOval(child: image),
      ),
    );
  }
}
