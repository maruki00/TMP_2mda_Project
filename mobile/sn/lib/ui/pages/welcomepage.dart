import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sn/providers/signinprovider.dart';
import 'package:sn/providers/sys/baseproviders.dart';
import 'package:sn/ui/pages/app/home.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';
import 'package:sn/ui/pages/sign/signuppage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 2), () {});
      await backend<SigninProvider>().isAuth().then((value) async {
        print("value: $value");
        if (value == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Homepage()));
        } else {
          super.initState();
        }
      });
    });
  }

  //wait() async {
  //  await Future.delayed(Duration(seconds: 2), () {});
  //  WidgetsBinding.instance?.addPostFrameCallback((_) {
  //    await backend<SigninProvider>().isAuth().then((value) async {
  //      print("Isauth: $value");
  //      if (value == true) {
  //        Navigator.pushReplacement(
  //            context, MaterialPageRoute(builder: (context) => Homepage()));
  //      } else {
  //        Navigator.pushReplacement(
  //            context, MaterialPageRoute(builder: (context) => SigninPage()));
  //      }
  //    });
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Logo Goes here",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator()
          ],
        )),
      ),
    ));
  }
}
