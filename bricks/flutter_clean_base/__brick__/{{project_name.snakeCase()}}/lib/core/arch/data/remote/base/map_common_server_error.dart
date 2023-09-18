//@formatter:off
{{#handLocalization}}import 'package:flutter/widgets.dart';
import 'package:{{project_name}}/core/app/localization/common_app_localization_ext.dart';{{/handLocalization}}
{{^handLocalization}}import 'package:{{project_name}}/core/app/localization/generated/l10n.dart';{{/handLocalization}}
import 'package:{{project_name}}/core/extension/logger_extension.dart';
import 'package:{{project_name}}/core/arch/data/remote/error/default_api_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/core/arch/domain/entity/failure/api_failure.dart';
import 'package:{{project_name}}/core/arch/domain/entity/failure/failure.dart';
import 'package:{{project_name}}/core/di/app.dart';

class MapCommonServerError {
static String getApiFailureMessage(ApiFailure failure{{#handLocalization}}, BuildContext context{{/handLocalization}}) {
  switch (failure.failure) {
    case ServerFailure.noNetwork:
      {{#handLocalization}}return context.str.apiFailureNoNetwork;{{/handLocalization}}
      {{^handLocalization}}return S.current.apiFailureNoNetwork;{{/handLocalization}}
    case ServerFailure.exception:
      {{#handLocalization}}return context.str.apiFailureUndefined;{{/handLocalization}}
      {{^handLocalization}}return S.current.apiFailureUndefined;{{/handLocalization}}
    case ServerFailure.unAuthorized:
      {{#handLocalization}}return context.str.apiFailureUnAuthorized;{{/handLocalization}}
      {{^handLocalization}}return S.current.apiFailureUnAuthorized;{{/handLocalization}}
    case ServerFailure.tooManyRequests:
      {{#handLocalization}}return context.str.apiFailureTooManyRequests;{{/handLocalization}}
      {{^handLocalization}}return S.current.apiFailureTooManyRequests;{{/handLocalization}}
    case ServerFailure.response:
      return failure.message;
    case ServerFailure.unknown:
      {{#handLocalization}}return context.str.apiFailureUndefined;{{/handLocalization}}
      {{^handLocalization}}return S.current.apiFailureUndefined;{{/handLocalization}}
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
  } catch (e,trace) {
    logger.crash(reason: 'Mapping Error Failed', error: e, stackTrace: trace);
    return ApiFailure(ServerFailure.exception, message: e.toString());
  }
}

static ApiFailure _getResponseError(customError) {
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
