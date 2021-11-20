import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/baseproviders.dart';
import 'package:sn/providers/signinprovider.dart';
import 'package:sn/ui/pages/app/home.dart';
import 'package:sn/ui/widgets/line/horizontalline.dart';
import './signuppage.dart';
import 'package:sn/ui/widgets/button/buttonwidget.dart';
import 'package:sn/ui/widgets/input/inputwidget.dart';
import 'package:sn/ui/widgets/input/pwdwidget.dart';
import 'package:sn/ui/widgets/text/clickabletextwidget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      backend<SigninProvider>().isAuth().then((value) async {
        if (value == true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Homepage()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninProvider>(builder: (context, model, child) {
      return model.busy
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
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
                    click: () async {
                      var log = await model.Login(
                          usercontroller.text, passcontroller.text);

                      if (log == true) {
                        print("you are logged in");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      } else
                        print("you are not logged in");
                    },
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                    label: "You Don't have an account?  ",
                    clickedText: "Sign Up",
                  )
                ],
              ),
            )));
    });
  }
}
