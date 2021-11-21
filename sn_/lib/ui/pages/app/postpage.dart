import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/postprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';
import "package:timeago/timeago.dart" as timego;

class PostPage extends StatefulWidget {
  var id;
  PostPage({required this.id});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    print("object;begin ....");
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await backend<PostProvider>().setPost(widget.id);
      await backend<PostProvider>().setComments(widget.id);
    });

    //var xx = backend<PostProvider>().posts;
    //print(xx);
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
                  height: 400, //MediaQuery.of(context).size.height - 300,
                  child: ListView(children: [
                    PostWidget(
                      usertitle: post.post.user,
                      usersubtitle:
                          timego.format(DateTime.parse(post.post.posted_date)),
                      userimage: Image.network(
                          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg"),
                      postbody: post.post.body,
                      comments: post.post.comments,
                      likes: post.post.likes,
                      isLiked: int.parse(post.post.isLiked) > 0,
                      userTap: () {},
                      oncomment: () {},
                      onlike: () {},
                      hieght: 10,
                    ),
                    SizedBox(height: 10),
                    //ListView.builder(
                    //    itemCount: 10,
                    //    itemBuilder: (context, index) {
                    //      return Center();
                    //    })
                  ])));
    });
  }
}
