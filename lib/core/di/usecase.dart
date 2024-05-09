import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/fastlane_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/fastlane/generate_fastlane_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_data_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';

void registerUseCases(GetIt getIt) {
  getIt
    ..registerLazySingleton<ClearOutputUseCase>(
      () => ClearOutputUseCase(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerLazySingleton<AddOutputMessageUseCase>(
      () => AddOutputMessageUseCase(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerLazySingleton<GenerateDocumentationUseCase>(
      () => GenerateDocumentationUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<DocsService>(),
      ),
    )
    ..registerLazySingleton<GenerateScreensUseCase>(
      () => GenerateScreensUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<FileGeneratorService>(),
        GetIt.I.get<ScreenRepository>(),
      ),
    )
    ..registerLazySingleton<GenerateDataComponentsUseCase>(
      () => GenerateDataComponentsUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<FileGeneratorService>(),
        GetIt.I.get<DataComponentRepository>(),
        GetIt.I.get<SourceRepository>(),
      ),
    )
    ..registerLazySingleton<RunProcessUseCase>(
      () => const RunProcessUseCase(),
    )
    ..registerLazySingleton<RunOsaScriptProcessUseCase>(
      () => RunOsaScriptProcessUseCase(
        GetIt.I.get<AddOutputMessageUseCase>(),
      ),
    )
    ..registerLazySingleton<GetBranchesProcessUseCase>(
      () => const GetBranchesProcessUseCase(),
    )
    ..registerLazySingleton<GenerateFastlaneFilesUseCase>(
      () => GenerateFastlaneFilesUseCase(
        outputService: getIt.get<OutputService>(),
        fastlaneService: getIt.get<FastlaneService>(),
      ),
    );
}
