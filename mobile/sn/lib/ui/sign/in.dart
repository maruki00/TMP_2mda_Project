import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/pages/home.dart';
import 'package:sn/ui/sign/up.dart';
import 'package:sn/ui/widget/botton.dart';
import 'package:sn/ui/widget/input_ui.dart';
import 'package:sn/ui/widget/textredirection.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        height: 300,
                        width: MediaQuery.of(context).size.width * 0.6,
                        image: const AssetImage("assets/images/main_lg.jpg")),
                    InputUI(
                        isPwd: false, hint: "username", controller: username),
                    InputUI(
                        isPwd: true, hint: "password", controller: password),
                    BottonUI(
                        text: "login",
                        onpressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        }),
                    TextRedirection(
                        msg: "You dont have an Account? ",
                        text: "Sign In",
                        ontap: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerpage()));
                          }),
                  ],
                ))));
  }
}
