import 'dart:io';

import 'package:dio/dio.dart';

import 'package:onix_flutter_bricks/core/di/app.dart';

class BasicAppAuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('AppInterceptor onRequest');
    //TODO add accessToken
    // var accessToken = 'some token';
    // options.headers[kAuthHeader] = '$kAuthPrefix$accessToken';
    // options.headers[kAcceptHeader] = kJsonPrefix;
    // options.headers[kContentTypeHeader] = kJsonPrefix;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.d('AppInterceptor start: ${err.toString()}');
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      //TODO disposeSessionLocal
      return;
    }
    super.onError(err, handler);
  }
}
