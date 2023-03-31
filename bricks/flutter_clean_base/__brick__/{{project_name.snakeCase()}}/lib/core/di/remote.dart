import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/arch/data/remote/api_client.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio_client_module.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio_const.dart';
import 'package:{{project_name}}/core/arch/data/remote/dio_request_processor/dio_request_processor.dart';

void registerRemote(GetIt getIt) {
  final dioClientModule = _DioClientModule();

  getIt
    ..registerLazySingleton<DioRequestProcessor>(
      dioClientModule.makeDioErrorHandler,
    )
    ..registerLazySingleton<ApiClient>(
      //TODO APP BASE URL we can change with with flavor: FlavorConfig.I.baseUrl;
      () => dioClientModule.makeApiClient(DioConst.jsonPlaceholderBaseUrl),
      instanceName: DioConst.jsonPlaceholderInstance,
    )
    ..registerLazySingleton<ApiClient>(
      () => dioClientModule.makeApiClient(DioConst.timeApiBaseUrl),
      instanceName: DioConst.timeApiInstance,
    ); //{remote end}
}

ApiClient apiClientJsonPlaceholder() =>
    GetIt.I.get<ApiClient>(instanceName: DioConst.jsonPlaceholderInstance);

class _DioClientModule extends DioClientModule {}
