import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
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
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/bloc/add_request_params_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc.dart';

void registerBloc(GetIt getIt) {
  getIt
    ..registerFactory<GenerationScreenBloc>(
      () => GenerationScreenBloc(
        configService: getIt.get<ConfigService>(),
        generateDocumentationUseCase: getIt.get<GenerateDocumentationUseCase>(),
        generateFastlaneFilesUseCase: getIt.get<GenerateFastlaneFilesUseCase>(),
        generateGitCliffFilesUseCase: getIt.get<GenerateGitCliffFilesUseCase>(),
        generateScreensUseCase: getIt.get<GenerateScreensUseCase>(),
        generateStylesUseCase: getIt.get<GenerateStylesUseCase>(),
        addOutputMessageUseCase: getIt.get<AddOutputMessageUseCase>(),
        getGenerationOutputStream: getIt.get<GetGenerationOutputStream>(),
        runProcessUseCase: getIt.get<RunProcessUseCase>(),
        runOsaScriptProcessUseCase: getIt.get<RunOsaScriptProcessUseCase>(),
        createSwaggerComponentsUseCase:
            getIt.get<CreateSwaggerComponentsUseCase>(),
        generateSigningConfigUseCase: getIt.get<GenerateSigningConfigUseCase>(),
      ),
    )
    ..registerFactory<SummaryScreenBloc>(
      () => SummaryScreenBloc(
        screenRepository: getIt.get<ScreenRepository>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<SwaggerParserScreenBloc>(
      () => SwaggerParserScreenBloc(
        fetchSwaggerDataUseCase: getIt.get<FetchSwaggerDataUseCase>(),
        getComponentsUseCase: getIt.get<GetComponentsUseCase>(),
        restoreComponentsUseCase: getIt.get<RestoreComponentsUseCase>(),
        clearSwaggerComponentsUseCase:
            getIt.get<ClearSwaggerComponentsUseCase>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<ScreensScreenBloc>(
      () => ScreensScreenBloc(
        configService: getIt.get<ConfigService>(),
        screenRepository: getIt.get<ScreenRepository>(),
      ),
    )
    ..registerFactory<FigmaStylesScreenBloc>(
      () => FigmaStylesScreenBloc(
        getFigmaStylesUseCase: getIt.get<GetFigmaStylesUseCase>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<ProjectSettingsScreenBloc>(
      () => ProjectSettingsScreenBloc(
        screenRepository: getIt.get<ScreenRepository>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<PlatformsScreenBloc>(
      () => PlatformsScreenBloc(
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<ProjectNameScreenBloc>(
      () => ProjectNameScreenBloc(
        getBranchesProcessUseCase: getIt.get<GetBranchesProcessUseCase>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<SplashScreenBloc>(
      () => SplashScreenBloc(
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<ProcedureSelectionScreenBloc>(
      () => ProcedureSelectionScreenBloc(
        configService: getIt.get<ConfigService>(),
        generateSigningConfigUseCase: getIt.get<GenerateSigningConfigUseCase>(),
        generateFlavorsUseCase: getIt.get<GenerateFlavorsUseCase>(),
        getSigningFingerprintUseCase: getIt.get<GetSigningFingerprintUseCase>(),
        clearSwaggerComponentsUseCase:
            getIt.get<ClearSwaggerComponentsUseCase>(),
        clearScreensUseCase: getIt.get<ClearScreensUseCase>(),
        getGenerationOutputStream: getIt.get<GetGenerationOutputStream>(),
        clearOutputUseCase: getIt.get<ClearOutputUseCase>(),
        runProcessUseCase: getIt.get<RunProcessUseCase>(),
        fetchComponentsFromJsonUseCase:
            getIt.get<FetchComponentsFromJsonUseCase>(),
      ),
    )
    ..registerFactory<DataComponentsScreenV2Bloc>(
      () => DataComponentsScreenV2Bloc(
        getSwaggerComponentsUseCase: getIt.get<GetComponentsUseCase>(),
        addSourceUseCase: getIt.get<AddSourceUseCase>(),
        deleteSourceUseCase: getIt.get<DeleteSourceUseCase>(),
        editSourceNameUseCase: getIt.get<EditSourceNameUseCase>(),
        deleteDataObjectComponentUseCase: getIt.get<DeleteComponentUseCase>(),
        deleteSourceRequestUseCase: getIt.get<DeleteSourceRequestUseCase>(),
        configService: getIt.get<ConfigService>(),
      ),
    )
    ..registerFactory<ComponentDialogCubit>(
      () => ComponentDialogCubit(
        addDataObjectComponentUseCase: getIt.get<AddComponentUseCase>(),
        editDataObjectComponentUseCase: getIt.get<EditComponentUseCase>(),
        getSwaggerComponentsUseCase: getIt.get<GetComponentsUseCase>(),
        isComponentExistsUseCase: getIt.get<IsComponentExistsUseCase>(),
      ),
    )
    ..registerFactory<AddRequestDialogCubit>(
      () => AddRequestDialogCubit(
        getSwaggerComponentsUseCase: getIt.get<GetComponentsUseCase>(),
        addSourceRequestUseCase: getIt.get<AddSourceRequestUseCase>(),
        editSourceRequestUseCase: getIt.get<EditSourceRequestUseCase>(),
        addComponentUseCase: getIt.get<AddComponentUseCase>(),
        getComponentByNameUseCase: getIt.get<GetComponentByNameUseCase>(),
        isComponentExistsUseCase: getIt.get<IsComponentExistsUseCase>(),
      ),
    )
    ..registerFactory<AddRequestParamsDialogCubit>(
      () => AddRequestParamsDialogCubit(
        getComponentByNameUseCase: getIt.get<GetComponentByNameUseCase>(),
        getSwaggerComponentsUseCase: getIt.get<GetComponentsUseCase>(),
      ),
    )
    ..registerFactory<ClassFromJsonDialogCubit>(ClassFromJsonDialogCubit.new);
}
