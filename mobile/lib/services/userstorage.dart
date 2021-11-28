import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  //static final SharedPre _data = const FlutterSecureStorage();
  static SharedPreferences? _data;

  static const idkey = "id";
  static const usernamekey = "username";
  static const fullnamekey = "fullname";
  static const tokenkey = "accesstoken";
  static const iamgekey = "imagepath";

  static Future setid(String id) async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(idkey, id);
  }

  static Future setUsername(String username) async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(usernamekey, username);
  }

  static Future setfullname(String fullname) async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(fullnamekey, fullname);
  }

  static Future setToken(String token) async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(tokenkey, token);
  }

  static Future setImagepath(String Imgpath) async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(iamgekey, Imgpath);
  }

  static Future<String?> getId() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.getString(idkey);
  }

  static Future<String?> getUsername() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.getString(usernamekey);
  }

  static Future<String?> getFullname() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.getString(fullnamekey);
  }

  static Future<String?> getToken() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.getString(tokenkey);
  }

  static Future<String?> getImgpath() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.getString(iamgekey);
  }

  static Future logout() async {
    _data = await SharedPreferences.getInstance();
    return await _data!.setString(idkey, "") &&
        await _data!.setString(usernamekey, "") &&
        await _data!.setString(fullnamekey, "") &&
        await _data!.setString(tokenkey, "") &&
        await _data!.setString(iamgekey, "");
  }
}
