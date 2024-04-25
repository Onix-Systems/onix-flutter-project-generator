import 'dart:io';

import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/enums/fastlane_assets_enum.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/params/fastlane_generation_params.dart';

const _android = 'android';
const _ios = 'ios';
const _androidFastlane = '/android/fastlane/';
const _iosFastlane = '/ios/fastlane/';

class FastlaneService implements BaseGenerationService<bool> {
  const FastlaneService();

  @override
  Future<bool> generate(BaseGenerationParams params) async {
    if (params is! FastlaneGenerationParams) return false;
    if (!_platformContainsAndroidOrIos(params)) return true;

    try {
      if (params.platforms.contains(_android)) {
        await _createDirectory(
          params: params,
          directoryPath: _androidFastlane,
        );
        await _copyAndPasteAllFiles(params, isAndroid: true);
      }

      if (params.platforms.contains(_ios)) {
        await _createDirectory(
          params: params,
          directoryPath: _iosFastlane,
        );
        await _copyAndPasteAllFiles(params, isAndroid: false);
      }

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
    return Directory(
            '${params.projectPath}/${params.projectName}/$directoryPath')
        .create(recursive: true);
  }

  Future<void> _copyAndPasteFastlaneFiles({
    required String assetPath,
    required String outputPath,
    required String fileName,
  }) async {
    final content = await rootBundle.loadString('$assetPath$fileName');
    final file = await File('$outputPath$fileName').create();
    await file.writeAsString(content);
  }

  Future<void> _copyAndPasteAllFiles(
    FastlaneGenerationParams params, {
    required bool isAndroid,
  }) async {
    final platform = isAndroid ? _android : _ios;

    for (final file in FastlaneAssets.values) {
      _copyAndPasteFastlaneFiles(
        assetPath: file.isPlatformDirectoryFile
            ? '${file.assetPath}$platform'
            : file.assetPath,
        outputPath: file.isPlatformDirectoryFile
            ? '${params.projectPath}/${params.projectName}/$platform/fastlane/'
            : '${params.projectPath}/${params.projectName}/$platform/',
        fileName: file.name,
      );
    }
  }

  bool _platformContainsAndroidOrIos(FastlaneGenerationParams params) =>
      params.platforms.contains(_android) || params.platforms.contains(_ios);
}


