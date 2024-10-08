import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_bricks/domain/service/component_generator/component_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/fastlane_service.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/figma_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/git_cliff_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/fastlane/generate_fastlane_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/git_cliff/generate_git_cliff_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_signing_fingerprint_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/generate_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/get_figma_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/create_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_swagger_data_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';

void registerUseCases(GetIt getIt) {
  getIt
    ..registerFactory<AddOutputMessageUseCase>(
      () => AddOutputMessageUseCase(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerFactory<GenerateDocumentationUseCase>(
      () => GenerateDocumentationUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<DocsService>(),
      ),
    )
    ..registerFactory<GenerateScreensUseCase>(
      () => GenerateScreensUseCase(
        GetIt.I.get<OutputService>(),
        GetIt.I.get<ScreenRepository>(),
      ),
    )
    ..registerFactory<RunProcessUseCase>(
      () => RunProcessUseCase(GetIt.I.get<OutputService>()),
    )
    ..registerFactory<RunOsaScriptProcessUseCase>(
      () => RunOsaScriptProcessUseCase(
        GetIt.I.get<AddOutputMessageUseCase>(),
      ),
    )
    ..registerFactory<GetBranchesProcessUseCase>(
      () => const GetBranchesProcessUseCase(),
    )
    ..registerFactory<GetFigmaStylesUseCase>(
      () => GetFigmaStylesUseCase(
        GetIt.I.get<FigmaService>(),
      ),
    )
    ..registerFactory<GenerateSigningConfigUseCase>(
      () => GenerateSigningConfigUseCase(
        GetIt.I.get<FileGeneratorService>(),
      ),
    )
    ..registerFactory<GenerateStylesUseCase>(
      () => GenerateStylesUseCase(
        GetIt.I.get<FileGeneratorService>(),
      ),
    )
    ..registerFactory<GetGenerationOutputStream>(
      () => GetGenerationOutputStream(
        GetIt.I.get<OutputService>(),
      ),
    )
    ..registerFactory<GenerateFastlaneFilesUseCase>(
      () => GenerateFastlaneFilesUseCase(
        outputService: getIt.get<OutputService>(),
        fastlaneService: getIt.get<FastlaneService>(),
      ),
    )
    ..registerFactory<GetSigningFingerprintUseCase>(
      () => const GetSigningFingerprintUseCase(),
    )
    ..registerFactory<FetchSwaggerDataUseCase>(
      () => FetchSwaggerDataUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<CreateSwaggerComponentsUseCase>(
      () => CreateSwaggerComponentsUseCase(
        getIt.get<SwaggerRepository>(),
        getIt.get<ComponentGeneratorService>(),
      ),
    )
    ..registerFactory<GetSwaggerComponentsUseCase>(
      () => GetSwaggerComponentsUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<GenerateGitCliffFilesUseCase>(
      () => GenerateGitCliffFilesUseCase(
        outputService: getIt.get<OutputService>(),
        service: getIt.get<GitCliffService>(),
      ),
    );
}
