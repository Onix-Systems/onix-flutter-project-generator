import 'package:{{project_name}}/core/arch/data/remote/base/http_status.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor_impl_test.dart';
import 'package:{{project_name}}/core/arch/data/remote/error/default_api_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/operation_status.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_request_processor_impl.mocks.dart';

class _MockedException implements Exception {
  const _MockedException();
}

const mockedException = _MockedException();

@GenerateNiceMocks([
  MockSpec<Connectivity>(),
  MockSpec<InternetConnectionChecker>(),
])
void main() {
  group('DataResponse error tests', () {
    late DioRequestProcessor requestProcessor;

    setUp(() {
      requestProcessor = DioRequestProcessorImpl();
    });

    test('DataResponse.undefinedError with non DioExceptionType case',
            () async {
          Future<void> mockedRequest() {
            throw mockedException;
          }

          final result =
          await requestProcessor.processRequest<void, OperationStatus>(
            onRequest: mockedRequest,
            onResponse: (_) => OperationStatus.success,
          );

          expect(
            result,
            const DataResponse<OperationStatus>.undefinedError(mockedException),
          );
        });

    test('DioExceptionType.connectionTimeout case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          type: DioExceptionType.connectionTimeout,
          message: '',
          requestOptions: RequestOptions(),
          error: '',
        );
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.notConnected(),
      );
    });

    test('DioExceptionType.sendTimeout case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          type: DioExceptionType.sendTimeout,
          message: '',
          requestOptions: RequestOptions(),
          error: '',
        );
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.notConnected(),
      );
    });

    test('HttpStatus.networkConnectTimeoutError case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.networkConnectTimeoutError,
          ),
          error: '',
        );
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.notConnected(),
      );
    });

    test('HttpStatus.unauthorized case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.unauthorized,
          ),
          error: '',
        );
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.unauthorized(),
      );
    });

    test('HttpStatus.tooManyRequests case', () async {
      Future<void> mockedRequest() {
        throw DioException(
          message: '',
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.tooManyRequests,
          ),
          error: '',
        );
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.tooManyRequests(),
      );
    });

    test('HttpStatus.badRequest case', () async {
      final exception = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.badRequest,
          data: {
            'name': 'name',
            'code': 'code',
          },
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw exception;
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        const DataResponse<OperationStatus>.apiError(
          DefaultApiError(
            name: 'name',
            code: 'code',
          ),
          HttpStatus.badRequest,
        ),
      );
    });

    test('Empty response body case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.badRequest,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        DataResponse<OperationStatus>.undefinedError(
          mockedException,
          HttpStatus.badRequest,
        ),
      );
    });

    test('Unexpected ResponseType case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(
            responseType: ResponseType.plain,
          ),
          statusCode: HttpStatus.badRequest,
          data: '',
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result,
        DataResponse<OperationStatus>.undefinedError(mockedException),
      );
    });

    test('HttpStatus.internalServerError case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.internalServerError,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        DataResponse<OperationStatus>.undefinedError(
          mockedException,
          HttpStatus.internalServerError,
        ),
      );
    });

    test('HttpStatus.serviceUnavailable case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.serviceUnavailable,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        DataResponse<OperationStatus>.undefinedError(
          mockedException,
          HttpStatus.serviceUnavailable,
        ),
      );
    });

    test('HttpStatus.forbidden case', () async {
      final mockedException = DioException(
        message: '',
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.forbidden,
        ),
        error: '',
      );

      Future<void> mockedRequest() {
        throw mockedException;
      }

      final result1 =
      await requestProcessor.processRequest<void, OperationStatus>(
        onRequest: mockedRequest,
        onResponse: (_) => OperationStatus.success,
      );

      expect(
        result1,
        DataResponse<OperationStatus>.undefinedError(
          mockedException,
          HttpStatus.forbidden,
        ),
      );
    });

    test('Request is cancelled', () async {
      final cancelToken = CancelToken();
      final fetchDataFuture = Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
        cancelToken: cancelToken,
      );
      cancelToken.cancel('Cancelled by user');
      try {
        await fetchDataFuture;
        fail('Expected DioError to be thrown');
      } catch (e) {
        expect(e, isA<DioException>());
        expect((e as DioException).type, DioExceptionType.cancel);
        expect(e.error, 'Cancelled by user');
      }
    });

    test('Request is cancelled and DataResponse.requestCanceled returned',
            () async {
          final cancelToken = CancelToken();
          final fetchDataFuture = Dio().get(
            'https://jsonplaceholder.typicode.com/posts',
            cancelToken: cancelToken,
          );
          cancelToken.cancel('Cancelled by user');

          final result = await requestProcessor.processRequest(
            onRequest: () => fetchDataFuture,
            onResponse: (e) {},
          );

          final failure = result.maybeWhen(
            canceledRequest: () => true,
            orElse: () => false,
          );

          expect(result.isError(), true);
          expect(failure, true);
        });
  });

  group('HttpStatus.kCodeSuccess tests', () {
    late DioRequestProcessor requestProcessor;

    setUp(() {
      requestProcessor = DioRequestProcessorImpl();
    });

    test('Success case', () async {
      const mockedData = 'test';

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.kCodeSuccess200,
            data: mockedData,
          ),
        );
      }

      final result =
      await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onResponse: (response) => response.data as String,
      );

      expect(result, const DataResponse<String>.success(mockedData));
    });
  });

  group('Connectivity && InternetConnectionChecker tests', () {
    late DioRequestProcessor requestProcessor;
    late Connectivity connectivity;
    late InternetConnectionChecker internetConnectionChecker;

    setUp(() {
      connectivity = MockConnectivity();
      internetConnectionChecker = MockInternetConnectionChecker();
      requestProcessor = DioRequestProcessorImpl(
        connectivity: connectivity,
        internetConnectionChecker: internetConnectionChecker,
      );
    });

    test('ConnectivityResult.none test', () async {
      const mockedData = 'test';

      when(connectivity.checkConnectivity()).thenAnswer(
            (_) async => [ConnectivityResult.none],
      );

      when(internetConnectionChecker.hasConnection).thenAnswer(
            (_) async => false,
      );

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.kCodeSuccess200,
            data: mockedData,
          ),
        );
      }

      final result =
      await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onResponse: (response) => response.data as String,
      );

      expect(result, const DataResponse<String>.notConnected());
    });

    test('ConnectivityResult.mobile && hasConnection test', () async {
      const mockedData = 'test';

      when(connectivity.checkConnectivity()).thenAnswer(
            (_) async => [ConnectivityResult.mobile],
      );

      when(internetConnectionChecker.hasConnection).thenAnswer(
            (_) async => true,
      );

      Future<Response<String>> mockedRequest() {
        return Future<Response<String>>.value(
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.kCodeSuccess200,
            data: mockedData,
          ),
        );
      }

      final result =
      await requestProcessor.processRequest<Response<String>, String>(
        onRequest: mockedRequest,
        onResponse: (response) => response.data as String,
      );

      expect(result, const DataResponse<String>.success(mockedData));
    });
  });
}
