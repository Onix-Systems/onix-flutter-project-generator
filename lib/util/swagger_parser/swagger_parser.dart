import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:recase/recase.dart';

class SwaggerParser {
  static void parse({
    required Map<String, dynamic> data,
    required String projectName,
  }) {
    dataComponentRepository.parse(data);

    sourceRepository.parse(data);

    final parsedEntities = dataComponentRepository.dataComponents;

    final parsedSources = sourceRepository.sources;

    for (final dataComponent in parsedEntities) {
      _setGenRequestResponse(
        dataComponents: parsedEntities,
        dataComponent: dataComponent,
        genRequest: dataComponent.generateRequest,
        genResponse: dataComponent.generateResponse,
      );
    }

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
        dataComponentsNames: componentsToMove.map((e) => e.name).toList(),
      );
    }).toList();

    for (final source in sources) {
      if (source.name != 'Time') {
        sourceRepository.modifySource(source, source.name);
      }
    }

    dataComponentRepository.empty();

    for (final dataComponent in parsedEntities) {
      dataComponentRepository.addComponent(dataComponent);
    }
  }

  static void _setSourceNameForImports(Set<DataComponent> parsedEntities,
      DataComponent dataComponent, String sourceName) {
    final imports = dataComponent.imports.map((e) => e.snakeCase).toSet();

    for (var import in parsedEntities.where((e) =>
        imports.contains(e.name.snakeCase) ||
        imports.contains('${e.name.snakeCase}_request') ||
        imports.contains('${e.name.snakeCase}_response'))) {
      import.setSourceName(sourceName);

      if (import.imports.isNotEmpty) {
        _setSourceNameForImports(parsedEntities, import, sourceName);
      }
    }
  }

  static void _setEntitySourceNameFromParent(
      Set<DataComponent> parsedDataComponents, DataComponent dataComponent) {
    if (dataComponent.sourceName.isNotEmpty) {
      return;
    }

    final sourceName = parsedDataComponents
        .firstWhereOrNull((e) => e.imports
            .map((import) => import.pascalCase)
            .contains(dataComponent.name.pascalCase))
        ?.sourceName;

    if (sourceName != null) {
      dataComponent.setSourceName(sourceName);
    }
  }

  static void _setGenRequestResponse({
    required Set<DataComponent> dataComponents,
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

    if (dataComponent.isEnum || dataComponent.imports.isEmpty) {
      return;
    }

    for (final import in dataComponent.imports) {
      if (!dataComponentRepository.isEnum(import) &&
          !import.endsWith('Request') &&
          !import.endsWith('Response') &&
          (dataComponents.any(
              (component) => component.name.pascalCase == import.pascalCase))) {
        final component = dataComponents
            .firstWhereOrNull((e) => e.name.pascalCase == import.pascalCase);

        if (component != null) {
          _setGenRequestResponse(
              dataComponents: dataComponents,
              dataComponent: component,
              genRequest: genRequest,
              genResponse: genResponse);
        }
      }
    }
  }
}
