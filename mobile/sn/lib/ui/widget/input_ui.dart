import "package:flutter/material.dart";
import 'package:sn/ui/compenent/input.dart';

class InputUI extends StatefulWidget {
  final bool isPwd;
  final String hint;
  bool? isEnabled = true;
  final TextEditingController controller;
  InputUI(
      {Key? key,
      required this.isPwd,
      required this.hint,
      required this.controller,
      this.isEnabled})
      : super(key: key);
  @override
  _InputUIState createState() => _InputUIState();
}

class _InputUIState extends State<InputUI> {
  late bool showtext = true;
  @override
  void initState() {
    super.initState();
    showtext = widget.isPwd;
  }

  @override
  Widget build(BuildContext context) {
    return Inputcompennt(
        child: TextField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      obscureText: showtext,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hint,
        suffixIcon: widget.isPwd
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showtext = !showtext;
                  });
                },
                icon: Icon(
                  showtext ? Icons.visibility : Icons.visibility_off,
                  color: showtext ? Colors.pink : Colors.grey,
                ),
              )
            : null,
      ),
    ));
  }
}
