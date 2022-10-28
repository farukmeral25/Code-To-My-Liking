import 'package:dio/dio.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = 'https://newsapi.org/';
    dio.options.queryParameters = {
      'apiKey': 'aecf1d77da4342518f249c8e7c692100',
    };
    dio.options.headers = {
      'Accept': 'application/json',
    };
    dio.options.contentType = 'application/json';

    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(LogInterceptor(requestBody: true, error: true, responseBody: true));
    return dio;
  }
}
