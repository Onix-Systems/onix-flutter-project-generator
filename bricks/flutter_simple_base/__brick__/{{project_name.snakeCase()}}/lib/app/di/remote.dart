//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/data/dio_const.dart';
{{#graphql}}import 'package:{{project_name}}/core/arch/data/remote/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor_impl.dart';{{/graphql}}
{{#firebase_auth}}import 'package:firebase_auth/firebase_auth.dart';{{/firebase_auth}}
import 'package:onix_flutter_core/onix_flutter_core.dart';
void registerRemote(GetIt getIt) {
  final dioClientModule = _DioClientModule();

  getIt
    ..registerLazySingleton<DioRequestProcessor>(
      dioClientModule.makeDioRequestProcessor,
    )..registerLazySingleton<ApiClient>(
     () => dioClientModule.makeApiClient(
       ApiClientParams(
        baseUrl: DioConst.defaultBaseUrl,
       ),
      ),
      instanceName: DioConst.defaultApiClientName,
    );
  {{#firebase_auth}}
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
