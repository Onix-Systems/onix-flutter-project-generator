import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';

@freezed
sealed class DataResponse<T> with _$DataResponse {
  T get data => (this as _DataResponseSuccess).data;

  const DataResponse._();

  const factory DataResponse.success(T data) = _DataResponseSuccess;

  const factory DataResponse.undefinedError(Object? errorObject, [
    int? statusCode,
  ]) = _UndefinedError;

  const factory DataResponse.apiError(error, [int? statusCode]) = _ApiError;

  const factory DataResponse.notConnected() = _NoInternetConnection;

  const factory DataResponse.unauthorized() = _Unauthorized;

  const factory DataResponse.tooManyRequests() = _TooManyRequests;

  const factory DataResponse.canceledRequest() = _CanceledRequest;

  {{#firebase_auth}}const factory DataResponse.firebaseError(
      String code) = _FirebaseError;{{/firebase_auth}}

  bool isSuccess() => this is _DataResponseSuccess;

  bool isError() => this is! _DataResponseSuccess;
}
