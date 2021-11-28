import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/searchprovider.dart';
import 'package:sn/ui/pages/app/profilepage.dart';
import 'package:sn/ui/widgets/user/userwidget.dart';
import "package:timeago/timeago.dart" as timeago;

class Searchpage extends StatelessWidget {
  final TextEditingController searchcontroller = TextEditingController();
  Searchpage();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, search, child) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: Border.all(color: Colors.grey, width: 0.5)),
            child: TextField(
              controller: searchcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () =>
                        search.setUsers(searchcontroller.text.toString()),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: RefreshIndicator(
                onRefresh: () async {
                  if (searchcontroller.text.isNotEmpty)
                    search.setUsers(searchcontroller.text.toString());
                },
                child: search.isBusy
                    ? Center()
                    : search.users.isEmpty || searchcontroller.text.isEmpty
                        ? Center(
                            child: Text("Search Empty"),
                          )
                        : search.isBusy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: search.users.length,
                                itemBuilder: (context, index) {
                                  final user = search.users[index];
                                  return UserWidget(
                                      image: Image.network("${user.imagepath}"),
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(
                                                      id: user.id,
                                                      showAppbar: true,
                                                    )));
                                      },
                                      title: "${user.fullname}",
                                      subtitle:
                                          "joined ${timeago.format(DateTime.parse(user.lastaccess))}");
                                })),
          )
        ],
      );
    });
  }
}
