import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/app/bloc/app_bloc_imports.dart';

import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_name_screen/bloc/project_name_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_bloc.dart';

import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc.dart';

void registerBloc(GetIt getIt) {
  getIt.registerFactory<ScreensScreenBloc>(ScreensScreenBloc.new);
  getIt.registerFactory<ProjectSettingsScreenBloc>(
      ProjectSettingsScreenBloc.new);
  getIt.registerFactory<PlatformsScreenBloc>(PlatformsScreenBloc.new);
  getIt.registerFactory<ProjectNameScreenBloc>(ProjectNameScreenBloc.new);
  getIt.registerFactory<SplashScreenBloc>(SplashScreenBloc.new);
  getIt.registerFactory<AppBloc>(AppBloc.new);
}
