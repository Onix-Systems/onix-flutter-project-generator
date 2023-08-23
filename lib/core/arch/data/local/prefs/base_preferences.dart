import 'package:shared_preferences/shared_preferences.dart';

class BasePreferences {
  Future<T> get<T>(String key, T defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    T result;

    switch (defaultValue.runtimeType) {
      case String:
        final value = prefs.getString(key) as T?;
        result = value ?? defaultValue;
        break;
      case bool:
        final value = prefs.getBool(key) as T?;
        result = value ?? defaultValue;
        break;
      case double:
        final value = prefs.getDouble(key) as T?;
        result = value ?? defaultValue;
        break;
      case int:
        final value = prefs.getInt(key) as T?;
        result = value ?? defaultValue;
        break;
      default:
        return defaultValue;
    }
    return result;
  }

  Future<void> put<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await prefs.setString(key, value as String);
        break;
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
    }
  }

  Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> removePrefByKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
