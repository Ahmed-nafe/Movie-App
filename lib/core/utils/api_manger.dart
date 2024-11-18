import 'package:dio/dio.dart';

class ApiManger {
  final baseUrl = "https://api.themoviedb.org/3/movie/";
  final apiKey= "0403d62457b0709fa04b96044b5aa966";
  final Dio _dio;

  ApiManger(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint?api_key=$apiKey");
    return response.data;
  }
}
