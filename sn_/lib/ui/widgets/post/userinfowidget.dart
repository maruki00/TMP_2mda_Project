import 'package:flutter/material.dart';
import './clickedwidget.dart';

class UserinfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Image image;
  final Function ontap;
  const UserinfoWidget(
      {required this.ontap,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        //width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
            child: ListTile(
                title: ClickedWidget(
                    ontap: () => ontap(),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.blue.shade400,
                          fontWeight: FontWeight.w600),
                    )),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: ClickedWidget(
                    ontap: () => ontap(),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(child: image),
                    ),
                  ),
                ))));
  }
}
