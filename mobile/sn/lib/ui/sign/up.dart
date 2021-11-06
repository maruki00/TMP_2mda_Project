import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sn/ui/sign/in.dart';
import 'package:sn/ui/widget/botton.dart';
import 'package:sn/ui/widget/input_ui.dart';
import 'package:sn/ui/widget/textredirection.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final mycontroller = TextEditingController();

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                reverse: false,
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: "Billabong",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputUI(
                        isPwd: false,
                        hint: "Username",
                        controller: mycontroller),
                    InputUI(
                        isPwd: false,
                        hint: "Full Name",
                        controller: mycontroller),
                    InputUI(
                        isPwd: false, hint: "Email", controller: mycontroller),
                    InputUI(
                        isPwd: false,
                        hint: "Phone Number",
                        controller: mycontroller),
                    InputUI(
                        isPwd: true,
                        hint: "Password",
                        controller: mycontroller),
                    const SizedBox(
                      height: 10,
                    ),
                    BottonUI(text: "Register", onpressed: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    TextRedirection(
                        msg: "Already have an Account? ",
                        text: " Sign In",
                        ontap: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          }),
                  ],
                ))));
  }
}
