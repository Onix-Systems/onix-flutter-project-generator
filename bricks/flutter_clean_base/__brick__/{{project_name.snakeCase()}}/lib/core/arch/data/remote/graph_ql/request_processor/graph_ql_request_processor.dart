import 'dart:async';

import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/core/arch/data/remote/graph_ql/graph_ql_client.dart';

///Custom function to provide request Future
typedef OnRequest<T> = Future<T> Function();

///Custom Function to provide response converter (Map to Object)
typedef OnResponse<T> = T Function(Map<String, dynamic> response);

typedef OnSuccess<T> = List<String?>? Function(T data);

//ignore: one_member_abstracts
abstract class GraphQlRequestProcessor {
  Future<DataResponse<R>> processMutationRequest<T, R>({
    required GraphQlClient client,
    required String mutation,
    required OnResponse<R> onResponse,
    OnSuccess<R>? onSuccess,
    Map<String, dynamic>? variables,
    bool checkNetworkConnection = true,
  });

  Future<DataResponse<R>> processQueryRequest<T, R>({
    required GraphQlClient client,
    required String query,
    required OnResponse<R> onResponse,
    OnSuccess<R>? onSuccess,
    Map<String, dynamic>? variables,
    bool checkNetworkConnection = true,
  });
}
