import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn/model/user.dart';
import 'package:sn/services/baseapi.dart';
import 'package:sn/ui/pages/sign/signinpage.dart';

class SignupProvider extends ChangeNotifier {
  late String imgpath = "";
  late User user;
  late bool busy = false;

  setbusy(bool bs) {
    busy = bs;
    notifyListeners();
  }

  Future<void> getImage(BuildContext context) async {
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
    imgpath = img.path;
    notifyListeners();
  }

  Future<bool> register(
      BuildContext context, Map<String, dynamic> jsonmada) async {
    setbusy(true);
    final res =
        await BaseApi.post("http://192.168.0.100/user/register", jsonmada);

    if (!res.containsKey("Error")) {
      //await UserStorage.setToken(res['accesstoken'] ?? "");
      //await UserStorage.setUsername(res['username'] ?? "");
      //await UserStorage.setfullname(res['fullname'] ?? "");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success...")));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SigninPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${res['Error']}")));
    }
    setbusy(false);
    return true;
  }
}
