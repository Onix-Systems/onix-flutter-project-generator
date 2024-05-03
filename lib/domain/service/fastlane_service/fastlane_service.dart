import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/enums/fastlane_assets.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/enums/fastlane_env_vars.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/params/fastlane_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_config/fastlane_config_params_creator.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_config/fastlane_generate_makefile.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/fastlane_config/fatlane_config_param.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/utils/platform_env_creator/platform_env_creator.dart';

const _android = 'android';
const _ios = 'ios';
const _androidFastlane = '/android/fastlane/';
const _iosFastlane = '/ios/fastlane/';

class FastlaneService implements BaseGenerationService<bool> {
  const FastlaneService();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! FastlaneGenerationParams) return false;

    final platforms = params.platforms
        .where((element) => element == _android || element == _ios);

    try {
      for (final platform in platforms) {
        final isAndroid = platform == _android;
        await _createDirectory(
          params: params,
          directoryPath: isAndroid ? _androidFastlane : _iosFastlane,
        );
        await _copyAndPasteAllFiles(params, isAndroid: isAndroid);
      }

      await _generateFastlaneConfig(params);
      await _generateMakeFile(params);

      return true;
    } catch (e, s) {
      logger.e(e, stackTrace: s);
      return false;
    }
  }

  Future<Directory> _createDirectory({
    required FastlaneGenerationParams params,
    required String directoryPath,
  }) async {
    return Directory('${_getProjectFullPath(params)}/$directoryPath')
        .create(recursive: true);
  }

  Future<void> _copyAndPasteAllFiles(
    FastlaneGenerationParams params, {
    required bool isAndroid,
  }) async {
    final platform = isAndroid ? _android : _ios;
    final projectPath = _getProjectFullPath(params);

    for (final file in FastlaneAssets.values) {
      await File(file.getAssetPath(platform: platform)).copy(
        file.getOutputPath(projectPath: projectPath, platform: platform),
      );
    }

    await _generateFastlaneEnvs(
      creator: isAndroid
          ? const FastlaneAndroidEnvCreator()
          : const FastlaneIosEnvCreator(),
      params: params,
      isAndroid: isAndroid,
    );
  }

  Future<void> _generateFastlaneEnvs({
    required FastlaneGenerationParams params,
    required PlatformEnvCreator creator,
    required bool isAndroid,
  }) async {
    var bundleId = '${params.organization}.${params.projectName}';
    final path = isAndroid
        ? '${_getProjectFullPath(params)}$_androidFastlane'
        : '${_getProjectFullPath(params)}$_iosFastlane';

    if (params.flavors.isEmpty) {
      await creator.createEnv(
        path: path,
        data: {
          if (isAndroid) FastlaneEnvVars.packageId: bundleId,
          if (!isAndroid) FastlaneEnvVars.bundleId: bundleId,
        },
      );
      return;
    }

    for (final flavor in params.flavors) {
      await creator.createEnv(
        path: path,
        flavor: flavor,
        data: {
          if (isAndroid) FastlaneEnvVars.packageId: '$bundleId.$flavor',
          if (!isAndroid) FastlaneEnvVars.bundleId: '$bundleId.$flavor',
        },
      );
    }
  }

  Future<void> _generateFastlaneConfig(FastlaneGenerationParams params) async {
    final directoryPath = '${_getProjectFullPath(params)}/fastlane_config.yaml';
    final path = await File(directoryPath).create();
    final contents = <String>[];
    final platforms = params.platforms
        .where((element) => element == _android || element == _ios);

    contents
      ..add('default_scheme: default')
      ..add('')
      ..add('schemes:');

    for (final platform in platforms) {
      final schemes = _generateConfigSchemes(
        params,
        isAndroid: platform == _android,
      );
      contents.addAll(schemes);
    }

    contents.add('firebase:');

    for (final platform in platforms) {
      final firebase = _generateConfigFirebase(
        params,
        isAndroid: platform == _android,
      );
      contents.addAll(firebase);
    }

    await path.writeAsString(contents.join('\n'));
  }

  List<String> _generateConfigSchemes(
    FastlaneGenerationParams params, {
    required bool isAndroid,
  }) {
    final platform = isAndroid ? _android : _ios;
    final contents = <String>['  $platform:'];
    final flavors = List<String>.from(params.flavors);

    var attachFlavor = true;

    if (flavors.isEmpty) {
      attachFlavor = false;
      flavors.add('default');
    }

    for (final flavor in flavors) {
      final configParams = FastlaneFlavorParams.createFastlaneParams(
        platform: platform,
        flavor: flavor,
        params: [
          if (isAndroid) ...[
            const FastlaneOneLineParam(
              key: 'release_status',
              payload: 'draft',
              shouldBeCommented: true,
              comment: 'Valid values are completed, draft, halted, inProgress',
            ),
            const FastlaneOneLineParam(
              key: 'track',
              payload: 'internal',
              shouldBeCommented: true,
              comment:
                  'Default available tracks are: production, beta, alpha, internal. Default value is production',
            ),
          ],
          if (!isAndroid) ...[
            FastlaneOneLineParam(
              key: 'scheme_name',
              payload: attachFlavor ? flavor : 'Runner',
              comment: '# Xcode - Manage Schemes',
            ),
            const FastlaneOneLineParam(
              key: 'target_name',
              payload: 'Runner',
              comment:
                  'You can change the name of the Runner if you have more than one in Xcode',
            ),
            const FastlaneOneLineParam(
              key: 'export_method',
              payload: 'app-store',
              comment:
                  'Valid values are: app-store, validation, ad-hoc, package, enterprise, development, developer-id and mac-application',
            ),
            const FastlaneOneLineParam(
              key: 'workspace',
              payload: 'Runner.xcworkspace',
            ),
            const FastlaneOneLineParam(
              key: 'manual_codesign',
              payload: 'false',
              comment:
                  'Be sure to select your preferred signature method in Xcode - Signing & Capabilities',
            ),
            FastlaneMultiLineParam(
              shouldBeCommented: true,
              key: 'provisioning_profile',
              comment:
                  'If manual_codesign: true, be sure to specify the bundle_id and the name of the profile\'s provisions',
              payload: {
                'bundle_id': attachFlavor
                    ? '${params.organization}.${params.projectName}.$flavor'
                    : '${params.organization}.${params.projectName}',
                'name': 'PROVISIONING_PROFILE_NAME'
              },
            ),
          ],
        ],
      );

      contents
        ..addAll(configParams)
        ..add('');
    }
    return contents;
  }

  List<String> _generateConfigFirebase(
    FastlaneGenerationParams params, {
    required bool isAndroid,
  }) {
    final platform = isAndroid ? _android : _ios;
    final contents = <String>['  $platform:'];
    final flavors = List<String>.from(params.flavors);

    if (flavors.isEmpty) {
      flavors.add('default');
    }

    for (final flavor in flavors) {
      final firebaseParams = FastlaneFlavorParams.createFastlaneParams(
        platform: platform,
        flavor: flavor,
        params: [
          const FastlaneOneLineParam(
            key: 'release_notes_file',
            payload: '../release_notes.txt',
            shouldBeCommented: true,
            comment: 'Relative path to the file',
          ),
          const FastlaneOneLineParam(
            key: 'testers',
            payload: 'TESTERS_COMMAS_STRING',
            shouldBeCommented: true,
            comment: 'Comma-separated list',
          ),
          const FastlaneOneLineParam(
            key: 'groups',
            payload: 'GROUPS_COMMAS_STRING',
            shouldBeCommented: true,
            comment: 'Comma-separated list',
          ),
          if (isAndroid)
            const FastlaneOneLineParam(
              key: 'deploy_apk_only',
              payload: 'true',
              shouldBeCommented: true,
              comment:
                  'deploy_apk_only: true is used if firebase is not integrated with play Console',
            ),
        ],
      );

      contents
        ..addAll(firebaseParams)
        ..add('');
    }

    return contents;
  }

  Future<void> _generateMakeFile(FastlaneGenerationParams params) async {
    final directoryPath = _getProjectFullPath(params);
    final platforms = params.platforms
        .where((element) => element == _android || element == _ios);

    for (final platform in platforms) {
      if (platform == _android) {
        await FastlaneGenerateMakefile.generateMakefileAndroid(
          outputPath: directoryPath,
          flavors: params.flavors,
        );
      } else if (platform == _ios) {
        await FastlaneGenerateMakefile.generateMakefileIos(
          outputPath: directoryPath,
          flavors: params.flavors,
        );
      }
    }

    await FastlaneGenerateMakefile.generateMakefileMain(
      outputPath: directoryPath,
      flavors: params.flavors,
      platforms: platforms,
    );
  }

  String _getProjectFullPath(FastlaneGenerationParams params) =>
      '${params.projectPath}/${params.projectName}';
}
