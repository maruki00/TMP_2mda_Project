import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/widget/textredirection.dart';
import 'package:sn/ui/widget/widgets/button/buttonwidget.dart';
import 'package:sn/ui/widget/widgets/input/pwdwidget.dart';
import 'package:sn/ui/widget/widgets/input/inputwidget.dart';
import 'package:sn/ui/widget/widgets/text/textwidget.dart';

class Signinpage extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  Signinpage({Key? key}) : super(key: key);

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
                    const Text(
                      "Sign In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputWidget(
                      controller: TextEditingController(),
                      hint: "hint",
                      isEnable: true,
                    ),
                    PwdWidget(
                      controller: controller1,
                      hint: "password",
                      isEnable: true,
                    ),
                    ButtonWidget(click: () {}, title: "log In"),
                    TextWidget(
                      ontap: TapGestureRecognizer()
                        ..onTap = () {
                          print("hello world");
                        },
                      clickedText: "Sign UP",
                      label: "You dont have An account? ",
                    )
                  ],
                ))));
  }
}
