//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_client_module.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_const.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/dio/dio_request_processor/dio_request_processor.dart';
{{#graphql}}import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/core/arch/data/remote/clients/graph_ql/request_processor/graph_ql_request_processor_impl.dart';{{/graphql}}
{{#firebase_auth}}import 'package:firebase_auth/firebase_auth.dart';{{/firebase_auth}}
void registerRemote(GetIt getIt) {
  final dioClientModule = _DioClientModule();

  getIt.registerLazySingleton<DioRequestProcessor>(
        dioClientModule.makeDioErrorHandler,
    );{{#firebase_auth}}
  getIt.registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instance,
  );{{/firebase_auth}}

  {{#graphql}}getIt.registerLazySingleton<GraphQlRequestProcessor>(
      GraphQlRequestProcessorImpl.new,
  );
  getIt.registerLazySingleton<GraphQlClient>(
      GraphQlClient.new,
  );{{/graphql}}
  //{remote end}
}

{{#graphql}}GraphQlClient graphQlApiClient() => GetIt.I.get<GraphQlClient>();{{/graphql}}
class _DioClientModule extends DioClientModule {}
