import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/homeprovider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/pages/app/feedpage.dart';
import 'package:sn/ui/pages/app/messagespage.dart';
import 'package:sn/ui/pages/app/profilepage.dart';
import 'package:sn/ui/pages/app/searchpage.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';
import 'package:sn/ui/widgets/button/buttonwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage();

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
                          MessagesPage(); //Center(child: const Text("Home1"));
                      home.changechild();
                    },
                    icon: Icon(Icons.mail_outline)),
                FloatingActionButton(
                  tooltip: "Add new post",
                  child: Icon(Icons.add),
                  onPressed: () async {
                    // home.child = NewPostPage();
                    // home.changechild();
                    await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          final postcontroller = TextEditingController();
                          final post = backend<PostProvider>();
                          return SimpleDialog(
                            title: const Text(
                              "What's New.?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            children: <Widget>[
                              SingleChildScrollView(
                                  child: Column(children: [
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFFFFFFF),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.4)),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                          controller: postcontroller,
                                          maxLines: 15,
                                          decoration: InputDecoration(
                                            hintText: "What's on your mind",
                                            border: InputBorder.none,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ButtonWidget(
                                    click: () async {
                                      await post.Addpost(
                                              postcontroller.text.toString())
                                          .then((res) {
                                        print(res);
                                        if (res.toLowerCase() == "success") {
                                          postcontroller.clear();
                                          backend<FeedsProvider>().refresh();
                                          home.child = FeedsPage();
                                          home.changechild();
                                          Navigator.pop(context);
                                        }
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "${res.isNotEmpty ? res : "Opps ..."}")));
                                      });
                                    },
                                    title: "Add Post")
                              ]))
                            ],
                          );
                        });
                  },
                  backgroundColor: Colors.pink,
                  focusColor: Colors.black,
                ),
                IconButton(
                    color: Colors.black54,
                    onPressed: () {
                      home.child = Searchpage();
                      home.changechild();
                    },
                    icon: Icon(Icons.search_sharp)),
                IconButton(
                    color: Colors.black54,
                    onPressed: () async {
                      await UserStorage.getId().then((id) {
                        print("id = $id");
                        home.child =
                            ProfilePage(id: id.toString(), showAppbar: false);
                        home.changechild();
                      });
                    },
                    icon: Icon(Icons.manage_accounts_outlined)),
              ],
            ),
          ));
    });
  }
}
