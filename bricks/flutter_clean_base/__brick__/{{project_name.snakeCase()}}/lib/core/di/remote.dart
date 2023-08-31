import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_client_module.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_const.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
{{#graphql}}import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor_impl.dart';{{/graphql}}

void registerRemote(GetIt getIt) {
  final dioClientModule = _DioClientModule();

  getIt..registerLazySingleton<DioRequestProcessor>(
    dioClientModule.makeDioErrorHandler,
  )..registerLazySingleton<ApiClient>(
        () => dioClientModule.makeApiClient(DioConst.timeApiBaseUrl),
    instanceName: DioConst.timeApiInstance,
  ){
    {
      #graphql
    }
  }..registerLazySingleton<GraphQlRequestProcessor>(
  GraphQlRequestProcessorImpl.new,
  )
  ..registerLazySingleton<GraphQlClient>(
  GraphQlClient.new,
  ){{/graphql}}; //{remote end}
}

ApiClient apiClientTime() =>
    GetIt.I.get<ApiClient>(instanceName: DioConst.timeApiInstance);

{{#graphql}}GraphQlClient graphQlApiClient() => GetIt.I.get<GraphQlClient>();
{{/graphql}}
class _DioClientModule extends DioClientModule {}
