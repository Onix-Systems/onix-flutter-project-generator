//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio/dio_const.dart';
{{#graphql}}import 'package:{{project_name}}/core/arch/data/remote/graph_ql/graph_ql_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/graph_ql/request_processor/graph_ql_request_processor.dart';
import 'package:{{project_name}}/data/source/remote/auth/auth_source.dart';
import 'package:{{project_name}}/data/source/remote/auth/auth_source_impl.dart';{{/graphql}}
{{#firebase_auth}}import 'package:firebase_auth/firebase_auth.dart';
import 'package:{{project_name}}/data/source/remote/firebase/auth/firebase_auth_source.dart';
import 'package:{{project_name}}/data/source/remote/firebase/auth/firebase_auth_source_impl.dart';{{/firebase_auth}}
import 'package:onix_flutter_core/onix_flutter_core.dart';
//{imports end}

void registerSources(GetIt getIt) {
    {{#firebase_auth}}
    getIt.registerLazySingleton<FirebaseAuthSource>(()=>
      FirebaseAuthSourceImpl(
        getIt.get<FirebaseAuth>(),
      ),
    );
  {{/firebase_auth}}
    {{#graphql}}
  getIt.registerLazySingleton<AuthSource>(()=>AuthSourceImpl(
      getIt.get<GraphQlClient>(),
      getIt.get<GraphQlRequestProcessor>(),
      ),
    );
  {{/graphql}}
    //{sources end}
}
