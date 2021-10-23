


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const Scaffold(
      appBar: AppBar(
        title: Text("hello world"),
        actions: <Widget>[
          IconButton(onPressed: ()=>print("hellow orld"), icon: Icon(Icons.access_alarms)
        ],
      ),
    )
  );
}