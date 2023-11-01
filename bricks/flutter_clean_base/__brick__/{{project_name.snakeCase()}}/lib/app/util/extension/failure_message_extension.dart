import 'package:{{project_name}}/app/localization/common_app_localization_ext.dart';
import 'package:{{project_name}}/core/arch/domain/entity/failure/api_failure.dart';
import 'package:flutter/material.dart';

extension FailureMessageExtension on BuildContext {
  String getApiFailureMessage(ApiFailure failure) {
    switch (failure.failure) {
    case ServerFailure.noNetwork:
    {{#handLocalization}}return str.apiFailureNoNetwork;{{/handLocalization}}
    {{^handLocalization}}return S.current.apiFailureNoNetwork;{{/handLocalization}}
    case ServerFailure.exception:
    {{#handLocalization}}return str.apiFailureUndefined;{{/handLocalization}}
    {{^handLocalization}}return S.current.apiFailureUndefined;{{/handLocalization}}
    case ServerFailure.unAuthorized:
    {{#handLocalization}}return str.apiFailureUnAuthorized;{{/handLocalization}}
    {{^handLocalization}}return S.current.apiFailureUnAuthorized;{{/handLocalization}}
    case ServerFailure.tooManyRequests:
    {{#handLocalization}}return str.apiFailureTooManyRequests;{{/handLocalization}}
    {{^handLocalization}}return S.current.apiFailureTooManyRequests;{{/handLocalization}}
    case ServerFailure.response:
    return failure.message;
    case ServerFailure.unknown:
    {{#handLocalization}}return str.apiFailureUndefined;{{/handLocalization}}
    {{^handLocalization}}return S.current.apiFailureUndefined;{{/handLocalization}}
    }
  }
}
