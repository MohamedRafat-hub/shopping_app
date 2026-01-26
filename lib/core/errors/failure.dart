import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timed out. Please try again.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Sending data took too long. Please check your connection.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Server took too long to respond. Try again later.");

      case DioExceptionType.badCertificate:
        return ServerFailure("Untrusted certificate. Please try again later.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(dioException.response!);

      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection. Please check your network.");

      case DioExceptionType.unknown:
        return ServerFailure("Something went wrong. Please try again.");

      default:
        return ServerFailure('There was an Error , Please try again');
    }
  }

  factory ServerFailure.fromBadResponse(Response response) {
    if (response.statusCode != null) {
      switch (response.statusCode!) {
        case 400:
          return ServerFailure("Invalid request. Please check your data.");

        case 401:
          return ServerFailure("Unauthorized. Please log in first.");

        case 403:
          return ServerFailure("Access denied.");

        case 404:
          return ServerFailure("Resource not found.");

        case 500:
        case 501:
        case 502:
        case 503:
          return ServerFailure("Server error. Please try again later.");

        default:
          return ServerFailure(
              "Server error: ${response.statusCode}. Please try again.");
      }
    } else {
      return ServerFailure("Unexpected server error.");
    }
  }
}
