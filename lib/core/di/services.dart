import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/figma_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

void registerServices(GetIt getIt) {
  getIt
    ..registerSingleton<OutputService>(OutputService())
    ..registerSingleton<FileGeneratorService>(FileGeneratorService())
    ..registerSingleton<DocsService>(DocsService())
    ..registerLazySingleton<FigmaService>(
      () => FigmaService(
        figmaRepository: GetIt.I.get<FigmaRepository>(),
      ),
    );
}

OutputService get outputService => GetIt.I.get<OutputService>();

FileGeneratorService get fileGeneratorService =>
    GetIt.I.get<FileGeneratorService>();

FigmaService get figmaService => GetIt.I.get<FigmaService>();
