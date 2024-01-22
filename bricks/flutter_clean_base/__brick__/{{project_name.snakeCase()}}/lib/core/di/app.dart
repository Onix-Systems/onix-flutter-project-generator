//@formatter:off
import 'package:get_it/get_it.dart';
{{^isGoRouter}}import 'package:{{project_name}}/app/router/app_router.dart';
import 'package:{{project_name}}/app/router/router_logging_observer.dart';
import 'package:{{project_name}}/app/router/router_module.dart';{{/isGoRouter}}

void registerApp(GetIt getIt) {

  {{^isGoRouter}}final routerModule = _RouterModule();

  getIt
  ..registerSingleton<AppRouter>(
  routerModule.appRouter(),)
  ..registerFactory<RouterLoggingObserver>(
  () => routerModule.routerLoggingObserver(getIt.get<AppRouter>()),);{{/isGoRouter}}

}

{{^isGoRouter}}AppRouter appRouter() => GetIt.I<AppRouter>();

class _RouterModule extends RouterModule {}{{/isGoRouter}}
