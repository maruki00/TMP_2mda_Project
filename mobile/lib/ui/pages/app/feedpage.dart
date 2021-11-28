import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/ui/pages/app/messagepage.dart';
import 'package:sn/ui/pages/app/postpage.dart';
import 'package:sn/ui/pages/app/profilepage.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import 'package:sn/ui/widgets/user/userimage.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedsPage extends StatefulWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  late GlobalKey<RefreshIndicatorState> ky;
  @override
  void initState() {
    super.initState();
    ky = GlobalKey<RefreshIndicatorState>();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await backend<FeedsProvider>().getPosts();
      await backend<FeedsProvider>().setFollowers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Consumer<FeedsProvider>(builder: (context, model, child) {
          return model.isBusy
              ? Center(child: CircularProgressIndicator())
              : ListView(children: [
                  Container(
                      margin: EdgeInsets.only(top: 2, left: 3, bottom: 2),
                      height: 80,
                      child: model.folowers.length < 1
                          ? Center(child: Text("No Followers..."))
                          : ListView.builder(
                              itemCount: model
                                  .folowers.length, //model.folowers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                final u = model.folowers[i];
                                return UserimageWidget(
                                  name: "${u.fullname}",
                                  height: 100,
                                  width: 80,
                                  image: Image.network("${u.imagepath}"),
                                  ontap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              MessagePage(id: u.id))),
                                );
                              })),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 220,
                          minHeight: 300),
                      child: model.posts.length <= 0
                          ? Center(child: Text("No Post..."))
                          : ListView.builder(
                              itemCount: model.posts.length,
                              itemBuilder: (context, index) {
                                final post = model.posts[index];
                                try {
                                  return PostWidget(
                                      isLiked: int.parse("${post.isLiked}") > 0,
                                      userTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProfilePage(
                                                    id: post.user_id,
                                                    showAppbar: true,
                                                  ))),
                                      likes: "${post.likes}",
                                      comments: "${post.comments}",
                                      userimage:
                                          Image.network("${post.userimage}"),
                                      usersubtitle:
                                          "${timeago.format(DateTime.parse("${post.posted_date}"))}",
                                      usertitle: post.user,
                                      postbody: post.body,
                                      onlike: () {
                                        model.likepost(index);
                                      },
                                      oncomment: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    PostPage(id: post.id)));
                                      });
                                } catch (e) {
                                  return Center(
                                    child: Text(""),
                                  );
                                }
                              })),
                ]);
        }),
        onRefresh: () => backend<FeedsProvider>().refresh(),
        key: GlobalKey<RefreshIndicatorState>());
  }
}
