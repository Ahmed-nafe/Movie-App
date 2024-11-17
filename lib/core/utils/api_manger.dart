import 'package:dio/dio.dart';

class ApiManger {
  final baseUrl = "https://api.themoviedb.org/3/movie/";
  final Dio _dio;

  ApiManger(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
