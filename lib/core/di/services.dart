import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

import 'package:onix_flutter_bricks/domain/service/session_service/session_service.dart';

void registerServices(GetIt getIt) {
  getIt
    ..registerSingleton<SessionService>(SessionService())
    ..registerSingleton<OutputService>(OutputService())
    ..registerSingleton<FileGeneratorService>(FileGeneratorService());
}

SessionService get sessionService => GetIt.I.get<SessionService>();

OutputService get outputService => GetIt.I.get<OutputService>();

FileGeneratorService get fileGeneratorService =>
    GetIt.I.get<FileGeneratorService>();
