import 'dart:io';

import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/component_class_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/component_enum_generator.dart';

import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_request.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_response.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/mapper_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/params/data_component_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/signing_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/data_layer_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/data_layer_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/styles_generator.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:recase/recase.dart';

class FileGeneratorService {
  final OutputService _outputService;
  final DataComponentRepository _dataComponentRepository;

  final BaseGenerationService<bool> _screenGenerator = ScreenGenerator();
  final BaseGenerationService<bool> _stylesGenerator = StylesGenerator();
  final BaseGenerationService<bool> _dataLayerGenerator = DataLayerGenerator();
  final BaseGenerationService<bool> _componentEnumGenerator =
      ComponentEnumGenerator();
  late BaseGenerationService<bool> _signingGenerator;
  late BaseGenerationService<bool> _componentClassGenerator;
  late BaseGenerationService<bool> _mapperGenerator;

  FileGeneratorService(
    this._outputService,
    this._dataComponentRepository,
  ) {
    _signingGenerator = SigningGenerator(_outputService);
    _componentClassGenerator =
        ComponentClassGenerator(_dataComponentRepository);
    _mapperGenerator = MapperGenerator(_dataComponentRepository);
  }

  Future<bool> generateScreen(BaseGenerationParams params) =>
      _screenGenerator.generate(params);

  Future<bool> generateStyles(BaseGenerationParams params) =>
      _stylesGenerator.generate(params);

  Future<void> generateSource({
    required String projectName,
    required String projectPath,
    required Source source,
  }) async =>
      _dataLayerGenerator.generate(
        DataLayerGeneratorParams(
          projectName: projectName,
          projectPath: projectPath,
          source: source,
        ),
      );

  Future<void> generateComponent({
    required String projectName,
    required String projectPath,
    required String dataComponentName,
  }) async {
    final dataComponent = dataComponentRepository.getDataComponentByName(
        dataComponentName: dataComponentName)!;
    final params = DataComponentParams(
      projectName: projectName,
      projectPath: projectPath,
      dataComponent: dataComponent,
    );

    ///Generate components by type
    if (dataComponent.isEnum) {
      ///Generate Enum
      if (!dataComponent.exists) {
        await _componentEnumGenerator.generate(params);
      }
    } else {
      ///Generate components
      if (!dataComponent.exists) {
        await _componentClassGenerator.generate(params);
      }
      if (dataComponent.generateResponse) {
        await GenerateResponse().call(
          projectName: projectName,
          projectPath: projectPath,
          dataComponent: dataComponent,
        );
      }
      if (dataComponent.generateRequest) {
        await GenerateRequest().call(
          projectName: projectName,
          projectPath: projectPath,
          dataComponent: dataComponent,
        );
      }
      if (dataComponent.generateRequest || dataComponent.generateResponse) {
        await _mapperGenerator.generate(params);
      }
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
