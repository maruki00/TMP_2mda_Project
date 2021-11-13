import 'package:flutter/material.dart';
import '../../ui/compenent/bottombar.dart';
import '../../ui/pages/feeds.dart';
import '../../ui/pages/messagelist.dart';
import '../../ui/pages/new_post.dart';
import '../../ui/pages/profile.dart';
import '../../ui/pages/search.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget? wgt;

  @override
  void initState() {
    super.initState();
    wgt = Feeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wgt, //Homepage(),
      bottomNavigationBar: Bottombarcomepenent(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Feeds();
                  });
                },
                icon: Icon(Icons.home_outlined)),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Messagelist();
                  });
                },
                icon: Icon(Icons.mail_outline)),
            FloatingActionButton(
              tooltip: "Add new post",
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  wgt = Newpostpage();
                });
              },
              backgroundColor: Colors.pink,
              focusColor: Colors.black,
            ),
            //IconButton(
            //  padding: EdgeInsets.only(bottom: 20),
            //  highlightColor: Colors.pink,
            //  iconSize: 50,
            //  focusColor: Colors.amberAccent,
            //  onPressed: () {
            //    setState(() {
            //      wgt = Newpostpage();
            //    });
            //  },
            //  icon: Icon(Icons.add),
            //  color: Colors.pink,
            //),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Searchpage();
                  });
                },
                icon: Icon(Icons.search_sharp)),
            IconButton(
                color: Colors.black54,
                onPressed: () {
                  setState(() {
                    wgt = Profilepage();
                  });
                },
                icon: Icon(Icons.manage_accounts_outlined)),
          ],
        ),
      ),
    );
  }
}
