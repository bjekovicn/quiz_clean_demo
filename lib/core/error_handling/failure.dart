import 'dart:developer';

import 'package:dio/dio.dart';

import '/core/enumerations/response_codes.dart';
import '/core/extensions/response_statuses.dart';
import '/core/enumerations/response_statuses.dart';

class Failure {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.code, this.message);

  @override
  String toString() {
    return 'Failure(code: $code, message: "$message")';
  }

  static Failure handle(dynamic error) {
    if (error is DioException) {
      final failure = _handleDioError(error);
      log('-> [ERR HANDLED] $failure');
      return failure;
    }
    log('-> [ERR HANDLED] ${ResponseStatus.defaultError.failure}');
    return ResponseStatus.defaultError.failure;
  }

  static Failure _handleDioError(DioException error) {
    int? statusCode = error.response?.statusCode;
    statusCode = statusCode ?? ResponseCode.defaultError.value;

    switch (error.type) {
      //
      case DioExceptionType.connectionTimeout:
        return ResponseStatus.connectTimeout.failure;
      //
      case DioExceptionType.sendTimeout:
        return ResponseStatus.sendTimeout.failure;
      //
      case DioExceptionType.receiveTimeout:
        return ResponseStatus.receiveTimeout.failure;
      //
      case DioExceptionType.cancel:
        return ResponseStatus.cancel.failure;
      //
      case DioExceptionType.connectionError:
        return ResponseStatus.connectionError.failure;
      //
      case DioExceptionType.badResponse:
        switch (ResponseCode.fromStatusCode(statusCode)) {
          //
          case ResponseCode.unauthorized:
            return ResponseStatus.unauthorized.failure;
          //
          case ResponseCode.forbidden:
            return ResponseStatus.forbidden.failure;
          //
          case ResponseCode.notFound:
            return ResponseStatus.notFound.failure;
          //
          default:
            final data = error.response?.data;
            if (data is String) return Failure(statusCode, data);

            return ResponseStatus.defaultError.failure;
        }
      //
      default:
        if (statusCode == ResponseCode.noInternetConnection.code) {
          return ResponseStatus.noInternetConnection.failure;
        }
        return ResponseStatus.defaultError.failure;
    }
  }
}
