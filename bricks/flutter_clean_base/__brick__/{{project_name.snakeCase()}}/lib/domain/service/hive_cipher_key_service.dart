import 'dart:convert';
import 'dart:typed_data';

import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_keys.dart';
import 'package:{{project_name}}/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:hive/hive.dart';

class HiveCipherKeyService {
  final SecureStorageSource _storage;

  HiveCipherKeyService(this._storage);

  Future<List<int>> init() async {
    final List<int> key;

    final containsKey =
        await _storage.containsKey(SecureStorageKeys.kSecretKeyCipher);

    if (!containsKey) {
      key = await _generateNewKey();
    } else {
      key = await _readStorage();
    }
    return key;
  }

  Future<List<int>> _generateNewKey() async {
    final key = Hive.generateSecureKey();
    await _storage.write(
      SecureStorageKeys.kSecretKeyCipher,
      base64UrlEncode(key),
    );
    return key;
  }

  Future<Uint8List> _readStorage() async {
    final key = await _storage.read(SecureStorageKeys.kSecretKeyCipher);
    return base64Url.decode(key);
  }
}
