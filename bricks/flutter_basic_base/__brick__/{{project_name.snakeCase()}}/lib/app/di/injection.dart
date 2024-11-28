import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/app/di/app.dart';
import 'package:{{project_name}}/app/di/local.dart';
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
}
