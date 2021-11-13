import 'package:flutter/material.dart';
import '../../ui/pages/messagepage.dart';
import '../../ui/widget/user_title.dart';

class Messagelist extends StatelessWidget {
  const Messagelist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text("Messages."),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Userheader(
                      height: 100,
                      image: AssetImage("assets/images/main_lg.png"),
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messagepage()));
                      },
                      title: "title",
                      subtitle: "subtitle"),
                ),
              ],
            ),
          ),
        ));
  }
}
