import "package:flutter/material.dart";
import "package:ful_less_state/compenent/bottoncontainer.dart";

class BottonUI extends StatelessWidget {
  final Function  onpress;
  final Color color;
  final String text;
  const BottonUI({  Key? key ,
                    required this.onpress,
                    required this.color,
                    required this.text,
                }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottonContainer(
      color: Colors.red.shade500,
      child:         ElevatedButton(
          child:     Text(text),
          onPressed: ()=>onpress,
        ),
    );
  }
}