import '/core/error_handling/failure.dart';
import '/core/enumerations/response_codes.dart';
import '/core/extensions/response_messages.dart';
import '/core/enumerations/response_statuses.dart';
import '/core/enumerations/response_messages.dart';

extension ResponseStatusExtension on ResponseStatus {
  Failure get failure {
    switch (this) {
      case ResponseStatus.success:
        return Failure(
          ResponseCode.success.code,
          ResponseMessage.success.localized,
        );
      case ResponseStatus.noContent:
        return Failure(
          ResponseCode.noContent.code,
          ResponseMessage.noContent.localized,
        );
      case ResponseStatus.badRequest:
        return Failure(
          ResponseCode.badRequest.code,
          ResponseMessage.badRequest.localized,
        );
      case ResponseStatus.forbidden:
        return Failure(
          ResponseCode.forbidden.code,
          ResponseMessage.forbidden.localized,
        );
      case ResponseStatus.unauthorized:
        return Failure(
          ResponseCode.unauthorized.code,
          ResponseMessage.unauthorized.localized,
        );
      case ResponseStatus.notFound:
        return Failure(
          ResponseCode.notFound.code,
          ResponseMessage.notFound.localized,
        );
      case ResponseStatus.internetServerError:
        return Failure(
          ResponseCode.internalServerError.code,
          ResponseMessage.internalServerError.localized,
        );
      case ResponseStatus.connectTimeout:
        return Failure(
          ResponseCode.connectTimeout.code,
          ResponseMessage.connectTimeout.localized,
        );
      case ResponseStatus.connectionError:
        return Failure(
          ResponseCode.connectionError.code,
          ResponseMessage.connectionError.localized,
        );
      case ResponseStatus.cancel:
        return Failure(
          ResponseCode.cancel.code,
          ResponseMessage.cancel.localized,
        );
      case ResponseStatus.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout.code,
          ResponseMessage.receiveTimeout.localized,
        );
      case ResponseStatus.sendTimeout:
        return Failure(
          ResponseCode.sendTimeout.code,
          ResponseMessage.sendTimeout.localized,
        );
      case ResponseStatus.cacheError:
        return Failure(
          ResponseCode.cacheError.code,
          ResponseMessage.cacheError.localized,
        );
      case ResponseStatus.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection.code,
          ResponseMessage.noInternetConnection.localized,
        );
      case ResponseStatus.defaultError:
        return Failure(
          ResponseCode.defaultError.code,
          ResponseMessage.defaultError.localized,
        );
    }
  }
}
