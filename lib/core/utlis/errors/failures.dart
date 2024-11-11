// import 'package:dio/dio.dart';

// abstract class Failure {
//   final String errorMessage;
//   const Failure(this.errorMessage);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.errorMessage);

//   factory ServerFailure.fromMessage(DioException dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.cancel:
//         return ServerFailure('Request to API server was cancelled');
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure('Connection timeout with API server');
//       case DioExceptionType.receiveTimeout:
//         return ServerFailure('Receive timeout in connection with API server');
//       case DioExceptionType.unknown:  
//         if (dioError.message!.contains('SocketException')) {
//           return ServerFailure('No internet connection');
//         }
//         return ServerFailure('Unexpected error occurred please try again');
//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
//       case DioExceptionType.sendTimeout:
//         return ServerFailure('Send timeout in connection with API server');
//       case DioExceptionType.badCertificate:
//         return ServerFailure('Bad certificate received from API server');
//       default:
//         return ServerFailure('Unexpected error occurred');
//     }
//   }

//   factory ServerFailure.fromResponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure('Not found');
//     } else if (statusCode == 500) {
//       return ServerFailure('Internal server error');
//     } else {
//       return ServerFailure('Something went wrong');
//     }
//   }
// }
 

 import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioErrorType.unknown:
        // if (dioError.message.contains('SocketException'))
         {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}