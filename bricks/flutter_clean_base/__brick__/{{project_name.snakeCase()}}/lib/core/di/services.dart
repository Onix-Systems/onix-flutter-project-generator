import 'package:{{project_name}}/app/app_service.dart';
import 'package:{{project_name}}/app/service/session_service/session_service.dart';
import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';
import 'package:get_it/get_it.dart';

void registerCoreServices(GetIt getIt) {
  getIt
    ..registerSingleton<SessionService>(SessionService())
    ..registerSingleton<AppService>(AppService());
}

void registerAppServices(GetIt getIt) {
  getIt.registerSingleton<FirebaseSessionService>(
    FirebaseSessionService(
      getIt.get<FirebaseAuthRepository>(),
    ),
  );
}

SessionService sessionService() => GetIt.I.get<SessionService>();

AppService environmentService() => GetIt.I.get<AppService>();

FirebaseSessionService firebaseSessionService() =>
    GetIt.I.get<FirebaseSessionService>();
