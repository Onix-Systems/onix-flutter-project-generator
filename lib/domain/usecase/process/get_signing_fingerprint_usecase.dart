import 'dart:convert';
import 'dart:io';

import 'package:onix_flutter_bricks/domain/entity/config/fingerprint.dart';
import 'package:onix_flutter_bricks/util/enum/fingerprint_type.dart';

const _fingerprintsKey = 'Certificate fingerprints:';
const _sha1Key = 'SHA1:';
const _sha256Key = 'SHA256:';

class GetSigningFingerprintUseCase {
  const GetSigningFingerprintUseCase();

  Future<List<Fingerprint>> call({
    required String projectFolder,
    required String password,
  }) async {
    final workDirectory = '$projectFolder/android/app/signing';
    final process = await Process.start(
      'keytool',
      [
        '-list',
        '-v',
        '-keystore',
        'upload-keystore.jks',
        '-alias',
        'upload',
        '-storepass',
        password,
        '-keypass',
        password,
      ],
      workingDirectory: workDirectory,
    );
    final fingerprints = List<Fingerprint>.empty(growable: true);
    process.stdout.transform(utf8.decoder).listen(
      (event) {
        if (event.contains(_fingerprintsKey)) {
          final startFingerprints =
              event.indexOf(_fingerprintsKey) + _fingerprintsKey.length;
          final fingerPrints = event.substring(startFingerprints);
          final lines = fingerPrints.split('\n');
          for (final line in lines) {
            if (line.contains(_sha1Key)) {
              final fingerprint = _clearFingerprint(
                _sha1Key,
                line,
              );
              fingerprints.add(
                Fingerprint(
                  type: FingerprintType.sha1,
                  value: fingerprint,
                ),
              );
            } else if (line.contains(_sha256Key)) {
              final fingerprint = _clearFingerprint(
                _sha256Key,
                line,
              );
              fingerprints.add(
                Fingerprint(
                  type: FingerprintType.sha256,
                  value: fingerprint,
                ),
              );
            }
          }
        }
      },
    );

    await process.exitCode;
    return fingerprints;
  }

  String _clearFingerprint(String key, String input) {
    return input
        .replaceAll(key, '')
        .replaceAll(' ', '')
        .replaceAll('\n', '')
        .trim();
  }
}
