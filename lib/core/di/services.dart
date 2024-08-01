import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/component_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/fastlane_service.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/figma_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/git_cliff_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

void registerAppServices(GetIt getIt) {
  getIt
    ..registerSingleton<OutputService>(OutputService())
    ..registerSingleton<FileGeneratorService>(
      FileGeneratorService(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerSingleton<DocsService>(DocsService())
    ..registerLazySingleton<FigmaService>(
      () => FigmaService(
        figmaRepository: GetIt.I.get<FigmaRepository>(),
      ),
    )
    ..registerLazySingleton<FastlaneService>(() => const FastlaneService())
    ..registerLazySingleton<ComponentGeneratorService>(
        () => ComponentGeneratorService())
    ..registerLazySingleton<GitCliffService>(() => GitCliffService());
}
