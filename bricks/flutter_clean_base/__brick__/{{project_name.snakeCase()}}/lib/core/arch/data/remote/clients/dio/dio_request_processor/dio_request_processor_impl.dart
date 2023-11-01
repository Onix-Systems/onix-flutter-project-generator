import 'dart:async';
import 'dart:io';

import 'package:{{project_name}}/core/extension/logger_extension.dart';
import 'package:{{project_name}}/core/arch/data/remote/base/http_status.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
import 'package:{{project_name}}/core/arch/data/remote/error/default_api_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:retry/retry.dart';

class DioRequestProcessorImpl implements DioRequestProcessor {
  /// Number of attempts to re-execute the request
  static const defaultMaxAttemptsCount = 2;

  /// Error codes that require re-execution of the request (without bad request)
  /// Basic list of error codes that require re-execution of the request
  static const defaultRetryStatusCodes = [
    HttpStatus.badGateway,
    HttpStatus.serviceUnavailable,
  ];

  @protected
  final Connectivity? connectivity;
  @protected
  final InternetConnectionChecker? internetConnectionChecker;
  final int maxAttemptsCount;
  @protected
  final bool useRetry;
  @protected
  final List<int> retryStatusCodes;
  final _errorProcessor = DioErrorProcessor();

  DioRequestProcessorImpl({
    this.connectivity,
    this.internetConnectionChecker,
    this.useRetry = false,
    this.maxAttemptsCount = defaultMaxAttemptsCount,
    this.retryStatusCodes = defaultRetryStatusCodes,
  });

  @override
  Future<DataResponse<R>> processRequest<T, R>({
    required OnRequest<T> onRequest,
    required OnResponse<R> onResponse,
    bool checkNetworkConnection = true,
    OnCustomError? onCustomError,
  }) async {
    if (connectivity != null && internetConnectionChecker != null) {
      final resultConnectivity =
          await connectivity?.checkConnectivity() ?? false;
      final hasConnection =
          await internetConnectionChecker?.hasConnection ?? false;

      if (checkNetworkConnection &&
          (resultConnectivity == ConnectivityResult.none || !hasConnection)) {
        return const DataResponse.notConnected();
      }
    }

    try {
      final response = await _call(onRequest);
      return DataResponse.success(onResponse(response as Response<dynamic>));
    } on DioException catch (e, trace) {
      logger.crash(reason: 'onDioError', error: e, stackTrace: trace);
      return _errorProcessor.processError(
        e,
        onCustomError: onCustomError,
      );
    } catch (e, trace) {
      logger.crash(reason: 'onDioCommonError', error: e, stackTrace: trace);
      return DataResponse.undefinedError(e);
    }
  }

  Future<T> _call<T>(OnRequest<T> request) async {
    if (useRetry) {
      return retry(
        request,
        maxAttempts: maxAttemptsCount,
        retryIf: (exception) => _retryPolicy(
          exception: exception,
          retryStatusCodes: retryStatusCodes,
        ),
      );
    } else {
      return request();
    }
  }

  FutureOr<bool> _retryPolicy({
    required Exception exception,
    required List<int> retryStatusCodes,
  }) {
    if (exception is! DioException) return false;
    if (exception.type == DioExceptionType.cancel) return false;
    final response = exception.response;
    if (response == null) {
      return true;
    }
    if (exception is SocketException || exception is TimeoutException) {
      return true;
    }
    return retryStatusCodes.contains(response.statusCode);
  }
}
