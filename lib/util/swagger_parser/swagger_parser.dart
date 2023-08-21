import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:recase/recase.dart';

class SwaggerParser {
  static void parse(
      {required Map<String, dynamic> data, required String projectName}) {
    dataComponentRepository.parse(data);

    sourceRepository.parse(data);

    final parsedEntities = dataComponentRepository.dataComponents;

    final parsedSources = sourceRepository.sources;

    for (final source in parsedSources) {
      for (final dataComponent in parsedEntities.where((e) =>
          source.dataComponentsNames.contains(e.name) ||
          source.dataComponentsNames.contains('${e.name}Request') ||
          source.dataComponentsNames.contains('${e.name}Response'))) {
        dataComponent.setSourceName(source.name);
      }
    }

    for (final dataComponent in parsedEntities) {
      if (dataComponent.imports.isNotEmpty &&
          dataComponent.sourceName.isNotEmpty) {
        _setSourceNameForImports(
            parsedEntities, dataComponent, dataComponent.sourceName);
      } else {
        _setEntitySourceNameFromParent(parsedEntities, dataComponent);
      }
    }

    final sources = parsedSources.map((source) {
      for (final source in parsedSources) {
        for (final path in source.paths) {
          for (final method in path.methods) {
            if (method.innerEnums.isNotEmpty) {
              for (final innerEnum in method.innerEnums) {
                innerEnum.setSourceName(source.name);
              }
              parsedEntities.addAll(method.innerEnums);
            }
          }
        }
      }

      final componentsToMove = List<DataComponent>.from(
          parsedEntities.where((e) => e.sourceName == source.name).toList());

      return Source(
        name: source.name,
        paths: source.paths,
        dataComponents: componentsToMove.toList(),
        dataComponentsNames: componentsToMove.map((e) => e.name).toList(),
      );
    }).toList();

    final dataComponents =
        parsedEntities.where((e) => e.sourceName.isEmpty).toList();

    for (final source in sources) {
      for (final dataComponent in source.dataComponents) {
        _setGenRequestResponse(
            sources: sources,
            dataComponents: dataComponents,
            dataComponent: dataComponent,
            genRequest: dataComponent.generateRequest,
            genResponse: dataComponent.generateResponse);
      }
    }

    for (final dataComponent in dataComponents) {
      _setGenRequestResponse(
          sources: sources,
          dataComponents: dataComponents,
          dataComponent: dataComponent,
          genRequest: dataComponent.generateRequest,
          genResponse: dataComponent.generateResponse);
    }

    for (final source in sources) {
      if (source.name != 'Time') {
        sourceRepository.modifySource(source, source.name);
      }
    }

    dataComponentRepository.empty();

    for (final dataComponent in dataComponents) {
      dataComponentRepository.addComponent(dataComponent);
    }
  }

  static void _setSourceNameForImports(Set<DataComponent> parsedEntities,
      DataComponent entity, String sourceName) {
    for (var import in parsedEntities.where((e) =>
        entity.imports.contains('${e.name.snakeCase}_request') ||
        entity.imports.contains('${e.name.snakeCase}_response'))) {
      import.setSourceName(sourceName);

      if (import.imports.isNotEmpty) {
        _setSourceNameForImports(parsedEntities, import, sourceName);
      }
    }
  }

  static void _setEntitySourceNameFromParent(
      Set<DataComponent> parsedEntities, DataComponent entity) {
    if (entity.sourceName.isNotEmpty) {
      return;
    }

    final sourceName = parsedEntities
        .firstWhereOrNull((e) => e.imports.contains(entity.name.snakeCase))
        ?.sourceName;

    if (sourceName != null) {
      entity.setSourceName(sourceName);
    }
  }

  static void _setGenRequestResponse({
    required List<Source> sources,
    required List<DataComponent> dataComponents,
    required DataComponent dataComponent,
    required bool genRequest,
    required bool genResponse,
  }) {
    dataComponent.generateRequest == true
        ? dataComponent.generateRequest = true
        : dataComponent.generateRequest = genRequest;
    dataComponent.generateResponse == true
        ? dataComponent.generateResponse = true
        : dataComponent.generateResponse = genResponse;

    if (dataComponent.isEnum || dataComponent.componentImports.isEmpty) {
      return;
    }

    for (final import in dataComponent.componentImports) {
      if (!import.isEnum &&
          !import.name.endsWith('Request') &&
          !import.name.endsWith('Response') &&
          (dataComponents.any((component) =>
                  component.name.pascalCase == import.name.pascalCase) ||
              sources.any((source) => source.dataComponents
                  .any((e) => e.name.pascalCase == import.name.pascalCase)))) {
        final component =
            dataComponentRepository.getDataComponentByName(import.name);

        if (component != null) {
          _setGenRequestResponse(
              sources: sources,
              dataComponents: dataComponents,
              dataComponent: component,
              genRequest: genRequest,
              genResponse: genResponse);
        }
      }
    }
  }
}
