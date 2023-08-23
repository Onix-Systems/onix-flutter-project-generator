import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:onix_flutter_bricks/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/dio_request_processor/dio_request_processor_impl.dart';
import 'api_client.dart';

abstract class DioClientModule {
  ApiClient makeApiClient(String baseUrl) => ApiClient(
        options: BaseOptions(
          baseUrl: baseUrl,
          connectTimeout:
              const Duration(milliseconds: ApiClient.defaultConnectTimeout),
          receiveTimeout:
              const Duration(milliseconds: ApiClient.defaultReceiveTimeout),
          headers: {
            BaseApiClient.kAcceptHeader: BaseApiClient.kJsonPrefix,
            BaseApiClient.kContentTypeHeader: BaseApiClient.kJsonPrefix,
          },
        ),
      );

  DioRequestProcessor makeDioErrorHandler() => kIsWeb
      ? DioRequestProcessorImpl()
      : DioRequestProcessorImpl(
          connectivity: Connectivity(),
          internetConnectionChecker: InternetConnectionChecker(),
        );
}
