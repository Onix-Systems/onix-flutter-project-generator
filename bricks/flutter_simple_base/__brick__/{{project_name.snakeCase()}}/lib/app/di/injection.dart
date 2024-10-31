import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/app/di/app.dart';
{{#isBloc}}import 'package:{{project_name}}/app/di/bloc.dart';{{/isBloc}}
import 'package:{{project_name}}/app/di/local.dart';
{{#isProvider}}import 'package:{{project_name}}/app/di/provider.dart';{{/isProvider}}
import 'package:{{project_name}}/app/di/remote.dart';
import 'package:{{project_name}}/app/di/repository.dart';
import 'package:{{project_name}}/app/di/services.dart';
import 'package:{{project_name}}/app/di/source.dart';
import 'package:{{project_name}}/app/di/usecase.dart';

void initializeDi(GetIt getIt) {
  registerLocal(getIt);
  registerCoreServices(getIt);
  registerRemote(getIt);
  registerSources(getIt);
  registerRepositories(getIt);
  registerApp(getIt);
  registerAppServices(getIt);
  registerUseCases(getIt);
  {{#isBloc}}registerBloc(getIt);{{/isBloc}}
  {{#isProvider}}registerProvider(getIt);{{/isProvider}}
}
