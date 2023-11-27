import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/app/bloc/app_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/modify_project_screen/bloc/modify_project_screen_bloc.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/bloc/fields_dialog_bloc.dart';

void registerBloc(GetIt getIt) {
  getIt
    ..registerFactory<ModifyProjectScreenBloc>(ModifyProjectScreenBloc.new)
    ..registerFactory<GenerationScreenBloc>(GenerationScreenBloc.new)
    ..registerFactory<SummaryScreenBloc>(SummaryScreenBloc.new)
    ..registerFactory<SwaggerParserScreenBloc>(SwaggerParserScreenBloc.new)
    ..registerFactory<DataComponentsScreenBloc>(DataComponentsScreenBloc.new)
    ..registerFactory<FieldsDialogBloc>(FieldsDialogBloc.new)
    ..registerFactory<ScreensScreenBloc>(ScreensScreenBloc.new)
    ..registerFactory<FigmaStylesScreenBloc>(FigmaStylesScreenBloc.new)
    ..registerFactory<ProjectSettingsScreenBloc>(ProjectSettingsScreenBloc.new)
    ..registerFactory<PlatformsScreenBloc>(PlatformsScreenBloc.new)
    ..registerFactory<ProjectNameScreenBloc>(ProjectNameScreenBloc.new)
    ..registerFactory<SplashScreenBloc>(SplashScreenBloc.new)
    ..registerFactory<AppBloc>(AppBloc.new)
    ..registerFactory<ProcedureSelectionScreenBloc>(
        ProcedureSelectionScreenBloc.new);
}
