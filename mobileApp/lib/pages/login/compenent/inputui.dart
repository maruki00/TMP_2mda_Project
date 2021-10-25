import "package:flutter/material.dart";
import "package:ful_less_state/compenent/inputcontaiber.dart";
class InputUI extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChange;
  final bool ispassword;
  const InputUI({ Key? key ,
                    required this.hintText,
                    required this.onChange,
                    this.ispassword=false
                    }) 
  : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        obscureText: ispassword,
        textAlign: TextAlign.center,
        onChanged: onChange,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: ispassword?const Icon(Icons.remove_red_eye):null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}