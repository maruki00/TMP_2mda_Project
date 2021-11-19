import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/baseproviders.dart';
import 'package:sn/ui/pages/app/home.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';

void main(List<String> args) async {
  setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  Provider.debugCheckInvalidValueType = null;
  runApp(MaterialApp(home: Homepage() //Home(),
      ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Homepage(),
    );
  }
}
