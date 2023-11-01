import 'package:{{project_name}}/core/arch/data/remote/base/http_status.dart';
import 'package:{{project_name}}/core/arch/data/remote/error/default_api_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:dio/dio.dart';

typedef OnCustomError<T> = dynamic Function(int code, dynamic response);

class DioErrorProcessor {
  /// Error codes that require re-execution of the request (without bad request)
  static const retryStatusCodesWithoutBadReq = [
    HttpStatus.unprocessedEntity,
    HttpStatus.forbidden,
    HttpStatus.unauthorized,
    HttpStatus.unsupportedMediaType,
    HttpStatus.badRequest,
  ];

  /// List of error codes indicating unknown server behavior -
  /// [CommonResponseError.undefinedError]
  static const defaultUndefinedErrorCodes = [
    HttpStatus.internalServerError,
    HttpStatus.notImplemented,
    HttpStatus.badGateway,
    HttpStatus.serviceUnavailable,
    HttpStatus.notFound,
  ];

  final List<int> undefinedErrorCodes;

  DioErrorProcessor({
    this.undefinedErrorCodes = defaultUndefinedErrorCodes,
  });

  DataResponse<T> processError<T>(
    DioException e, {
    OnCustomError? onCustomError,
  }) {
    final responseData = e.response?.data;
    final statusCode = e.response?.statusCode ?? -1;
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        statusCode == HttpStatus.networkConnectTimeoutError) {
      return const DataResponse.notConnected();
    }
    if (statusCode == HttpStatus.unauthorized) {
      return const DataResponse.unauthorized();
    }
    if (statusCode == HttpStatus.tooManyRequests) {
      return const DataResponse.tooManyRequests();
    }
    if (undefinedErrorCodes.contains(statusCode)) {
      return DataResponse.undefinedError(e);
    }
    if (retryStatusCodesWithoutBadReq.contains(statusCode)) {
      return DataResponse.undefinedError(e);
    }
    final errorHandler = onCustomError;
    if (errorHandler != null) {
      final apiError = errorHandler(statusCode, responseData);
      if (apiError != null) {
        return DataResponse.apiError(apiError);
      }
    }
    return _default<T>(e);
  }

  DataResponse<T> _default<T>(DioException e) {
    final response = e.response?.data;
    if (response != null) {
      // TODO: process default error there
      // TODO: customize DefaultApiError to your purposes
      // TODO: also add new error types to DataResponse if needed

      final error = DefaultApiError.fromJson(response);
      return DataResponse.apiError(error);
    }
    return DataResponse.undefinedError(e);
  }
}
