import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_data_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';

void registerUseCases(GetIt getIt) {
  getIt
    ..registerSingleton<ClearOutputUseCase>(
      ClearOutputUseCase(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerSingleton<AddOutputMessageUseCase>(
      AddOutputMessageUseCase(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerSingleton<GenerateDocumentationUseCase>(
      GenerateDocumentationUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<DocsService>(),
      ),
    )
    ..registerSingleton<GenerateScreensUseCase>(
      GenerateScreensUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<FileGeneratorService>(),
        GetIt.I.get<ScreenRepository>(),
      ),
    )
    ..registerSingleton<GenerateDataComponentsUseCase>(
      GenerateDataComponentsUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<FileGeneratorService>(),
        GetIt.I.get<DataComponentRepository>(),
        GetIt.I.get<SourceRepository>(),
      ),
    )
    ..registerSingleton<RunProcessUseCase>(
      RunProcessUseCase(),
    )
    ..registerSingleton<RunOsaScriptProcessUseCase>(
      RunOsaScriptProcessUseCase(
        GetIt.I.get<AddOutputMessageUseCase>(),
      ),
    );
}
