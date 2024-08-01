import 'package:{{project_name}}/core/arch/data/remote/base/http_status.dart';
import 'package:{{project_name}}/core/arch/data/remote/error/default_api_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:dio/dio.dart';

typedef OnCustomError<T> = dynamic Function(
    int code,
    Map<String, dynamic> response,
    );

class DioErrorProcessor {
  const DioErrorProcessor();

  DataResponse<T> processError<T>(
      DioException e, {
        OnCustomError? onCustomError,
      }) {
    final responseData = e.response?.data;
    final statusCode = e.response?.statusCode ?? -1;
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        statusCode == HttpStatus.networkConnectTimeoutError) {
      return DataResponse<T>.notConnected();
    }
    if (statusCode == HttpStatus.unauthorized) {
      return DataResponse<T>.unauthorized();
    }
    if (statusCode == HttpStatus.tooManyRequests) {
      return DataResponse<T>.tooManyRequests();
    }

    final errorHandler = onCustomError;

    if (errorHandler != null) {
      final apiError = errorHandler(statusCode, responseData);
      if (apiError != null) {
        return DataResponse<T>.apiError(apiError, statusCode);
      }
    }
    return _default<T>(e);
  }

  DataResponse<T> _default<T>(DioException e) {
    try {
      final response = e.response?.data;
      final statusCode = e.response?.statusCode ?? -1;
      if (response != null) {
        // TODO: process default error there
        // TODO: customize DefaultApiError to your purposes
        // TODO: also add new error types to DataResponse if needed

        final error = DefaultApiError.fromJson(response);
        return DataResponse<T>.apiError(error, statusCode);
      }
      return DataResponse<T>.undefinedError(e, statusCode);
    } catch (_) {
      // This is in case the response is not received
      // in the form of ResponseType.json
      return DataResponse<T>.undefinedError(e);
    }
  }
}
