import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn/services/baseapi.dart';
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

  Future<String> getImage(BuildContext context) async {
    final ImagePicker image = ImagePicker();
    dynamic img;
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Source'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () async {
                  img = await image.pickImage(source: ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text('From Gallory'),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  img = await image.pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text('From Camera'),
              ),
            ],
          );
        });
    return await img.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      image: imgpath.isEmpty
                          ? const AssetImage("assets/images/avatar.png")
                          : FileImage(File(imgpath)),
                      ontap: () async {
                        final tmp = await getImage(context);
                        setState(() {
                          imgpath = tmp;
                        });
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
                            border: Border.all(color: Colors.white, width: 3)),
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
            InputWidget(controller: phonecontroller, hint: "Phone Number"),
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
                  "file": await MultipartFile.fromFile(imgpath)
                });
                final res = await BaseApi.post(
                    "http://192.168.0.100/user/register", data);

                await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: const Text('Please wait.'),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: const Text('loading.'),
                          )
                        ],
                      );
                    });

                if (!res.containsKey("Error")) {
                  print("access token = ${res['accesstoken']}");
                  print("username = ${usercontroller.text.toString()}");
                  print("password = ${namecontroller.text.toString()}");
                  //await UserStorage.setToken(   res['accesstoken'] ?? "");
                  //await UserStorage.setUsername(res['username'] ?? "");
                  //await UserStorage.setfullname(res['fullname'] ?? "");
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Success...")));
                  sleep(const Duration(seconds: 1));
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => SigninPage()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("${res['Error']}")));
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
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => SigninPage()));
                },
              label: "Already have an account?  ",
              clickedText: "Sign In",
            )
          ],
        ),
      ),
    ));
  }
}
