import 'package:dio/dio.dart';

abstract class Failure {
  final String errroMessage;

  const Failure(this.errroMessage);
}

class Serverfailure extends Failure {
  Serverfailure(super.errroMessage);
  factory Serverfailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure('Connection time out with api server');
      case DioExceptionType.sendTimeout:
        return Serverfailure('Send time out with api server');

      case DioExceptionType.receiveTimeout:
        return Serverfailure('Receive time out with api server');
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return Serverfailure('Request to  api server Was cancelled');
      case DioExceptionType.connectionError:
        return Serverfailure('Connection error , please try again');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SoketExcpetion')) {
          return Serverfailure('No internet conection');
        }
        return Serverfailure('Un expected error ,please try latrr');
      default:
        return Serverfailure('Oops there was an error ,please try again');
    }
  }
 factory Serverfailure.fromResponse(int statusCode, dynamic response) {
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    return Serverfailure(response['message'] ?? 'Unauthorized access.');
  } else if (statusCode == 404) {
    return Serverfailure('Your request was not found, please try later.');
  } else if (statusCode == 500) {
    return Serverfailure('Internal Server Error, please try later.');
  } else {
    return Serverfailure('Oops! There was an error, please try again.');
  }
}

}
