import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/widgets/line/horizontalline.dart';
import './signuppage.dart';
import 'package:sn/ui/widgets/button/buttonwidget.dart';
import 'package:sn/ui/widgets/input/inputwidget.dart';
import 'package:sn/ui/widgets/input/pwdwidget.dart';
import 'package:sn/ui/widgets/text/clickabletextwidget.dart';

class SigninPage extends StatelessWidget {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InputWidget(controller: usercontroller, hint: "Username"),
          PwdWidget(
            controller: passcontroller,
            hint: "Password",
            isEnable: true,
          ),
          //const SizedBox(
          //  height: 30,
          //),
          ButtonWidget(
            click: () {},
            title: "Log In",
            forecolor: Colors.white,
            backcolor: Colors.pink.shade400,
          ),
          const SizedBox(
            height: 20,
          ),
          const HorizontalLine(
            height: 20,
            label: "OR",
          ),
          const SizedBox(
            height: 20,
          ),
          ClickableTextWidget(
            ontap: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignUpPage()));
              },
            label: "You Don't have an account?  ",
            clickedText: "Sign Up",
          )
        ],
      ),
    )));
  }
}
