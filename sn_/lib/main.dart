import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sn/model/baseapi.dart';
import 'package:sn/providers/signup/signupprovider.dart';
import './ui/pages/sign/signinpage.dart';
import './ui/pages/sign/signuppage.dart';
import "package:http/http.dart" as http;

void main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(MaterialApp(home: Home() //Home(),
      ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProvider>(
        create: (_) => SignupProvider(),
        child: const Scaffold(
          body: SignUpPage(),
        ));
  }
}

class Router extends Route {}
