abstract class SecureStorageSource {
  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<String> read(String key);

  Future<void> clear();

  Future<bool> containsKey(String key);
}
