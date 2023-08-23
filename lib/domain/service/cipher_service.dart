import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/data/source/local/secure_storage/secure_storage_keys.dart';
import 'package:onix_flutter_bricks/data/source/local/secure_storage/secure_storage_source.dart';

class CipherService {
  final SecureStorageSource _storage;

  late IV _iv;
  late Encrypter _encryptor;

  CipherService(this._storage) {
    _iv = IV.fromLength(16);
  }

  Future<void> init() async {
    final skKeyHEX = await _storage.read(
      SecureStorageKeys.kSecretKeyCipher,
    );
    final Key key;

    if (skKeyHEX.isNotEmpty) {
      key = await _getKey(skKeyHEX);
    } else {
      key = await _generateNewKey();
    }
    _encryptor = Encrypter(
      AES(key),
    );
  }

  Future<List<int>> encrypt(List<int> bytes) async {
    try {
      final encrypted = _encryptor.encryptBytes(bytes, iv: _iv);
      return encrypted.bytes.toList();
    } catch (e, trace) {
      logger.crash(reason: 'encrypt_error', error: e, stackTrace: trace);
      return [];
    }
  }

  Future<List<int>> decrypt(List<int> bytes) async {
    try {
      final decrypted = _encryptor.decryptBytes(
        Encrypted(
          Uint8List.fromList(bytes),
        ),
        iv: _iv,
      );
      return decrypted;
    } catch (e, trace) {
      logger.crash(reason: 'decrypt_error', error: e, stackTrace: trace);
      return [];
    }
  }

  List<int> _fromHex(String s) {
    s.replaceAll('\n', '');
    return s.split(' ').map((e) {
      final result = int.tryParse(e, radix: 16);

      if (result == null) {
        throw StateError('Not valid hexadecimal bytes: $s, $e');
      }
      return result;
    }).toList();
  }

  String _toHex(List<int> bytes) {
    return bytes
        .map(
          (e) => e.toRadixString(16).padLeft(2, '0'),
        )
        .join(' ');
  }

  Future<Key> _generateNewKey() async {
    final secretKey = Key.fromSecureRandom(16);
    final bytes = secretKey.bytes.toList();
    final secretKeyHEX = _toHex(bytes);
    await _storage.write(SecureStorageKeys.kSecretKeyCipher, secretKeyHEX);
    return Key(Uint8List.fromList(bytes));
  }

  Future<Key> _getKey(String skKeyHEX) async {
    final bytes = _fromHex(skKeyHEX);
    return Key(
      Uint8List.fromList(bytes),
    );
  }
}
