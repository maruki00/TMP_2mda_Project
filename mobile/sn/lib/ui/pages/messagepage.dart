import 'package:flutter/material.dart';
import 'package:sn/ui/widget/message.dart';

class Messagepage extends StatelessWidget {
  const Messagepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text("@Maruki"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          Messagefield(
              message:
                  "hello how are youhello how are youhello how are youhello how are you",
              derecition: Alignment.topLeft),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topRight),
          Messagefield(
              message: "hello how are you", derecition: Alignment.topLeft),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.1)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.green.shade600,
                    ),
                    onPressed: () {},
                  ),
                  hintText: "Your Message",
                  border: InputBorder.none),
            ),
          )
        ])));
  }
}
