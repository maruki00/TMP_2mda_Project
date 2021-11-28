import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/providers/profileprovider.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/pages/app/postpage.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import "package:timeago/timeago.dart" as timeago;

class ProfilePage extends StatefulWidget {
  final id;
  final bool showAppbar;
  const ProfilePage({required this.id, required this.showAppbar});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _myid;
  @override
  void initState() {
    super.initState();
    backend<ProfileProvider>().laod(widget.id);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _myid = await UserStorage.getId().then((value) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.showAppbar
            ? AppBar(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
              )
            : AppBar(toolbarHeight: 0),
        body: Consumer<ProfileProvider>(builder: (context, profile, child) {
          return profile.isBusy //|| !profile.user.isNotNull()
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => profile.laod(widget.id),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      !profile.user.isNotNull()
                          ? Center(
                              child: Text("Check Your connection ..."),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      child: ClipOval(
                                          child: Image.network(
                                        profile.user.imagepath,
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 100,
                                      )),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("@${profile.user.username}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 15)),
                                      Text("${profile.user.fullname}",
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      _myid != profile.user.id
                                          ? TextButton(
                                              onPressed: () {
                                                print(
                                                    "floowers: ${int.parse("${profile.user.isfollow}") > 0}");
                                                int.parse("${profile.user.isfollow}") >
                                                        0
                                                    ? profile.unfollow(
                                                        profile.user.id)
                                                    : profile.follow(
                                                        profile.user.id);
                                              },
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: 100,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: Colors.pink.shade400,
                                                  ),
                                                  child: Text(
                                                    int.parse("${profile.user.isfollow}") >
                                                            0
                                                        ? "Unfollow"
                                                        : "Follow",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )))
                                          : Center()
                                    ],
                                  ),
                                )
                              ],
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      profile.posts.length < 0
                          ? Center(
                              child: Text("No Post ..."),
                            )
                          : Expanded(
                              child: profile.posts.length <= 0
                                  ? Center(
                                      child: Text(
                                      "No Post Found.",
                                      style: TextStyle(fontSize: 15),
                                    ))
                                  : profile.posts.length <= 0
                                      ? Center(child: Text("No Post ..."))
                                      : ListView.builder(
                                          itemCount: profile.posts.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final post = profile.posts[index];
                                            return Center(
                                                child: PostWidget(
                                                    userTap: () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) => PostPage(
                                                                id: post.id))),
                                                    userimage: Image.network(
                                                        "${post.userimage}"),
                                                    usertitle: "${post.user}",
                                                    usersubtitle:
                                                        "${timeago.format(DateTime.parse(post.posted_date))}",
                                                    postbody: "${post.body}",
                                                    onlike: () =>
                                                        profile.likepost(index),
                                                    likes: "${post.likes}",
                                                    isLiked: int.parse(profile
                                                            .posts[index]
                                                            .isLiked) >
                                                        0,
                                                    comments:
                                                        "${post.comments}",
                                                    oncomment: () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) => PostPage(id: post.id)))));
                                          }))
                    ],
                  ));
        }));
  }
}
