import 'package:flutter/material.dart';
import '../../ui/compenent/bottombar.dart';

class BottombarUI extends StatefulWidget {
  const BottombarUI({Key? key}) : super(key: key);

  @override
  _BottombarUIState createState() => _BottombarUIState();
}

class _BottombarUIState extends State<BottombarUI> {
  @override
  Widget build(BuildContext context) {
    return Bottombarcomepenent(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.message_sharp)),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
            backgroundColor: Colors.black, //.pink[400],
            focusColor: Colors.black,
          ),
          //IconButton(
          //  padding: EdgeInsets.only(bottom: 20),
          //  highlightColor: Colors.pink,
          //  iconSize: 50,
          //  focusColor: Colors.amberAccent,
          //  onPressed: () {},
          //  icon: Icon(Icons.add),
          //  color: Colors.pink,
          //),
          //IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.manage_accounts_outlined)),
        ],
      ),
    );
  }
}
