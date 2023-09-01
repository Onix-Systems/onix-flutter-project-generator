import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:graphql/client.dart';

class GraphQlRequestProcessorImpl implements GraphQlRequestProcessor {
  @override
  Future<DataResponse<R>> processMutationRequest<T, R>({
    required GraphQlClient client,
    required String mutation,
    required OnResponse<R> onResponse,
    OnSuccess<R>? onSuccess,
    Map<String, dynamic>? variables,
    bool checkNetworkConnection = true,
  }) async {
    final options = MutationOptions<R>(
      document: gql(mutation),
      variables: variables ?? {},
      onCompleted: DataResponse.success,
      onError: _processException,
    );

    final result = await client.client.mutate(options);

    if (result.hasException) {
      logger.i('Mutation_exception: ${result.exception}');
      return _processException(result.exception);
    } else {
      final response = onResponse(result.data ?? {});
      if (onSuccess != null) {
        final customerErrors = onSuccess(response);
        if (customerErrors?.isNotEmpty ?? false) {
          final error = customerErrors?.join('\n');
          return DataResponse.apiError(error);
        }
      }

      return DataResponse.success(response);
    }
  }

  @override
  Future<DataResponse<R>> processQueryRequest<T, R>({
    required GraphQlClient client,
    required String query,
    required OnResponse<R> onResponse,
    OnSuccess<R>? onSuccess,
    Map<String, dynamic>? variables,
    bool checkNetworkConnection = true,
  }) async {
    final options = QueryOptions<R>(
      document: gql(query),
      variables: variables ?? {},
      parserFn: (data) => onResponse(data),
      onError: _processException,
      fetchPolicy: FetchPolicy.noCache,
    );

    final result = await client.client.query(options);
    if (result.hasException) {
      logger.i('Mutation_exception: ${result.exception}');
      return _processException(result.exception);
    } else {
      final response = onResponse(result.data ?? {});
      if (onSuccess != null) {
        final customerErrors = onSuccess(response);
        if (customerErrors?.isNotEmpty ?? false) {
          final error = customerErrors?.join('\n');
          return DataResponse.apiError(error);
        }
      }
      return DataResponse.success(response);
    }
  }

  Future<DataResponse<T>> _processException<T>(OperationException? e) async {
    if (e == null) {
      return DataResponse.undefinedError(e);
    }

    if (e.graphqlErrors.isNotEmpty) {
      return DataResponse.apiError(e.graphqlErrors.first);
    }

    if (e.linkException is ServerException) {
      final hasErrors = (e.linkException as ServerException)
              .parsedResponse
              ?.errors
              ?.isNotEmpty ??
          false;
      if (!hasErrors) {
        return const DataResponse.notConnected();
      }
      return const DataResponse.notConnected();
    }

    return DataResponse.undefinedError(e);
  }
}
