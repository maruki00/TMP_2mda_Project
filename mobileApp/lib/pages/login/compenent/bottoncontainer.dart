import "package:flutter/material.dart";
class BottonContainer extends StatelessWidget {
  final ButtonStyleButton child;
  final Color color;
  const BottonContainer({ Key? key,
                      required this.child,
                      required this.color
                    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      width: size.width*0.75,
      height: 40,
      child: child,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0,
          color: Colors.white10
        ),
      ),
    );
  }
}