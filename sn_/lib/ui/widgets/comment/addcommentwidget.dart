import 'package:flutter/material.dart';

class AddCommentWidget extends StatelessWidget {
  final Function send;
  final TextEditingController controller;
  const AddCommentWidget({required this.send, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.grey.shade300,
        border: Border.all(width: 0, color: Colors.white),
      ),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: "Tap Message ...",
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    send();
                  },
                  icon: Icon(Icons.send)))),
    );
  }
}
