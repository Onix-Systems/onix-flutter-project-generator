import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
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
import 'package:onix_flutter_bricks/domain/usecase/swagger/fetch_swagger_data_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_component_by_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/is_component_exists_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/bloc/data_components_screen_v2_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/bloc/add_request_params_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/figma_styles_dialog/bloc/figma_styles_dialog_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc.dart';

void registerBloc(GetIt getIt) {
  getIt
    ..registerFactory<GenerationScreenBloc>(
      () => GenerationScreenBloc(
        GetIt.I.get<GenerateDocumentationUseCase>(),
        GetIt.I.get<GenerateScreensUseCase>(),
        GetIt.I.get<AddOutputMessageUseCase>(),
        GetIt.I.get<RunProcessUseCase>(),
        GetIt.I.get<RunOsaScriptProcessUseCase>(),
        GetIt.I.get<GenerateSigningConfigUseCase>(),
        GetIt.I.get<GenerateStylesUseCase>(),
        GetIt.I.get<GetGenerationOutputStream>(),
        GetIt.I.get<GenerateFastlaneFilesUseCase>(),
        GetIt.I.get<CreateSwaggerComponentsUseCase>(),
        GetIt.I.get<GenerateGitCliffFilesUseCase>(),
      ),
    )
    ..registerFactory<SummaryScreenBloc>(SummaryScreenBloc.new)
    ..registerFactory<SwaggerParserScreenBloc>(
      () => SwaggerParserScreenBloc(
        GetIt.I.get<FetchSwaggerDataUseCase>(),
        GetIt.I.get<ClearSwaggerComponentsUseCase>(),
      ),
    )
    ..registerFactory<ScreensScreenBloc>(ScreensScreenBloc.new)
    ..registerFactory<FigmaStylesScreenBloc>(
      () => FigmaStylesScreenBloc(
        GetIt.I.get<GetFigmaStylesUseCase>(),
      ),
    )
    ..registerFactory<FigmaStylesDialogBloc>(
      () => FigmaStylesDialogBloc(
        GetIt.I.get<GetFigmaStylesUseCase>(),
      ),
    )
    ..registerFactory<ProjectSettingsScreenBloc>(
      () => ProjectSettingsScreenBloc(
        screenRepository: GetIt.I.get<ScreenRepository>(),
      ),
    )
    ..registerFactory<PlatformsScreenBloc>(PlatformsScreenBloc.new)
    ..registerFactory<ProjectNameScreenBloc>(
      () => ProjectNameScreenBloc(
        GetIt.I.get<GetBranchesProcessUseCase>(),
      ),
    )
    ..registerFactory<SplashScreenBloc>(SplashScreenBloc.new)
    ..registerFactory<ProcedureSelectionScreenBloc>(
      () => ProcedureSelectionScreenBloc(
        GetIt.I.get<GenerateSigningConfigUseCase>(),
        GetIt.I.get<GenerateFlavorsUseCase>(),
        GetIt.I.get<GetSigningFingerprintUseCase>(),
        GetIt.I.get<ClearSwaggerComponentsUseCase>(),
        GetIt.I.get<ClearScreensUseCase>(),
        GetIt.I.get<GetGenerationOutputStream>(),
        GetIt.I.get<ClearOutputUseCase>(),
        GetIt.I.get<RunProcessUseCase>(),
      ),
    )
    ..registerFactory<DataComponentsScreenV2Bloc>(
      () => DataComponentsScreenV2Bloc(
        getSwaggerComponentsUseCase: GetIt.I.get<GetSwaggerComponentsUseCase>(),
        addSourceUseCase: GetIt.I.get<AddSourceUseCase>(),
        deleteSourceUseCase: GetIt.I.get<DeleteSourceUseCase>(),
        editSourceNameUseCase: GetIt.I.get<EditSourceNameUseCase>(),
        deleteDataObjectComponentUseCase: GetIt.I.get<DeleteComponentUseCase>(),
        deleteSourceRequestUseCase: GetIt.I.get<DeleteSourceRequestUseCase>(),
      ),
    )
    ..registerFactory<ComponentDialogCubit>(
      () => ComponentDialogCubit(
        addDataObjectComponentUseCase: GetIt.I.get<AddComponentUseCase>(),
        editDataObjectComponentUseCase: GetIt.I.get<EditComponentUseCase>(),
        getSwaggerComponentsUseCase: GetIt.I.get<GetSwaggerComponentsUseCase>(),
      ),
    )
    ..registerFactory<AddRequestDialogCubit>(
      () => AddRequestDialogCubit(
        getSwaggerComponentsUseCase: GetIt.I.get<GetSwaggerComponentsUseCase>(),
        addSourceRequestUseCase: GetIt.I.get<AddSourceRequestUseCase>(),
        editSourceRequestUseCase: GetIt.I.get<EditSourceRequestUseCase>(),
        addComponentUseCase: GetIt.I.get<AddComponentUseCase>(),
        getComponentByNameUseCase: GetIt.I.get<GetComponentByNameUseCase>(),
        isComponentExistsUseCase: GetIt.I.get<IsComponentExistsUseCase>(),
      ),
    )
    ..registerFactory<AddRequestParamsDialogCubit>(
      () => AddRequestParamsDialogCubit(
        getComponentByNameUseCase: GetIt.I.get<GetComponentByNameUseCase>(),
        getSwaggerComponentsUseCase: GetIt.I.get<GetSwaggerComponentsUseCase>(),
      ),
    );
}
