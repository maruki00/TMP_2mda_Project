import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final double height;
  final double width;
  final String title;
  final Function ontap;
  const ImageWidget(
      {Key? key,
      this.title = "",
      required this.image,
      required this.ontap,
      this.width = 50,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: width,
            height: height,
            child: InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                ontap();
              },
            ),
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.black, width: 1),
                color: Colors.transparent,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                  //  image: image,
                  //  //image: image ?? AssetImage(""), //image
                ))),
        Wrap(children: [
          Text(
            title,
            textScaleFactor: 1.5,
            style: const TextStyle(fontSize: 7, fontWeight: FontWeight.w600),
          )
        ])
      ],
    ));
  }
}
