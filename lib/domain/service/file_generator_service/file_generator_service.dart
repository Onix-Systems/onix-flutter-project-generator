import 'dart:io';

import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/flavor_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/flavor_generator/params/flavor_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/params/signing_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/signing_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/params/styles_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/styles_generator.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';
import 'package:recase/recase.dart';

class FileGeneratorService {
  final OutputService _outputService;

  final BaseGenerationService<bool, DefaultScreenRouteGeneratorParams>
      _defaultScreenRouteGenerator = DefaultScreenRouteGenerator();
  final BaseGenerationService<bool, StylesGeneratorParams> _stylesGenerator =
      StylesGenerator();
  late final BaseGenerationService<Result<int>, SingingGeneratorParams>
      _signingGenerator;

  late final BaseGenerationService<Result<int>, FlavorGeneratorParams>
      _flavorGenerator;

  FileGeneratorService(
    this._outputService,
  ) {
    _signingGenerator = SigningGenerator(_outputService);
    _flavorGenerator = FlavorGenerator(_outputService);
  }

  Future<bool> generateDefaultScreenRoute(
    DefaultScreenRouteGeneratorParams params,
  ) =>
      _defaultScreenRouteGenerator.generate(params);

  Future<bool> generateStyles(StylesGeneratorParams params) =>
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

  Future<Result<int>> generateSigning(SingingGeneratorParams params) =>
      _signingGenerator.generate(params);

  Future<Result<int>> generateFlavors(FlavorGeneratorParams params) =>
      _flavorGenerator.generate(params);
}
