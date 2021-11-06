import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/users.dart';
import 'package:sn/ui/pages/messagepage.dart';

class UsersnavUI extends StatefulWidget {
  const UsersnavUI({Key? key}) : super(key: key);
  @override
  _UsersnavUIState createState() => _UsersnavUIState();
}

class _UsersnavUIState extends State<UsersnavUI> {
  @override
  Widget build(BuildContext context) {
    return Userscompenent(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 70,
                height: 70,
                color: Colors.white,
                padding: EdgeInsets.all(2),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Messagepage()));
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.pink[50],
                        child: ClipOval(
                            child: Image(
                          height: 70,
                          width: 70,
                          image: AssetImage("assets/images/main_lg.png"),
                        )))));
          }),
    );
  }
}
