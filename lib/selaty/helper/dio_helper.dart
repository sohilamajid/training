import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_url.dart';

class DioHelper {
  static Dio? dio;
  // static String token = "";

  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      if (token != null && token.isNotEmpty) "Authorization": "Bearer $token",
    };

    dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      headers: headers,
    ));
  }

  static Future<void> refreshTokenHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    dio?.options.headers["Authorization"] = "Bearer $token";
  }

  ///Get Data
  Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio!.get(path, data: body);
    return response;
  }

  ///Post Data
  Future<Response> postData({
    required String path,
    // Map<String, dynamic>? body,
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final response =
    await dio!.post(path, data: body, queryParameters: queryParams);

    return response;
  }
}
