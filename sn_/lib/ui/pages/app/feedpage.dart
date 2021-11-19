import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/feedsprovider.dart';
import 'package:sn/ui/widgets/post/postwidget.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FeedsProvider>(context);
    prov.getPosts();
    print(prov.posts);
    return prov.isBusy
        ? CircularProgressIndicator()
        : Consumer<FeedsProvider>(builder: (context, model, child) {
            return Scaffold(
                body: ListView.builder(
                    itemCount: model.posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(
                          userTap: () {},
                          userimage: AssetImage("assets/images/avatar.png"),
                          usertitle: "maruki00",
                          usersubtitle: "1/1/2021",
                          postbody: "postbody skfduhalshdl",
                          onlike: () {},
                          oncomment: () {});
                    }));
          });
  }
}
