import 'package:dio/dio.dart';

class Failure {
  final String errMessage;
  Failure(this.errMessage);
}
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError){
    switch(dioError.type){

      case DioErrorType.connectionTimeout:
       return ServerFailure('Connection Time Out ');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Time Out ');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Time Out ');

      case DioErrorType.badCertificate:
        return ServerFailure('Bad Certificate With  Api ');
      case DioErrorType.badResponse:
       return ServerFailure.fromResponseError(dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFailure('Your Request Is Cancelled');

      case DioErrorType.connectionError:
        return ServerFailure('There is No Connection with Internet ');

      case DioErrorType.unknown:
        return ServerFailure('Oops unExpected Error ');
      default:
        return ServerFailure('Oops unExpected Error ');

    }
  }
  factory ServerFailure.fromResponseError(int statusCode,dynamic response){
    if(statusCode ==400||statusCode ==401||statusCode==403){
      return ServerFailure(response['error']['message']);
    }
 else if(statusCode==404){
      return ServerFailure('Your Request Is Not Found , try again');
    }
    else if(statusCode==500){
      return ServerFailure('there is a Problem In Server , try again');
    }
    else {
      return ServerFailure('Oops unExpected Error ');
    }
  }
}


