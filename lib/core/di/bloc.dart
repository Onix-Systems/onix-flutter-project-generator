import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/app/bloc/app_bloc_imports.dart';

import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/bloc/data_components_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/swagger_parser_screen/bloc/swagger_parser_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/summary_screen/bloc/summary_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/generation_screen/bloc/generation_screen_bloc.dart';

void registerBloc(GetIt getIt) {
  getIt.registerFactory<GenerationScreenBloc>(GenerationScreenBloc.new);
  getIt.registerFactory<SummaryScreenBloc>(SummaryScreenBloc.new);
  getIt.registerFactory<SwaggerParserScreenBloc>(SwaggerParserScreenBloc.new);
  getIt.registerFactory<DataComponentsScreenBloc>(DataComponentsScreenBloc.new);
  getIt.registerFactory<ScreensScreenBloc>(ScreensScreenBloc.new);
  getIt.registerFactory<ProjectSettingsScreenBloc>(
      ProjectSettingsScreenBloc.new);
  getIt.registerFactory<PlatformsScreenBloc>(PlatformsScreenBloc.new);
  getIt.registerFactory<ProjectNameScreenBloc>(ProjectNameScreenBloc.new);
  getIt.registerFactory<SplashScreenBloc>(SplashScreenBloc.new);
  getIt.registerFactory<AppBloc>(AppBloc.new);
}
