import 'package:dio/dio.dart';

class ApiManger {
  // final apiKey = "0403d62457b0709fa04b96044b5aa966";
  final Dio _dio;

  ApiManger(
    this._dio,
  );

  Future<Map<String, dynamic>> get({String baseUrl = "https://api.themoviedb.org/3/movie/",
      required String endPoint,
      String apiKey = "?api_key=0403d62457b0709fa04b96044b5aa966"}) async {
    var response = await _dio.get("$baseUrl$endPoint$apiKey");
    return response.data;
  }
}
