import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/baseproviders.dart';
import 'package:sn/providers/providers.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';

void main(List<String> args) async {
  setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  //Provider.debugCheckInvalidValueType = null;
  runApp(_Home() //Home(),
      );
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers, child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SigninPage());
  }
}
