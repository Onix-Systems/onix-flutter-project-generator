import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/app/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/domain/usecase/docs_generation/generate_documentation_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_data_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_screens_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/file_generation/generate_signing_config_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/add_output_message_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/output/clear_output_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/get_branches_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_osascript_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/process/run_process_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/generate_styles_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/styles/get_figma_styles_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/bloc/fields_dialog_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc.dart';
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
    ..registerFactory<ModifyProjectScreenBloc>(ModifyProjectScreenBloc.new)
    ..registerFactory<GenerationScreenBloc>(
      () => GenerationScreenBloc(
        GetIt.I.get<GenerateDocumentationUseCase>(),
        GetIt.I.get<GenerateScreensUseCase>(),
        GetIt.I.get<GenerateDataComponentsUseCase>(),
        GetIt.I.get<ClearOutputUseCase>(),
        GetIt.I.get<AddOutputMessageUseCase>(),
        GetIt.I.get<RunProcessUseCase>(),
        GetIt.I.get<RunOsaScriptProcessUseCase>(),
        GetIt.I.get<GenerateSigningConfigUseCase>(),
        GetIt.I.get<GenerateStylesUseCase>(),
      ),
    )
    ..registerFactory<SummaryScreenBloc>(SummaryScreenBloc.new)
    ..registerFactory<SwaggerParserScreenBloc>(SwaggerParserScreenBloc.new)
    ..registerFactory<DataComponentsScreenBloc>(DataComponentsScreenBloc.new)
    ..registerFactory<FieldsDialogBloc>(FieldsDialogBloc.new)
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
    ..registerFactory<ProjectSettingsScreenBloc>(ProjectSettingsScreenBloc.new)
    ..registerFactory<PlatformsScreenBloc>(PlatformsScreenBloc.new)
    ..registerFactory<ProjectNameScreenBloc>(
      () => ProjectNameScreenBloc(
        GetIt.I.get<GetBranchesProcessUseCase>(),
      ),
    )
    ..registerFactory<SplashScreenBloc>(SplashScreenBloc.new)
    ..registerFactory<AppBloc>(AppBloc.new)
    ..registerFactory<ProcedureSelectionScreenBloc>(
        ProcedureSelectionScreenBloc.new);
}
