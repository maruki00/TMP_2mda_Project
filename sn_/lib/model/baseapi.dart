import "dart:convert" as conv;
import 'package:dio/dio.dart';

class BaseApi {
  static Future<List<Map<dynamic, dynamic>>> post(
      String url, Map<String, dynamic> data) async {
    final Dio dio = Dio();
    final Formdata = FormData.fromMap(data);
    final response = await dio.post(url, data: Formdata);
    return conv.jsonDecode(response.data) as List<Map<String, dynamic>>;
  }

  static Future<List<Map<dynamic, dynamic>>> get(
      String url, Map<String, dynamic> data) async {
    final Dio dio = Dio();
    final Formdata = FormData.fromMap(data);
    final response = await dio.post(url, data: Formdata);
    return conv.jsonDecode(response.data) as List<Map<String, dynamic>>;
  }
}
