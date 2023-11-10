import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/domain/repository/time_repository.dart';
import 'package:{{project_name}}/domain/usecase/get_time_use_case.dart';
import 'package:{{project_name}}/domain/usecase/create_account_use_case.dart';
import 'package:{{project_name}}/domain/usecase/log_out_use_case.dart';
import 'package:{{project_name}}/domain/usecase/login_use_case.dart';

void registerUseCases(GetIt getIt) {
  getIt
    ..registerSingleton<GetTimeUseCase>(
      GetTimeUseCase(getIt<TimeRepository>()),
    )
    ..registerSingleton<LoginUseCase>(
      LoginUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    )
    ..registerSingleton<CreateAccountUseCase>(
      CreateAccountUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    )
    ..registerSingleton<LogOutUseCase>(
      LogOutUseCase(
        getIt<FirebaseAuthRepository>(),
        getIt<FirebaseSessionService>(),
      ),
    );
}

LoginUseCase get loginUseCase => GetIt.I.get<LoginUseCase>();

CreateAccountUseCase get createAccountUseCase =>
    GetIt.I.get<CreateAccountUseCase>();

LogOutUseCase get logOutUseCase => GetIt.I.get<LogOutUseCase>();
