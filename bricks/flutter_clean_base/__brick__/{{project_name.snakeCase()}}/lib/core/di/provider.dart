//@formatter:off
import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/app/provider/app_provider_imports.dart';
//{imports end}

void registerProvider(GetIt getIt) {
  getIt.registerFactory<AppProvider>(AppProvider.new);
  //{provider end}
}
