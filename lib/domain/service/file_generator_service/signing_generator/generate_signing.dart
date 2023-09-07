import 'dart:io';

import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/util/process_starter.dart';

class GenerateSigning {
  Future<void> call({
    required String projectPath,
    required String projectName,
    required String genPass,
    required List<String> signingVars,
  }) async {
    outputService.add('{info}Keystore password: $genPass');

    var signingProcess = await ProcessStarter.start(
        workingDirectory: '$projectPath/$projectName/android/app/signing');

    signingProcess.stdin.writeln(
        'keytool -genkey -v -keystore upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass $genPass -storepass $genPass -dname "CN=${signingVars[0]}, OU=${signingVars[1]}, O=${signingVars[2]}, L=${signingVars[3]}, S=${signingVars[4]}, C=${signingVars[5]}"');

    await signingProcess.exitCode;

    File signingFile = File(
        '$projectPath/$projectName/android/app/signing/signing.properties');
    String signingFileContent = await signingFile.readAsString();

    await signingFile.writeAsString(
        signingFileContent.replaceAll('{signing_password}', genPass));

    File buildGradle =
        File('$projectPath/$projectName/android/app/build.gradle');
    String buildGradleContent = await buildGradle.readAsString();
    buildGradleContent += '''

Properties props = new Properties()
def propFile = file('./signing/signing.properties')
if (propFile.canRead()) {
    props.load(new FileInputStream(propFile))

    if (props != null && props.containsKey('STORE_FILE') && props.containsKey('STORE_PASSWORD') &&
            props.containsKey('KEY_ALIAS') && props.containsKey('KEY_PASSWORD')) {
        android.signingConfigs.signed.storeFile = file(props['STORE_FILE'])
        android.signingConfigs.signed.storePassword = props['STORE_PASSWORD']
        android.signingConfigs.signed.keyAlias = props['KEY_ALIAS']
        android.signingConfigs.signed.keyPassword = props['KEY_PASSWORD']
    } else {
        android.buildTypes.release.signingConfig = null
    }
} else {
    android.buildTypes.release.signingConfig = null
}''';

    await buildGradle.writeAsString(buildGradleContent.replaceAll(
      '''buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }''',
      '''signingConfigs {
        signed
    }

    buildTypes {
        debug {
            signingConfig signingConfigs.signed
        }
        release {
            signingConfig signingConfigs.signed
        }
    }''',
    ));
  }
}
