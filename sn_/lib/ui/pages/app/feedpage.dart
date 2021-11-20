import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/baseproviders.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import 'package:sn/ui/widgets/user/userimage.dart';
import 'package:sn/ui/widgets/user/userwidget.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await backend<FeedsProvider>().getPosts();
      await backend<FeedsProvider>().setFollowers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedsProvider>(builder: (context, feeds, child) {
      print("this is feeds page");
      for (var data in feeds.posts) {
        print(data.body);
      }
      return feeds.isBusy
          ? Center(child: CircularProgressIndicator())
          : Consumer<FeedsProvider>(builder: (context, model, child) {
              return ListView(
                children: [
                  Container(
                      height: 80,
                      child: ListView.builder(
                          itemCount: 20, //model.folowers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return UserimageWidget(
                              name: "asdfssd,kjfsaldkjfhsalkdfalskad",
                              height: 100,
                              width: 80,
                              image: Image(
                                  image: AssetImage("assets/images/avatar.png"),
                                  height: 70,
                                  width: 80),
                              ontap: () {},
                            );
                          })),
                  PostWidget(
                      userTap: () {},
                      userimage: AssetImage("assets/images/avatar.png"),
                      usertitle: model.posts[0].user_id,
                      usersubtitle: model.posts[0].posted_date,
                      postbody: model.posts[0].body,
                      likes: 0,
                      onlike: () {},
                      oncomment: () {}),
                  PostWidget(
                      userTap: () {},
                      userimage: AssetImage("assets/images/avatar.png"),
                      usertitle: model.posts[0].user_id,
                      usersubtitle: model.posts[0].posted_date,
                      postbody: model.posts[0].body,
                      likes: 0,
                      onlike: () {},
                      oncomment: () {}),
                  PostWidget(
                      userTap: () {},
                      userimage: AssetImage("assets/images/avatar.png"),
                      usertitle: model.posts[0].user_id,
                      usersubtitle: model.posts[0].posted_date,
                      postbody: model.posts[0].body,
                      likes: 0,
                      onlike: () {},
                      oncomment: () {}),
                  PostWidget(
                      userTap: () {},
                      userimage: AssetImage("assets/images/avatar.png"),
                      usertitle: model.posts[0].user_id,
                      usersubtitle: model.posts[0].posted_date,
                      postbody: model.posts[0].body,
                      likes: 0,
                      onlike: () {},
                      oncomment: () {}),
                  PostWidget(
                      userTap: () {},
                      userimage: AssetImage("assets/images/avatar.png"),
                      usertitle: model.posts[0].user_id,
                      usersubtitle: model.posts[0].posted_date,
                      postbody: model.posts[0].body,
                      likes: 0,
                      onlike: () {},
                      oncomment: () {}),
                ],
              );
            });
    });
  }
}
