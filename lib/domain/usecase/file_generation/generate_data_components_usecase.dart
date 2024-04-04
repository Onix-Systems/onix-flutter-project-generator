import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/data_component_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateDataComponentsUseCase {
  final OutputService _outputService;
  final FileGeneratorService _fileGeneratorService;
  final DataComponentRepository _dataComponentRepository;
  final SourceRepository _sourceRepository;

  GenerateDataComponentsUseCase(
    this._outputService,
    this._fileGeneratorService,
    this._dataComponentRepository,
    this._sourceRepository,
  );

  Future<void> call({
    required Config config,
  }) async {
    var needToGenerateDataComponents = config.dataComponents
        .where((component) => !component.exists)
        .isNotEmpty;

    var needToGenerateSources =
        config.sources.where((source) => !source.exists).isNotEmpty;

    //check sources if generation need
    if (!needToGenerateSources) {
      for (var source in config.sources) {
        if (source.dataComponentsNames
            .where((component) => !_dataComponentRepository
                .getDataComponentByName(dataComponentName: component)!
                .exists)
            .isNotEmpty) {
          needToGenerateSources = true;
          break;
        }
      }
    }

    if (needToGenerateDataComponents || needToGenerateSources) {
      ///generate components
      _outputService.add('{#info}Generating entities!');
      if (needToGenerateDataComponents) {
        for (final component in config.dataComponents) {
          await _fileGeneratorService.generateComponent(
            projectPath: config.projectPath,
            projectName: config.projectName,
            dataComponentName: component.name,
          );
        }
      }

      ///generate sources
      if (needToGenerateSources) {
        final sources = config.sources.where((source) {
          return !source.exists ||
              source.dataComponentsNames.where((entity) {
                return !_dataComponentRepository
                    .getDataComponentByName(dataComponentName: entity)!
                    .exists;
              }).isNotEmpty;
        }).toList();

        ///generate component folders
        for (var source in sources) {
          if (source.dataComponentsNames.isEmpty) {
            await _fileGeneratorService.generateEmptySourceComponentFolders(
              projectPath: config.projectPath,
              projectName: config.projectName,
              sourceName: source.name,
            );
          }
          for (final component in source.dataComponentsNames.where((e) =>
              !_dataComponentRepository
                  .getDataComponentByName(dataComponentName: e)!
                  .exists &&
              !source.paths.any((path) => path.methods.any((method) => method
                  .innerEnums
                  .any((innerEnum) => innerEnum.name == e))))) {
            await _fileGeneratorService.generateComponent(
              projectPath: config.projectPath,
              projectName: config.projectName,
              dataComponentName: component,
            );
          }

          if (!source.exists) {
            await _fileGeneratorService.generateSource(
              source: source,
              projectPath: config.projectPath,
              projectName: config.projectName,
            );
          }
        }
      }

      _sourceRepository.setAllExists();
      _dataComponentRepository.setAllExists();

      _outputService.add('{#info}Entities generated!');
    }
  }
}
