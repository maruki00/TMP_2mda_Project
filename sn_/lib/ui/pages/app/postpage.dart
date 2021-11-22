import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/model/comment.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/ui/widgets/comment/addcommentwidget.dart';
import 'package:sn/ui/widgets/comment/commentwidget.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import 'package:sn/ui/widgets/post/userinfowidget.dart';
import "package:timeago/timeago.dart" as timego;

class PostPage extends StatefulWidget {
  final id;
  const PostPage({required this.id});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController commentcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await backend<PostProvider>().setPost(widget.id);
      await backend<PostProvider>().setComments(widget.id);
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
                            userimage: Image.network(
                                "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg"),
                            postbody: "${post.post.body}",
                            comments: "${post.post.comments}",
                            likes: "${post.post.likes}",
                            isLiked: int.parse(post.post.isLiked) > 0,
                            userTap: () {},
                            oncomment: () {},
                            onlike: () {}, //=> post.likepost(),
                            hieght: 10,
                          ),
                        ),
                        Expanded(
                            child: RefreshIndicator(
                          child: ListView.builder(
                              itemCount: post.comments.length,
                              itemBuilder: (context, index) {
                                final comment = post.comments[index];
                                return CommentWidget(
                                    ondelete: () {},
                                    ontap: () {},
                                    timeago: "",
                                    image: Image.network(comment.userimage),
                                    title: "${comment.user}",
                                    subtitle: "${comment.comment_body}");
                              }),
                          onRefresh: () => backend<PostProvider>().refresh(),
                          key: GlobalKey<RefreshIndicatorState>(),
                        )),
                        AddCommentWidget(
                            send:
                                () {}, //=> post.comment(commentcontroller.text),
                            controller: commentcontroller)
                      ])));
    });
  }
}
