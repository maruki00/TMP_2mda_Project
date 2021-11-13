import 'package:flutter/material.dart';
import '../../ui/widget/post.dart';

class Userpage extends StatelessWidget {
  const Userpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("@Maruki"),
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            image: AssetImage("assets/images/main_lg.png"),
                          ),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Text("@Maruki",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15)),
                        Text("Abdellah Oulahyane",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.pink.shade400,
                                ),
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //PostUI(),
            ],
          ),
        ));
  }
}
