import 'package:get_it/get_it.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

void registerLocal(GetIt getIt) {
  getIt.registerLazySingleton(
    BasePreferences.new,
  );
}
