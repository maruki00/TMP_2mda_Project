import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/searchprovider.dart';
import 'package:sn/ui/widgets/user/userwidget.dart';

class Searchpage extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();
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
                onRefresh: () =>
                    search.setUsers(searchcontroller.text.toString()),
                child: search.users.isEmpty
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
                              return UserWidget(
                                  image: Image.network(
                                      "http://192.168.0.100/images/avatar.png"),
                                  ontap: () {
                                    //Navigator.push(
                                    //    context, MaterialPageRoute(builder: (context) => Userpage()));
                                  },
                                  title: "User1",
                                  subtitle: "last seen 1/1/2021");
                            })),
            //ListView(children: [
            //  Userheader(
            //      image: AssetImage("assets/images/main_lg.png"),
            //      ontap: () {},
            //      title: "User1",
            //      subtitle: ""),
            //]),
          )
        ],
      );
    });
  }
}
