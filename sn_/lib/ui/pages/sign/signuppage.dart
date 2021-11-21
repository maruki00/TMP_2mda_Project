import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sn/providers/signupprovider.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/ui/pages/app/home.dart';
import 'package:sn/ui/widgets/line/horizontalline.dart';
import '../../widgets/image/imagewidget.dart';
import './signinpage.dart';
import 'package:sn/ui/widgets/button/buttonwidget.dart';
import 'package:sn/ui/widgets/input/inputwidget.dart';
import 'package:sn/ui/widgets/input/pwdwidget.dart';
import 'package:sn/ui/widgets/text/clickabletextwidget.dart';
import "dart:io";
import "dart:async";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  String imgpath = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, signup, child) {
      return signup.busy
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      child: Stack(
                        children: [
                          ImageWidget(
                              height: 110,
                              width: 110,
                              image: FileImage(File(signup.imgpath)),
                              ontap: () async {
                                await signup.getImage(context);
                              }),
                          Positioned(
                              bottom: 15,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue,
                                    border: Border.all(
                                        color: Colors.white, width: 3)),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InputWidget(controller: usercontroller, hint: "Username"),
                    InputWidget(controller: namecontroller, hint: "Full name"),
                    InputWidget(controller: emailcontroller, hint: "Email"),
                    InputWidget(
                        controller: phonecontroller, hint: "Phone Number"),
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
                        final data = Map<String, dynamic>.from({
                          "username": usercontroller.text.toString(),
                          "password": passcontroller.text.toString(),
                          "fullname": namecontroller.text.toString(),
                          "address_email": emailcontroller.text.toString(),
                          "phone_number": phonecontroller.text.toString(),
                          "file": await MultipartFile.fromFile(signup.imgpath)
                        });
                        final res = await signup.register(context, data);
                        if (res == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        }
                      },
                      title: "Sign Up",
                      forecolor: Colors.white,
                      backcolor: Colors.pink.shade400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const HorizontalLine(height: 20, label: "OR"),
                    const SizedBox(
                      height: 20,
                    ),
                    ClickableTextWidget(
                      ontap: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => SigninPage()));
                        },
                      label: "Already have an account?  ",
                      clickedText: "Sign In",
                    )
                  ],
                ),
              ),
            ));
    });
  }
}
