import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/di/app.dart';
{{#isBloc}}import 'package:{{project_name}}/core/di/bloc.dart';{{/isBloc}}
import 'package:{{project_name}}/core/di/local.dart';
{{#isProvider}}import 'package:{{project_name}}/core/di/provider.dart';{{/isProvider}}
import 'package:{{project_name}}/core/di/remote.dart';
import 'package:{{project_name}}/core/di/repository.dart';
import 'package:{{project_name}}/core/di/services.dart';
import 'package:{{project_name}}/core/di/source.dart';
import 'package:{{project_name}}/core/di/usecase.dart';

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
