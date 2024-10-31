abstract class PreferencesSource {
  Future<int> getCacheTimestamp();

  Future<void> saveCacheTimestamp(int value);
}
