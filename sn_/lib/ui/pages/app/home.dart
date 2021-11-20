import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';
import 'package:sn/providers/providers.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/pages/app/feedpage.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, home, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("TMP Project"),
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.pink,
            actions: [
              IconButton(
                  onPressed: () async {
                    home.logout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => SigninPage()));
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: home.child,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            margin: const EdgeInsets.all(0),
            color: Colors.white70,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    color: Colors.black54,
                    onPressed: () {
                      home.child = FeedsPage();
                      home.changechild();
                    },
                    icon: Icon(Icons.home_outlined)),
                IconButton(
                    color: Colors.black54,
                    onPressed: () {
                      home.child =
                          FeedsPage(); //Center(child: const Text("Home1"));
                      home.changechild();
                    },
                    icon: Icon(Icons.mail_outline)),
                FloatingActionButton(
                  tooltip: "Add new post",
                  child: Icon(Icons.add),
                  onPressed: () {
                    home.child = Center(child: const Text("Home2"));
                    home.changechild();
                  },
                  backgroundColor: Colors.pink,
                  focusColor: Colors.black,
                ),
                IconButton(
                    color: Colors.black54,
                    onPressed: () {
                      home.child = Center(child: const Text("Home3"));
                      home.changechild();
                    },
                    icon: Icon(Icons.search_sharp)),
                IconButton(
                    color: Colors.black54,
                    onPressed: () {
                      home.child = Center(child: const Text("Home4"));
                      home.changechild();
                    },
                    icon: Icon(Icons.manage_accounts_outlined)),
              ],
            ),
          ));
    });
  }
}
