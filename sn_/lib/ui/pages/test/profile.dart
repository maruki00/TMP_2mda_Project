import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  Profilepage({Key? key}) : super(key: key);

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final controller = TextEditingController();
  bool _edit = false;
  @override
  Widget build(BuildContext context) {
    controller.text = 'hello world';
    return ListView(
      //padding: EdgeInsets.all(20),
      //decoration: BoxDecoration(
      //  color: Colors.grey.shade300,
      //),

      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "@Maruki",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _edit = !_edit;
                    });
                  },
                  icon: !_edit ? Icon(Icons.edit) : Icon(Icons.save))
            ],
          ),
        ),
        Container(
            height: 200,
            width: 200,
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/main_lg.jpeg"),
                ),
              ),
            )),
        Container(
          child: Column(
            children: [
              //InputUI(
              //    isPwd: false,
              //    isEnabled: _edit,
              //    hint: "Fullname",
              //    controller: TextEditingController()),
              //InputUI(
              //    isPwd: false,
              //    isEnabled: _edit,
              //    hint: "Fullname",
              //    controller: TextEditingController()),
              //InputUI(
              //    isPwd: false,
              //    isEnabled: _edit,
              //    hint: "Fullname",
              //    controller: TextEditingController()),
              //InputUI(
              //    isPwd: true,
              //    isEnabled: _edit,
              //    hint: "Fullname",
              //    controller: TextEditingController()),
            ], //
          ), //
        )
      ],
    );
    //));
  }
}
