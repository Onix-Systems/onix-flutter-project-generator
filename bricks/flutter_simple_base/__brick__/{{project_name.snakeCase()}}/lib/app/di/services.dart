//@formatter:off
import 'package:{{project_name}}/app/service/app_service.dart';
import 'package:{{project_name}}/app/service/session_service/session_service.dart';
{{#firebase_auth}}import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';{{/firebase_auth}}
import 'package:get_it/get_it.dart';

void registerCoreServices(GetIt getIt) {
  getIt
    ..registerSingleton<SessionService>(SessionService())
    ..registerSingleton<AppService>(AppService());
}

void registerAppServices(GetIt getIt) {
  {{#firebase_auth}}getIt.registerSingleton<FirebaseSessionService>(
    FirebaseSessionService(
      getIt.get<FirebaseAuthRepository>(),
    ),
  );{{/firebase_auth}}
}

SessionService sessionService() => GetIt.I.get<SessionService>();

AppService environmentService() => GetIt.I.get<AppService>();

{{#firebase_auth}}FirebaseSessionService firebaseSessionService() =>
    GetIt.I.get<FirebaseSessionService>();{{/firebase_auth}}
