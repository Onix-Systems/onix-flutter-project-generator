import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';
import 'package:recase/recase.dart';

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

      parsedEntities.removeWhere((e) => e.sourceName == source.name);

      return SourceEntity(
        name: source.name,
        paths: source.paths,
        entities: entitiesToMove
            .map(
              (e) => EntityWrapper(
                name: e.name,
                entity: e,
                generateRequest: e is! EnumEntity &&
                    source.paths.any((p) =>
                        p.methods.any((m) => m.requestEntityName == e.name)),
                generateResponse: e is! EnumEntity &&
                    source.paths.any((p) =>
                        p.methods.any((m) => m.responseEntityName == e.name)),
                properties: e.properties is List<Property>
                    ? e.properties as List<Property>
                    : e.properties
                        .map((p) => Property(name: p, type: ''))
                        .toList(),
                isEnum: e is EnumEntity,
              ),
            )
            .toList(),
      );
    }).toList();

    for (final source in sources) {
      for (final entity in source.entities.where((e) => e.generateRequest)) {
        _setGenRequest(sources, entity);
      }

      for (final entity in source.entities.where((e) => e.generateResponse)) {
        _setGenResponse(sources, entity);
      }
    }

    final entities = parsedEntities
        .map(
          (e) => EntityWrapper(
            name: e.name,
            entity: e,
            generateRequest: e is! EnumEntity,
            generateResponse: e is! EnumEntity,
            properties: e.properties is List<Property>
                ? e.properties as List<Property>
                : [],
            isEnum: e is EnumEntity,
          ),
        )
        .toList();

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

  static void _setGenRequest(List<SourceEntity> sources, EntityWrapper entity) {
    entity.generateRequest = true;

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
      List<SourceEntity> sources, EntityWrapper entity) {
    entity.generateResponse = true;

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
