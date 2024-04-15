import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/core/arch/data/local/prefs/base_preferences.dart';

void registerLocal(GetIt getIt) {
  getIt.registerLazySingleton(
    BasePreferences.new,
  );
}
