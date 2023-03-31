import 'package:{{project_name}}/core/arch/data/local/prefs/base_preferences.dart';

import 'package:{{project_name}}/data/source/local/preferences_source/preferences_keys.dart';
import 'package:{{project_name}}/data/source/local/preferences_source/preferences_source.dart';

class PreferencesSourceImpl implements PreferencesSource {
  final BasePreferences _preferences;

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
