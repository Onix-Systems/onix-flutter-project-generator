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
        entities: entitiesToMove
            .map(
              (e) => EntityWrapper(
                name: e.name,
                generateRequest: e is! EnumEntity,
                generateResponse: e is! EnumEntity,
                classBody: e.generateClassBody(projectName: projectName),
                properties: e.properties is List<Property>
                    ? e.properties as List<Property>
                    : [],
                isEnum: e is EnumEntity,
              ),
            )
            .toList(),
      );
    }).toList();

    final entities = parsedEntities
        .map(
          (e) => EntityWrapper(
            name: e.name,
            generateRequest: e is! EnumEntity,
            generateResponse: e is! EnumEntity,
            classBody: e.generateClassBody(projectName: projectName),
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
}
