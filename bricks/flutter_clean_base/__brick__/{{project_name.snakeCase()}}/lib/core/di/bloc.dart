import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/domain/repository/startup_repository.dart';
import 'package:{{project_name}}/presentation/screen/splash/bloc/splash_bloc_imports.dart';
import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';

void registerBloc(GetIt getIt) {
  getIt
    ..registerFactory<AppBloc>(AppBloc.new)
    ..registerFactory<SplashBloc>(
      () => SplashBloc(getIt.get<StartupRepository>()),
    );
}
