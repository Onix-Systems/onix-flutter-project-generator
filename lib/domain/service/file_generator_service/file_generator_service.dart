import 'dart:io';

import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/bloc_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/signing_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/styles_generator.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:recase/recase.dart';

class FileGeneratorService {
  final OutputService _outputService;

  final BaseGenerationService<bool> _blocScreenGenerator =
      BlocScreenGenerator();

  final BaseGenerationService<bool> _defaultScreenRouteGenerator =
      DefaultScreenRouteGenerator();

  final BaseGenerationService<bool> _stylesGenerator = StylesGenerator();
  late BaseGenerationService<Result<dynamic>> _signingGenerator;

  FileGeneratorService(
    this._outputService,
  ) {
    _signingGenerator = SigningGenerator(_outputService);
  }

  Future<bool> generateScreen(BaseGenerationParams params) =>
      _blocScreenGenerator.generate(params);

  Future<bool> generateDefaultScreenRoute(BaseGenerationParams params) =>
      _defaultScreenRouteGenerator.generate(params);

  Future<bool> generateStyles(BaseGenerationParams params) =>
      _stylesGenerator.generate(params);

  Future<void> generateEmptySourceComponentFolders({
    required String projectName,
    required String projectPath,
    required String sourceName,
  }) async {
    await Directory(
            '$projectPath/$projectName/lib/domain/entity/${sourceName.snakeCase}')
        .create(recursive: true);
    await Directory(
            '$projectPath/$projectName/lib/data/model/remote/${sourceName.snakeCase}')
        .create(recursive: true);
    await Directory(
            '$projectPath/$projectName/lib/data/mapper/${sourceName.snakeCase}')
        .create(recursive: true);
  }

  Future<Result<dynamic>> generateSigning(BaseGenerationParams params) =>
      _signingGenerator.generate(params);
}
