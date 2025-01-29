import '/main.dart';
import '/core/extensions/extensions.dart';
import '/core/enumerations/response_messages.dart';

extension ResponseMessageExtension on ResponseMessage {
  String get localized {
    final localization = navigatorKey.currentContext?.l;

    switch (this) {
      case ResponseMessage.success:
        return localization?.success ?? 'Operation successful';

      case ResponseMessage.noContent:
        return localization?.no_content ?? 'No content available';

      case ResponseMessage.badRequest:
        return localization?.bad_request_error ?? 'Bad request';

      case ResponseMessage.unauthorized:
        return localization?.unauthorized_error ?? 'Unauthorized access';

      case ResponseMessage.forbidden:
        return localization?.forbidden_error ?? 'Access forbidden';

      case ResponseMessage.internalServerError:
        return localization?.internal_server_error ?? 'Internal server error';

      case ResponseMessage.notFound:
        return localization?.not_found_error ?? 'Resource not found';

      case ResponseMessage.connectTimeout:
        return localization?.timeout_error ?? 'Connection timed out';

      case ResponseMessage.cancel:
        return localization?.default_error ?? 'Request cancelled';

      case ResponseMessage.receiveTimeout:
        return localization?.timeout_error ?? 'Receive timeout';

      case ResponseMessage.sendTimeout:
        return localization?.timeout_error ?? 'Send timeout';

      case ResponseMessage.cacheError:
        return localization?.cache_error ?? 'Cache error';

      case ResponseMessage.noInternetConnection:
        return localization?.no_internet_error ?? 'No internet connection';

      case ResponseMessage.defaultError:
        return localization?.default_error ?? 'An error occurred';

      case ResponseMessage.connectionError:
        return localization?.default_error ?? 'Connection error';
    }
  }
}
