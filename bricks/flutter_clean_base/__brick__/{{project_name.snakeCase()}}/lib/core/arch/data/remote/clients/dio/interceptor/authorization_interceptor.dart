import 'package:{{project_name}}/core/arch/data/remote/base/base_api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/base/http_status.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger_impl.dart';
import 'package:{{project_name}}/core/di/repository.dart';
import 'package:{{project_name}}/core/di/services.dart';
import 'package:{{project_name}}/data/mapper/authentication/authentication_mapper.dart';
import 'package:{{project_name}}/data/model/remote/authentication/authentication_response.dart';
import 'package:{{project_name}}/data/model/remote/token/token_request.dart';
import 'package:{{project_name}}/domain/entity/authentication/authentication.dart';
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends QueuedInterceptorsWrapper {
  late Dio _refreshDio;

  //TODO change refresh path
  final _refreshPath = 'auth/refresh';

  AuthorizationInterceptor() {
    _refreshDio = Dio();
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = tokenRepository.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers.addAll(
        <String, String>{
          BaseApiClient.kAuthHeader: '${BaseApiClient.kAuthPrefix}$token',
        },
      );
    }
    logger.d('token: $token');
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final refreshToken = tokenRepository.refreshToken;
      final accessToken = tokenRepository.accessToken;
      try {
        if (refreshToken == null ||
            refreshToken.isEmpty ||
            accessToken == null ||
            accessToken.isEmpty) {
          await sessionService().closeSession();
          return handler.next(err);
        }
        final request = TokenRequest(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
        final authEntity = await _refresh(err, request);
        return await _resolveRequest(err, handler, authEntity);
      } on DioException {
        if (err.response?.statusCode == HttpStatus.unauthorized) {
          await sessionService().closeSession();
        }
      } catch (e, stackTrace) {
        logger.crash(error: e, stackTrace: stackTrace);
        await sessionService().closeSession();
      }
    }
    handler.next(err);
  }

  Future<Authentication> _refresh(
    DioException err,
    TokenRequest request,
  ) async {
    logger.d('_refresh start');
    final result = await _refreshDio.post(
      '${err.requestOptions.baseUrl}$_refreshPath',
      options: Options(
        headers: {
          BaseApiClient.kAcceptHeader: BaseApiClient.kJsonPrefix,
          BaseApiClient.kContentTypeHeader: BaseApiClient.kJsonPrefix,
          BaseApiClient.kAuthHeader:
              '${BaseApiClient.kAuthPrefix}${request.accessToken}',
        },
      ),
      data: request.toJson(),
    );
    final data = AuthenticationResponse.fromJson(
      result.data['data'],
    );
    logger.d('_refresh end');
    return AuthenticationMappers().mapRefreshEntity(data);
  }

  Future<void> _resolveRequest(
    DioException err,
    ErrorInterceptorHandler handler,
    Authentication authEntity,
  ) async {
    await tokenRepository.update(
      Authentication(
        accessToken: authEntity.accessToken,
        refreshToken: authEntity.refreshToken,
      ),
    );
    final requestOptions = err.response?.requestOptions;
    if (requestOptions != null) {
      requestOptions.headers[BaseApiClient.kAuthHeader] =
          '${BaseApiClient.kAuthPrefix}${authEntity.accessToken}';
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );
      final dioRefresh = Dio(
        BaseOptions(baseUrl: requestOptions.baseUrl),
      );
      final response = await dioRefresh.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      return handler.resolve(response);
    }
    logger.e('err: $err');
    return handler.next(err);
  }
}
