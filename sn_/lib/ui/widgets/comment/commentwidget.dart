import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final Function send;
  final TextEditingController controller;
  const CommentWidget({required this.send, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.white),
      ),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    send();
                  },
                  icon: Icon(Icons.send)))),
    );
  }
}
