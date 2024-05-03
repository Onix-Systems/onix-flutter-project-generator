import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_component_class.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_component_enum.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_mapper.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_request.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_response.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/signing_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generate_source.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:recase/recase.dart';

class FileGeneratorService {
  final OutputService _outputService;

  final BaseGenerationService<bool> _screenGenerator = ScreenGenerator();
  late SigningGenerator _signingGenerator;

  FileGeneratorService(this._outputService) {
    _signingGenerator = SigningGenerator(_outputService);
  }

  Future<bool> generateScreen(BaseGenerationParams params) =>
      _screenGenerator.generate(params);

  Future<void> generateSource({
    required String projectName,
    required String projectPath,
    required Source source,
  }) async =>
      GenerateSource().call(
        projectName: projectName,
        projectPath: projectPath,
        source: source,
      );

  Future<void> generateComponent({
    required String projectName,
    required String projectPath,
    required String dataComponentName,
  }) async {
    final dataComponent = dataComponentRepository.getDataComponentByName(
        dataComponentName: dataComponentName)!;
    if (dataComponent.isEnum && !dataComponent.exists) {
      await GenerateComponentEnum().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    } else if (!dataComponent.exists) {
      await GenerateComponentClass().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum && dataComponent.generateResponse) {
      await GenerateResponse().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum && dataComponent.generateRequest) {
      await GenerateRequest().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum &&
        (dataComponent.generateRequest || dataComponent.generateResponse)) {
      await GenerateMapper().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
  }

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

  Future<bool> generateSigning(BaseGenerationParams params) =>
      _signingGenerator.generate(params);
}
