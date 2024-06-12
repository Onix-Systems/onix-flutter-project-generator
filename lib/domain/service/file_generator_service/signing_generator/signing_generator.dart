import 'dart:io';

import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/signing_failure.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';
import 'package:onix_flutter_bricks/util/process_runner.dart';

///This class Generates Android keystore with given credentials and fix Gradle signing configuration
class SigningGenerator implements BaseGenerationService<Result<dynamic>> {
  final OutputService _outputService;

  SigningGenerator(this._outputService);

  @override
  Future<Result<dynamic>> generate(BaseGenerationParams params) async {
    if (params is! SingingGeneratorParams) {
      return Result.error(
        failure: SigningFailure(SigningFailureType.invalidParams),
      );
    }
    try {
      _outputService
          .add('Keystore password: ${params.signingPassword}'.toInfoMessage());

      final workDirectory = '${params.projectFolder}/android/app/signing';

      ///
      if (params.separateFromBrick) {
        final directory = Directory(workDirectory);
        await directory.create();
      }
      final certificateFile = File('$workDirectory/upload-keystore.jks');
      final certificateExist = await certificateFile.exists();
      if (certificateExist) {
        return Result.error(
          failure: SigningFailure(SigningFailureType.signingAlreadyExist),
        );
      }

      ///Run generate Keystore process
      final processRunner = ProcessRunner(_outputService);
      await processRunner.newProcess(workingDirectory: workDirectory);
      processRunner.execCommand(
          'keytool -genkey -v -keystore upload-keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 -keypass ${params.signingPassword} -storepass ${params.signingPassword} -dname "CN=${params.signingVars[0]}, OU=${params.signingVars[1]}, O=${params.signingVars[2]}, L=${params.signingVars[3]}, S=${params.signingVars[4]}, C=${params.signingVars[5]}"');
      await processRunner.waitForExit();
      processRunner.dispose();
      late File signingFile;
      late String signingFileContent;

      if (params.separateFromBrick) {
        signingFileContent =
            await rootBundle.loadString('assets/signing/signing.properties');
        signingFile = File('$workDirectory/signing.properties');
        await signingFile.create();
      } else {
        signingFile = File('$workDirectory/signing.properties');
        signingFileContent = await signingFile.readAsString();
      }

      await signingFile.writeAsString(
        signingFileContent.replaceAll(
          '{signing_password}',
          params.signingPassword,
        ),
      );

      ///Open gradle file
      File buildGradle =
          File('${params.projectFolder}/android/app/build.gradle');
      String buildGradleContent = await buildGradle.readAsString();

      ///Add script to read own signing config file
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

      ///Fix build types configuration
      await buildGradle.writeAsString(
        buildGradleContent.replaceAll(
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
        ),
      );
      return const Result.success(0);
    } catch (e, trace) {
      logger.e(e, stackTrace: trace);
      return Result.error(
        failure: SigningFailure(SigningFailureType.exception),
      );
    }
  }
}
