import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:{{project_name}}/core/di/bloc.dart';
import 'package:{{project_name}}/core/di/local.dart';
import 'package:{{project_name}}/core/di/provider.dart';
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
  registerBloc(getIt);
  registerProvider(getIt);
}
