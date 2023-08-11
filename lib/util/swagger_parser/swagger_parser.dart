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

    for (final source in sources) {
      for (final dataComponent in source.dataComponents) {
        if (dataComponent.generateRequest) {
          _setGenRequest(sources, dataComponent);
        }

        if (dataComponent.generateResponse) {
          _setGenResponse(sources, dataComponent);
        }
      }
    }

    final dataComponents =
        parsedEntities.where((e) => e.sourceName.isEmpty).toList();

    for (final entity in dataComponents) {
      if (entity.generateRequest) {
        _setGenRequest(sources, entity);
      }

      if (entity.generateResponse) {
        _setGenResponse(sources, entity);
      }
    }

    for (final source in sources) {
      sourceRepository.modifySource(source, source.name);
    }

    dataComponentRepository.dataComponents.clear();

    for (final dataComponent in dataComponents) {
      dataComponentRepository.dataComponents
          .add(DataComponent.copyOf(dataComponent));
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

  static void _setGenRequest(
      List<Source> sources, DataComponent dataComponent) {
    dataComponent.generateRequest = true;

    if (dataComponent.isEnum || dataComponent.componentImports.isEmpty) {
      return;
    }

    for (final import in dataComponent.componentImports) {
      if (!import.isEnum &&
          !import.name.endsWith('Request') &&
          !import.name.endsWith('Response') &&
          dataComponentRepository.dataComponents
                  .firstWhereOrNull((e) => e.name == import.name) !=
              null) {
        _setGenRequest(
            sources,
            dataComponentRepository.dataComponents
                .firstWhere((e) => e.name == import.name));
      }
    }
  }

  static void _setGenResponse(
      List<Source> sources, DataComponent dataComponent) {
    dataComponent.generateResponse = true;

    if (dataComponent.isEnum || dataComponent.componentImports.isEmpty) {
      return;
    }

    for (final import in dataComponent.componentImports) {
      if (!import.isEnum &&
          !import.name.endsWith('Response') &&
          !import.name.endsWith('Request') &&
          dataComponentRepository.dataComponents
                  .firstWhereOrNull((e) => e.name == import.name) !=
              null) {
        _setGenResponse(
            sources,
            dataComponentRepository.dataComponents
                .firstWhere((e) => e.name == import.name));
      }
    }
  }
}
