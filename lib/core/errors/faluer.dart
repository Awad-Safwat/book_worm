import 'package:dio/dio.dart';

abstract class Faluer {
  final String massege;

  Faluer({required this.massege});
}

class ServerFalure extends Faluer {
  ServerFalure({required super.massege});

  factory ServerFalure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFalure(massege: 'connection Time Out wth the server');
      case DioExceptionType.sendTimeout:
        return ServerFalure(massege: ' Sending time out with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFalure(massege: ' receiving itme out the server');
      case DioExceptionType.badCertificate:
        return ServerFalure(massege: ' badcertificate error with the server');
      case DioExceptionType.badResponse:
        return ServerFalure.fromBadResponse(
            responseBody: e.response!.data,
            responseStatuseCode: e.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFalure(massege: 'the request is cancelled');
      case DioExceptionType.connectionError:
        return ServerFalure(massege: ' connection error with the server');
      case DioExceptionType.unknown:
        return ServerFalure(massege: 'oops there is an error with the server');
    }
  }

  factory ServerFalure.fromBadResponse(
      {required Response responseBody, required int? responseStatuseCode}) {
    if (responseStatuseCode! >= 500) {
      return ServerFalure(massege: 'there is an error from server side');
    } else if (responseStatuseCode >= 400) {
      return ServerFalure(
          massege: 'there is an error from the client side or page not found');
    } else {
      return ServerFalure(massege: 'There is an error calld $responseBody');
    }
  }
}
