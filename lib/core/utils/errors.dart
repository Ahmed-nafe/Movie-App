import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timed out With ApiServes");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout out With ApiServes");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout out With ApiServes");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate error with API servers");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServes was Cancel ");
      case DioExceptionType.connectionError:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure("Network Error With ApiServes");
        } else {
          return ServerFailure("Connection error with API servers");
        }
      case DioExceptionType.unknown:
        return ServerFailure(
            "Unknown error occurred while communicating with API servers");
      default:
        return ServerFailure(
            "Oops There Was an Error , please Try again later");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request not found, please try again later");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error (500) with API servers");
    } else {
      return ServerFailure("Oops There Was an Error , please Try again later");
    }
  }
}
