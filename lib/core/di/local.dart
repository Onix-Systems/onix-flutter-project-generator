import 'package:get_it/get_it.dart';

import 'package:onix_flutter_bricks/core/arch/data/local/prefs/base_preferences.dart';
import 'package:onix_flutter_bricks/data/source/local/preferences_source/preferences_source.dart';
import 'package:onix_flutter_bricks/data/source/local/preferences_source/preferences_source_impl.dart';
import 'package:onix_flutter_bricks/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:onix_flutter_bricks/data/source/local/secure_storage/secure_storage_source_impl.dart';

void registerLocal(GetIt getIt) {
  getIt
    ..registerLazySingleton<SecureStorageSource>(
      SecureStorageSourceImpl.new,
    )
    ..registerLazySingleton(
      BasePreferences.new,
    )
    ..registerLazySingleton<PreferencesSource>(
      () => PreferencesSourceImpl(getIt.get<BasePreferences>()),
    );
}

SecureStorageSource secureStorageSource() => GetIt.I.get<SecureStorageSource>();

PreferencesSource preferencesSource() => GetIt.I.get<PreferencesSource>();
