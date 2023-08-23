//@formatter:off

import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/error/default_api_error.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/common/data_response.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/api_failure.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/failure.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/extension/logger_extension.dart';

class MapCommonServerError {
  static String getApiFailureMessage(ApiFailure failure) {
    switch (failure.failure) {
      case ServerFailure.noNetwork:
        return S.current.apiFailureNoNetwork;
      case ServerFailure.exception:
        return S.current.apiFailureUndefined;
      case ServerFailure.unAuthorized:
        return S.current.apiFailureUnAuthorized;
      case ServerFailure.tooManyRequests:
        return S.current.apiFailureTooManyRequests;
      case ServerFailure.response:
        return failure.message;
      case ServerFailure.unknown:
        return S.current.apiFailureUndefined;
    }
  }

  static Failure getServerFailureDetails<T>(DataResponse<T> failure) {
    try {
      return failure.maybeWhen(
        undefinedError: (error) => ApiFailure(
          ServerFailure.unknown,
          message: error.toString(),
        ),
        apiError: _getResponseError,
        notConnected: () => ApiFailure(ServerFailure.noNetwork),
        unauthorized: () => ApiFailure(ServerFailure.unAuthorized),
        tooManyRequests: () => ApiFailure(ServerFailure.tooManyRequests),
        orElse: () => ApiFailure(ServerFailure.unknown),
      );
    } catch (e, trace) {
      logger.crash(reason: 'Mapping Error Failed', error: e, stackTrace: trace);
      return ApiFailure(ServerFailure.exception, message: e.toString());
    }
  }

  static ApiFailure _getResponseError(dynamic customError) {
    if (customError is DefaultApiError) {
      return ApiFailure(
        ServerFailure.response,
        message: customError.name,
      );
    }
    //TODO process other error types and provide results
    //TODO also add new error types to DataResponse if needed
    return ApiFailure(
      ServerFailure.response,
      message: '',
    );
  }
}
