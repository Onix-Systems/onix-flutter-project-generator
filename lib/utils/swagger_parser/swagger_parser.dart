import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';
import 'package:recase/recase.dart';

class SwaggerParser {
  static Future<SwaggerData> parse(
      {required Map<String, dynamic> data, required String projectName}) async {
    final String basePath = data['basePath'] ?? '';

    entityRepository.parse(data);

    final parsedEntities = entityRepository.entities;

    final parsedSources = await SourceParser.parse(data);

    for (final source in parsedSources) {
      for (final entity in parsedEntities.where((e) =>
          source.entities.contains(e.name) ||
          source.entities.contains('${e.name}Request') ||
          source.entities.contains('${e.name}Response'))) {
        entity.setSourceName(source.name);
      }
    }

    for (final entity in parsedEntities) {
      if (entity.imports.isNotEmpty && entity.sourceName.isNotEmpty) {
        _setSourceNameForImports(parsedEntities, entity, entity.sourceName);
      } else {
        _setEntitySourceNameFromParent(parsedEntities, entity);
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

      final entitiesToMove = List<Entity>.from(
          parsedEntities.where((e) => e.sourceName == source.name).toList());

      return SourceWrapper(
        name: source.name,
        paths: source.paths,
        entities: entitiesToMove.toList(),
      );
    }).toList();

    for (final source in sources) {
      for (final entity in source.entities) {
        if (entity.generateRequest) {
          _setGenRequest(sources, entity);
        }

        if (entity.generateResponse) {
          _setGenResponse(sources, entity);
        }
      }
    }

    final entities = parsedEntities.where((e) => e.sourceName.isEmpty).toList();

    for (final entity in entities) {
      if (entity.generateRequest) {
        _setGenRequest(sources, entity);
      }

      if (entity.generateResponse) {
        _setGenResponse(sources, entity);
      }
    }

    return SwaggerData(
      basePath: basePath,
      entities: entities,
      sources: sources,
    );
  }

  static void _setSourceNameForImports(
      Set<Entity> parsedEntities, Entity entity, String sourceName) {
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
      Set<Entity> parsedEntities, Entity entity) {
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

  static void _setGenRequest(List<SourceWrapper> sources, Entity entity) {
    entity.generateRequest = true;

    if (entity.isEnum || entity.entityImports.isEmpty) {
      return;
    }

    for (final import in entity.entityImports) {
      if (!import.isEnum &&
          !import.name.endsWith('Request') &&
          !import.name.endsWith('Response') &&
          entityRepository.entities
                  .firstWhereOrNull((e) => e.name == import.name) !=
              null) {
        _setGenRequest(sources,
            entityRepository.entities.firstWhere((e) => e.name == import.name));
      }
    }
  }

  static void _setGenResponse(List<SourceWrapper> sources, Entity entity) {
    entity.generateResponse = true;

    if (entity.isEnum || entity.entityImports.isEmpty) {
      return;
    }

    for (final import in entity.entityImports) {
      if (!import.isEnum &&
          !import.name.endsWith('Response') &&
          !import.name.endsWith('Request') &&
          entityRepository.entities
                  .firstWhereOrNull((e) => e.name == import.name) !=
              null) {
        _setGenResponse(sources,
            entityRepository.entities.firstWhere((e) => e.name == import.name));
      }
    }
  }
}
