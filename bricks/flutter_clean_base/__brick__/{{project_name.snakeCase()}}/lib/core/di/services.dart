import 'package:{{project_name}}/app/app_service.dart';
import 'package:{{project_name}}/app/service/session_service/session_service.dart';
import 'package:get_it/get_it.dart';

void registerServices(GetIt getIt) {
  getIt
    ..registerSingleton<SessionService>(SessionService())
    ..registerSingleton<AppService>(AppService());
}

SessionService sessionService() => GetIt.I.get<SessionService>();

AppService environmentService() => GetIt.I.get<AppService>();
