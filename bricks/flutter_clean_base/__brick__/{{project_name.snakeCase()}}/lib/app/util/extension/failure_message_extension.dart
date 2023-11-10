{{#handLocalization}}import 'package:{{project_name}}/app/localization/common_app_localization_ext.dart';{{/handLocalization}}
{{^handLocalization}}import 'package:{{project_name}}/app/localization/generated/l10n.dart';{{/handLocalization}}
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

String getFirebaseFailureMessage(FirebaseFailure failure) {
switch (failure.code) {
case 'invalid-email':
{{#handLocalization}}return str.firebaseInvalidEmail;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseInvalidEmail;{{/handLocalization}}
case 'user-disabled':
{{#handLocalization}}return str.firebaseAccountDisabled;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseAccountDisabled;{{/handLocalization}}
case 'user-not-found':
{{#handLocalization}}return str.firebaseUserNotRegistered;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseUserNotRegistered;{{/handLocalization}}
case 'wrong-password':
{{#handLocalization}}return str.firebasePasswordIncorrect;{{/handLocalization}}
{{^handLocalization}}return S.current.firebasePasswordIncorrect;{{/handLocalization}}
case 'email-already-in-use':
{{#handLocalization}}return str.firebaseAccountAlreadyRegistered;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseAccountAlreadyRegistered;{{/handLocalization}}
case 'operation-not-allowed':
{{#handLocalization}}return str.firebaseNotAllowed;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseNotAllowed;{{/handLocalization}}
case 'weak-password':
{{#handLocalization}}return str.firebaseWeakPassword;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseWeakPassword;{{/handLocalization}}
case 'profile-not-found':
{{#handLocalization}}return str.firebaseCantFetch;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseCantFetch;{{/handLocalization}}
case 'logout-failed':
{{#handLocalization}}return str.firebaseLogOutFailed;{{/handLocalization}}
{{^handLocalization}}return S.current.firebaseLogOutFailed;{{/handLocalization}}
default:
{{#handLocalization}}return str.apiFailureUndefined;{{/handLocalization}}
{{^handLocalization}}return S.current.apiFailureUndefined;{{/handLocalization}}
}
}
}
