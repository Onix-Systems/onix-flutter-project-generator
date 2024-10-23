import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{project_name}}/core/arch/logger/app_logger_impl.dart';
import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_source.dart';

class SecureStorageSourceImpl implements SecureStorageSource {
  FlutterSecureStorage? _secureStorage;

  SecureStorageSourceImpl() {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @override
  Future<void> clear() async {
    await _secureStorage?.deleteAll();
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorage?.delete(key: key);
    } catch (e, trace) {
      logger.crash(
        reason: 'secure_storage_clear',
        error: e,
        stackTrace: trace,
      );
    }
  }

  @override
  Future<String> read(String key) async {
    try {
      return await _secureStorage?.read(key: key) ?? '';
    } catch (e, trace) {
      logger.crash(
        reason: 'secure_storage_read',
        error: e,
        stackTrace: trace,
      );
      return '';
    }
  }

  @override
  Future<void> write(String key, String value) async {
    try {
      await _secureStorage?.write(key: key, value: value);
    } catch (e, trace) {
      logger.crash(
        reason: 'secure_storage_write',
        error: e,
        stackTrace: trace,
      );
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    try {
      final exist = await _secureStorage?.containsKey(key: key);
      if (exist != null) {
        return exist;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
