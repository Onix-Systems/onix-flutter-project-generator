import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/utils/extensions/replace_last.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/class_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';
import 'package:recase/recase.dart';

import '../../core/di/di.dart';

class SwaggerParser {
  static Future<SwaggerData> parse(
      {required Map<String, dynamic> data, required String projectName}) async {
    final String basePath = data['basePath'] ?? '';

    final parsedEntities = await EntityParser.parse(data);

    final parsedSources = await SourceParser.parse(data);

    for (final source in parsedSources) {
      for (final entity
          in parsedEntities.where((e) => source.entities.contains(e.name))) {
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
      final entitiesToMove = List<Entity>.from(
          parsedEntities.where((e) => e.sourceName == source.name).toList());

      for (final source in parsedSources) {
        for (final path in source.paths) {
          for (final method in path.methods) {
            if (method.innerEnum != null) {
              entitiesToMove.add(method.innerEnum!);
            }
          }
        }
      }

      parsedEntities.removeWhere((e) => e.sourceName == source.name);

      return SourceWrapper(
        name: source.name,
        paths: source.paths,
        entities: entitiesToMove.map(
          (e) {
            final entityWrapper = EntityWrapper(
              name: e.name,
              entity: e,
              generateRequest: e is! EnumEntity &&
                  !e.name.endsWith('Request') &&
                  source.paths.any((p) =>
                      p.methods.any((m) => m.requestEntityName == e.name)),
              generateResponse: e is! EnumEntity &&
                  (!e.name.endsWith('Response') &&
                      source.paths.any((p) => p.methods
                          .any((m) => m.responseEntityName == e.name))),
              properties: e.properties is List<Property>
                  ? e.properties as List<Property>
                  : e.properties
                      .map((p) => Property(name: p, type: ''))
                      .toList(),
              isEnum: e is EnumEntity,
            );

            return entityWrapper;
          },
        ).toList(),
      );
    }).toList();

    for (final source in sources) {
      for (final entity in source.entities) {
        if (entity.generateRequest || entity.name.endsWith('Request')) {
          _setGenRequest(sources, entity);
        }

        if (entity.generateResponse || entity.name.endsWith('Response')) {
          _setGenResponse(sources, entity);
        }
      }
    }

    final entities = parsedEntities.map(
      (e) {
        final entityWrapper = EntityWrapper(
          name: e.name,
          entity: e,
          generateRequest: e is! EnumEntity &&
              !e.name.endsWith('Request') &&
              sources.any((source) => source.paths.any(
                  (p) => p.methods.any((m) => m.requestEntityName == e.name))),
          generateResponse: e is! EnumEntity &&
              !e.name.endsWith('Response') &&
              sources.any((source) => source.paths.any(
                  (p) => p.methods.any((m) => m.responseEntityName == e.name))),
          properties: e.properties is List<Property>
              ? e.properties as List<Property>
              : [],
          isEnum: e is EnumEntity,
        );

        return entityWrapper;
      },
    ).toList();

    // final entitiesFromResponse = <EntityWrapper>[];
    //
    // for (final source in sources) {
    //   for (final entity in source.entities) {
    //     if (!entity.isEnum && entity.name.endsWith('Response')) {
    //       if (!sources.any((s) =>
    //           s.entities
    //               .any((e) =>
    //           e.name == entity.name.replaceLast('Response', '')))) {
    //         final entityWrapper = EntityWrapper(
    //           name: entity.name.replaceLast('Response', ''),
    //           properties: entity.properties,
    //           entity: ClassEntity(
    //             name: entity.name.replaceLast('Response', ''),
    //             properties: entity.properties.map((p) {
    //               p.name = p.name.replaceLast('Response', '');
    //               p.type = p.type.replaceLast('Response', '');
    //               return p;
    //             }).toList(),
    //           )
    //             ..addImports(entity.entity?.imports.toList() ?? [])
    //             ..setSourceName(entity.entity?.sourceName ?? source.name),
    //         );
    //
    //         logger.wtf(entityWrapper);
    //
    //         entitiesFromResponse.add(entityWrapper);
    //       }
    //     }
    //   }
    // }
    //
    // for (final entity in entitiesFromResponse) {
    //   sources
    //       .firstWhere((source) => source.name == entity.entity?.sourceName)
    //       .entities
    //       .add(entity);
    // }

    return SwaggerData(
      basePath: basePath,
      entities: entities,
      sources: sources,
    );
  }

  static void _setSourceNameForImports(
      List<Entity> parsedEntities, Entity entity, String sourceName) {
    for (var import in parsedEntities
        .where((e) => entity.imports.contains(e.name.snakeCase))) {
      import.setSourceName(sourceName);

      if (import.imports.isNotEmpty) {
        _setSourceNameForImports(parsedEntities, import, sourceName);
      }
    }
  }

  static void _setEntitySourceNameFromParent(
      List<Entity> parsedEntities, Entity entity) {
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
      List<SourceWrapper> sources, EntityWrapper entity) {
    entity.generateRequest = !entity.name.endsWith('Request');

    final allEntities = <EntityWrapper>{};

    for (final source in sources) {
      allEntities.addAll(source.entities);
    }

    if (entity.entity == null ||
        entity.entity is EnumEntity ||
        entity.entity!.entityImports.isEmpty) {
      return;
    }

    for (final import in entity.entity!.entityImports) {
      if (import is! EnumEntity &&
          allEntities.firstWhereOrNull((e) => e.name == import.name) != null) {
        _setGenRequest(
            sources, allEntities.firstWhere((e) => e.name == import.name));
      }
    }
  }

  static void _setGenResponse(
      List<SourceWrapper> sources, EntityWrapper entity) {
    entity.generateResponse = !entity.name.endsWith('Response');

    final allEntities = <EntityWrapper>{};

    for (final source in sources) {
      allEntities.addAll(source.entities);
    }

    if (entity.entity == null ||
        entity.entity is EnumEntity ||
        entity.entity!.entityImports.isEmpty) {
      return;
    }

    for (final import in entity.entity!.entityImports) {
      if (import is! EnumEntity &&
          allEntities.firstWhereOrNull((e) => e.name == import.name) != null) {
        _setGenResponse(
            sources, allEntities.firstWhere((e) => e.name == import.name));
      }
    }
  }
}
