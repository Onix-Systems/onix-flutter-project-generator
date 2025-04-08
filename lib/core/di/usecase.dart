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
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_flavors_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/git_cliff/generate_git_cliff_files_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/get_generation_output_stream_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_signing_fingerprint_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/screen/clear_screens_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/generate_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/get_figma_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/create_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/delete_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/delete_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/delete_source_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_source_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/empty_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_components_from_json_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_swagger_data_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_component_by_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/is_component_exists_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/restore_components_use_case.dart';

void registerUseCases(GetIt getIt) {
  getIt
    ..registerFactory<AddOutputMessageUseCase>(
      () => AddOutputMessageUseCase(
        getIt.get<OutputService>(),
      ),
    )
    ..registerFactory<GenerateDocumentationUseCase>(
      () => GenerateDocumentationUseCase(
        getIt.get<OutputService>(),
        getIt.get<DocsService>(),
      ),
    )
    ..registerFactory<GenerateScreensUseCase>(
      () => GenerateScreensUseCase(
        getIt.get<OutputService>(),
        getIt.get<ScreenRepository>(),
      ),
    )
    ..registerFactory<RunProcessUseCase>(
      () => RunProcessUseCase(getIt.get<OutputService>()),
    )
    ..registerFactory<RunOsaScriptProcessUseCase>(
      () => RunOsaScriptProcessUseCase(
        getIt.get<AddOutputMessageUseCase>(),
      ),
    )
    ..registerFactory<GetBranchesProcessUseCase>(
      () => const GetBranchesProcessUseCase(),
    )
    ..registerFactory<GetFigmaStylesUseCase>(
      () => GetFigmaStylesUseCase(
        getIt.get<FigmaService>(),
      ),
    )
    ..registerFactory<GenerateSigningConfigUseCase>(
      () => GenerateSigningConfigUseCase(
        getIt.get<FileGeneratorService>(),
      ),
    )
    ..registerFactory<GenerateFlavorsUseCase>(
      () => GenerateFlavorsUseCase(
        getIt.get<FileGeneratorService>(),
      ),
    )
    ..registerFactory<GenerateStylesUseCase>(
      () => GenerateStylesUseCase(
        getIt.get<FileGeneratorService>(),
      ),
    )
    ..registerFactory<GetGenerationOutputStream>(
      () => GetGenerationOutputStream(
        getIt.get<OutputService>(),
      ),
    )
    ..registerFactory<ClearOutputUseCase>(
      () => ClearOutputUseCase(
        getIt.get<OutputService>(),
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
    ..registerFactory<GetComponentsUseCase>(
      () => GetComponentsUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<AddSourceUseCase>(
      () => AddSourceUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<DeleteSourceUseCase>(
      () => DeleteSourceUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<EditSourceNameUseCase>(
      () => EditSourceNameUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<ClearSwaggerComponentsUseCase>(
      () => ClearSwaggerComponentsUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<ClearScreensUseCase>(
      () => ClearScreensUseCase(
        getIt.get<ScreenRepository>(),
      ),
    )
    ..registerFactory<GenerateGitCliffFilesUseCase>(
      () => GenerateGitCliffFilesUseCase(
        outputService: getIt.get<OutputService>(),
        service: getIt.get<GitCliffService>(),
      ),
    )
    ..registerFactory<IsComponentExistsUseCase>(
      () => IsComponentExistsUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<AddComponentUseCase>(
      () => AddComponentUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<EditComponentUseCase>(
      () => EditComponentUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<DeleteComponentUseCase>(
      () => DeleteComponentUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<GetComponentByNameUseCase>(
      () => GetComponentByNameUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<AddSourceRequestUseCase>(
      () => AddSourceRequestUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<EditSourceRequestUseCase>(
      () => EditSourceRequestUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<DeleteSourceRequestUseCase>(
      () => DeleteSourceRequestUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<FetchComponentsFromJsonUseCase>(
      () => FetchComponentsFromJsonUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    )
    ..registerFactory<RestoreComponentsUseCase>(
      () => RestoreComponentsUseCase(
        getIt.get<SwaggerRepository>(),
      ),
    );
}
