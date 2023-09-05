import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/di/bloc.dart';
import 'package:onix_flutter_bricks/core/di/local.dart';
import 'package:onix_flutter_bricks/core/di/remote.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/core/di/source.dart';

void initializeDi(GetIt getIt) {
  registerLocal(getIt);
  registerServices(getIt);
  registerRemote(getIt);
  registerSources(getIt);
  registerRepositories(getIt);
  registerApp(getIt);
  registerBloc(getIt);
}
