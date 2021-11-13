import 'package:flutter/material.dart';
import '../../ui/widget/botton.dart';

class Newpostpage extends StatefulWidget {
  const Newpostpage({Key? key}) : super(key: key);

  @override
  _NewpostpageState createState() => _NewpostpageState();
}

class _NewpostpageState extends State<Newpostpage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(height: 30),
      Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Text(
            "@maruki",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      SizedBox(height: 30),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFFFFF),
            border: Border.all(color: Colors.grey, width: 0.4)),
        child: Column(
          children: [
            TextFormField(
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: "What is your mind",
                  border: InputBorder.none,
                )),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      BottonUI(text: "add post", onpressed: () {})
    ]));
  }
}
