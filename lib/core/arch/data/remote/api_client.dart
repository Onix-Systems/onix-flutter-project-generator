import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:onix_flutter_bricks/core/arch/data/remote/base/base_api_client.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/interceptor/basic_app_auth_interceptor.dart';
import 'package:onix_flutter_bricks/core/arch/data/remote/interceptor/cache_interceptor.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';

class ApiClient implements BaseApiClient {
  static const defaultConnectTimeout = 30000;
  static const defaultReceiveTimeout = 30000;

  ApiClient({required BaseOptions options}) {
    client = Dio(options);
    customInterceptor = BasicAppAuthInterceptor();
    cacheInterceptor = CacheInterceptor(client);
    client.transformer = BackgroundTransformer();
    attachLoggerInterceptor();
  }

  late BasicAppAuthInterceptor customInterceptor;
  late CacheInterceptor cacheInterceptor;

  CacheOptions? get cacheOptions => cacheInterceptor.cacheOptions;

  @override
  late Dio client;

  @override
  void attachLoggerInterceptor() {
    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
        ),
      );
    }
  }

  @override
  void attachInterceptors() {
    client.interceptors.remove(customInterceptor);
    client.interceptors.add(customInterceptor);
    _attachCacheInterceptor();
  }

  @override
  void deAttachInterceptors() {
    client.interceptors.remove(customInterceptor);
    clearCache();
  }

  void attachCharlesProxy(String? charlesIp, String? port) {
    if (charlesIp == null || port == null) return;

    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => "PROXY $charlesIp:$port";
      //ignore: cascade_invocations
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    logger.d('CharlesProxyEnabled');
  }

  CachePolicy getCachePolicy(bool forceRefresh) =>
      cacheInterceptor.getCachePolicy(forceRefresh: forceRefresh);

  Future<void> clearCache() async {
    logger.d('clearCache');
    await cacheInterceptor.clearCache();
    _attachCacheInterceptor();
  }

  Future<void> _attachCacheInterceptor() async {
    logger.d('attachCacheInterceptor');
    cacheInterceptor.attachCacheInterceptor();
  }
}
