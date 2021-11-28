import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/pages/app/profilepage.dart';
import 'package:sn/ui/widgets/comment/addcommentwidget.dart';
import 'package:sn/ui/widgets/comment/commentwidget.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import "package:timeago/timeago.dart" as timego;

class PostPage extends StatefulWidget {
  final id;
  const PostPage({required this.id});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController commentcontroller = TextEditingController();
  String? _id = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await backend<PostProvider>().setPost(widget.id);
      await backend<PostProvider>().setComments(widget.id);
      _id = await UserStorage.getId().then((value) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, post, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Post"),
          ),
          body: post.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: PostWidget(
                            usertitle: "${post.post.user}",
                            usersubtitle: timego
                                .format(DateTime.parse(post.post.posted_date)),
                            userimage: Image.network(post.post.userimage),
                            postbody: "${post.post.body}",
                            comments: "${post.post.comments}",
                            likes: "${post.post.likes}",
                            isLiked: int.parse(post.post.isLiked) > 0,
                            userTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProfilePage(
                                            id: post.post.user_id,
                                            showAppbar: false,
                                          )));
                            },
                            oncomment: () {},
                            onlike: () => post.likepost(), //=> post.likepost(),
                            hieght: 10,
                          ),
                        ),
                        Expanded(
                            child: RefreshIndicator(
                          child: post.comments.length < 1
                              ? post.isBusy
                                  ? Center(child: CircularProgressIndicator())
                                  : Center(
                                      child: Text("Ops ..."),
                                    )
                              : ListView.builder(
                                  itemCount: post.comments.length,
                                  itemBuilder: (context, index) {
                                    final comment = post.comments[index];
                                    return CommentWidget(
                                        ondelete: () {
                                          post.uncomment(index);
                                        },
                                        deleteAuth: (_id == comment.user_id) ||
                                            (_id == post.post.user_id),
                                        ontap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => ProfilePage(
                                                        id: post.post.user_id,
                                                        showAppbar: false,
                                                      )));
                                        },
                                        timeago:
                                            "${timego.format(DateTime.parse(comment.commented_date))}",
                                        image: Image.network(comment.userimage),
                                        title: "${comment.user}",
                                        subtitle: "${comment.comment_body}");
                                  }),
                          onRefresh: () => backend<PostProvider>().refresh(),
                          key: GlobalKey<RefreshIndicatorState>(),
                        )),
                        AddCommentWidget(
                            send: () async {
                              final res = await post
                                  .comment(commentcontroller.text.toString())
                                  .then((value) => value);
                              if (res != null || res != false) {
                                commentcontroller.text = "";
                                backend<FeedsProvider>().refresh();
                              }
                            },
                            controller: commentcontroller)
                      ])));
    });
  }
}
