import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.white),
      ),
      child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    print("pressed");
                  },
                  icon: Icon(Icons.send)))),
    );
  }
}
