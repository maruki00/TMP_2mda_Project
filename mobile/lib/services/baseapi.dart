import "dart:convert";
import 'package:dio/dio.dart';

class BaseApi {
  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    try {
      final Dio dio = Dio();
      final FormData formdata = FormData.fromMap(data);
      final Response<String> response = await dio.post(url, data: formdata);
      return await jsonDecode(response.data.toString()) as Map<String, dynamic>;
    } catch (e) {
      return {"Error": "connection Error"};
    }
  }

  static Future<List<dynamic>> post_list(
      String url, Map<String, dynamic> data) async {
    try {
      final Dio dio = Dio();
      final FormData formdata = FormData.fromMap(data);
      final Response<String> response = await dio.post(url, data: formdata);

      return await jsonDecode(response.data.toString()) as List<dynamic>;
    } catch (e) {
      return [
        {"Error": "connection Error"}
      ];
    }
  }
}
