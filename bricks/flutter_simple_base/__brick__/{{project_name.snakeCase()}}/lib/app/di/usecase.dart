//@formatter:off

{{#firebase_auth}}import 'package:{{project_name}}/domain/usecase/create_account_use_case.dart';
import 'package:{{project_name}}/domain/usecase/log_out_use_case.dart';
import 'package:{{project_name}}/domain/usecase/login_use_case.dart';
import 'package:{{project_name}}/app/service/firebase_session_service/firebase_session_service.dart';
import 'package:{{project_name}}/domain/repository/firebase_auth_repository.dart';{{/firebase_auth}}
import 'package:get_it/get_it.dart';

void registerUseCases(GetIt getIt) {
  {{#firebase_auth}}getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    );
  getIt.registerSingleton<CreateAccountUseCase>(
      CreateAccountUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    );
  getIt.registerSingleton<LogOutUseCase>(
      LogOutUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    );
  {{/firebase_auth}}
}

{{#firebase_auth}}LoginUseCase get loginUseCase => GetIt.I.get<LoginUseCase>();

CreateAccountUseCase get createAccountUseCase =>
    GetIt.I.get<CreateAccountUseCase>();

LogOutUseCase get logOutUseCase => GetIt.I.get<LogOutUseCase>();{{/firebase_auth}}
