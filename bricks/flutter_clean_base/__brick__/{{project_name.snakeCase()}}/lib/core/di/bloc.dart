//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';
//{imports end}

void registerBloc(GetIt getIt) {
  getIt.registerFactory<AppBloc>(AppBloc.new);
  //{bloc end}
}
