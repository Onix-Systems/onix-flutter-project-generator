import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:{{project_name}}/data/source/local/preferences_source/preferences_keys.dart';
import 'package:{{project_name}}/data/source/local/preferences_source/preferences_source.dart';

class PreferencesSourceImpl implements PreferencesSource {
  final SharedPreferencesStorage _preferences;

  PreferencesSourceImpl(this._preferences);

  @override
  Future<int> getCacheTimestamp() async {
    return _preferences.get<int>(PrefsKeys.kCacheWriteTimestampKey, -1);
  }

  @override
  Future<void> saveCacheTimestamp(int value) async {
    await _preferences.put<int>(PrefsKeys.kCacheWriteTimestampKey, value);
  }
}
