import 'package:clean_arch_sample/core/arch/data/remote/error/default_api_error.dart';
import 'package:clean_arch_sample/core/arch/domain/entity/common/data_response.dart';
import 'package:clean_arch_sample/core/arch/domain/entity/failure/api_failure.dart';
import 'package:clean_arch_sample/core/arch/domain/entity/failure/canceled_request_failure.dart';
import 'package:clean_arch_sample/core/arch/domain/entity/failure/failure.dart';
import 'package:clean_arch_sample/core/arch/logger/app_logger_impl.dart';

class MapCommonServerError {
  static Failure getServerFailureDetails<T>(
    DataResponse<T> failure,
  ) {
    try {
      return failure.maybeWhen(
        undefinedError: (error, statusCode) => ApiFailure(
          ServerFailure.unknown,
          statusCode: statusCode,
          message: error.toString(),
        ),
        apiError: _getResponseError,
        notConnected: () => ApiFailure(ServerFailure.noNetwork),
        unauthorized: () => ApiFailure(ServerFailure.unAuthorized),
        tooManyRequests: () => ApiFailure(ServerFailure.tooManyRequests),
        canceledRequest: () => const CanceledRequestFailure(),
        orElse: () => ApiFailure(ServerFailure.unknown),
      );
    } catch (e, trace) {
      logger.crash(reason: 'Mapping Error Failed', error: e, stackTrace: trace);
      return ApiFailure(ServerFailure.exception, message: e.toString());
    }
  }

  static ApiFailure _getResponseError(customError, int? statusCode) {
    if (customError is DefaultApiError) {
      return ApiFailure(
        ServerFailure.response,
        message: customError.name,
        statusCode: statusCode,
      );
    }
    //TODO process other error types and provide results
    //TODO also add new error types to DataResponse if needed
    return ApiFailure(ServerFailure.response);
  }
}
