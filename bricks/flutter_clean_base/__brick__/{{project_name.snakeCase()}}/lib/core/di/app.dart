//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
{{^isGoRouter}}import 'package:{{project_name}}/core/router/app_router.dart';
import 'package:{{project_name}}/core/router/guard/init_guard.dart';
import 'package:{{project_name}}/core/router/router_logging_observer.dart';
import 'package:{{project_name}}/core/router/router_module.dart';
import 'package:{{project_name}}/domain/repository/startup_repository.dart';{{/isGoRouter}}

void registerApp(GetIt getIt) {
  getIt.registerSingleton<Logger>(Logger());

  {{^isGoRouter}}final routerModule = _RouterModule();

  getIt
  ..registerSingleton<InitGuard>(
  routerModule.initGuard(getIt.get<StartupRepository>()),)
  ..registerSingleton<AppRouter>(
  routerModule.appRouter(getIt.get<InitGuard>()),)
  ..registerFactory<RouterLoggingObserver>(
  () => routerModule.routerLoggingObserver(getIt.get<AppRouter>()),);{{/isGoRouter}}

}

Logger get logger => GetIt.I<Logger>();

{{^isGoRouter}}AppRouter appRouter() => GetIt.I<AppRouter>();

class _RouterModule extends RouterModule {}{{/isGoRouter}}
