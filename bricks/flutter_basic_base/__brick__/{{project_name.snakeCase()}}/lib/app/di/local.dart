import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/data/source/local/preferences_source/preferences_source.dart';
import 'package:{{project_name}}/data/source/local/preferences_source/preferences_source_impl.dart';
import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_source_impl.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

void registerLocal(GetIt getIt) {
  getIt
    ..registerLazySingleton<SecureStorageSource>(
      SecureStorageSourceImpl.new,
    )
    ..registerLazySingleton(
      SharedPreferencesStorage.new,
    )
    ..registerLazySingleton<PreferencesSource>(
      () => PreferencesSourceImpl(getIt.get<SharedPreferencesStorage>()),
    );
}

SecureStorageSource secureStorageSource() => GetIt.I.get<SecureStorageSource>();

PreferencesSource preferencesSource() => GetIt.I.get<PreferencesSource>();
