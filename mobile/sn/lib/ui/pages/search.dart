import 'package:flutter/material.dart';
import 'package:sn/ui/pages/user.dart';
import 'package:sn/ui/widget/user_title.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.5)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
          ),
        ),
        Userheader(
            image: AssetImage("assets/images/main_lg.png"),
            ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Userpage()));
            },
            title: "User1",
            subtitle: ""),
        //ListView(children: [
        //  Userheader(
        //      image: AssetImage("assets/images/main_lg.png"),
        //      ontap: () {},
        //      title: "User1",
        //      subtitle: ""),
        //]),
      ],
    );
  }
}
