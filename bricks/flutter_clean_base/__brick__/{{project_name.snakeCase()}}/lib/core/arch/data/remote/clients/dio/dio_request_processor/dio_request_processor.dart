import 'dart:async';
import 'package:{{project_name}}/core/arch/data/remote/error/dio_error_processor.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:dio/dio.dart';

///Custom function to provide request Future
typedef OnRequest<T> = Future<T> Function();

///Custom Function to provide response converter (Map to Object)
typedef OnResponse<T> = T Function(Response<dynamic> response);

abstract class DioRequestProcessor {
  ///Pass 2 required functions:
  ///onRequest - your request Future
  ///onResponse - your response converter, basically call fromJson inside
  ///checkNetworkConnection - set to false if you need get data from cache interceptor
  Future<DataResponse<R>> processRequest<T, R>({
    required OnRequest<T> onRequest,
    required OnResponse<R> onResponse,
    bool checkNetworkConnection = true,
    OnCustomError? onCustomError,
  });
}
