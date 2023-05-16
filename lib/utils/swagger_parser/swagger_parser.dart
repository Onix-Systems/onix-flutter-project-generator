import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/enum.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/source.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';
import 'package:recase/recase.dart';

class SwaggerParser {
  static Future<SwaggerData> parse(
      {required Map<String, dynamic> data, required String projectName}) async {
    final String basePath = data['basePath'] ?? '';
    final parsedEntities = await EntityParser.parse(data);

    _addEntityImportClasses(parsedEntities);

    final parsedSources = await SourceParser.parse(data);

    final sources = parsedSources.map((source) {
      for (var entity
          in parsedEntities.where((e) => source.entities.contains(e.name))) {
        entity.setSourceName(source.name);
        _setSourceNameForImports(parsedEntities, entity, source);
      }

      final entitiesToMove = List<Entity>.from(
          parsedEntities.where((e) => e.sourceName == source.name).toList());

      parsedEntities.removeWhere((e) => e.sourceName == source.name);

      return SourceEntity(
        name: source.name,
        entities: entitiesToMove
            .map(
              (e) => EntityEntity(
                  name: e.name,
                  generateRequest: e is! EnumEntity,
                  generateResponse: e is! EnumEntity,
                  classBody: e.generateClassBody(projectName: projectName),
                  properties: e.properties is List<Property>
                      ? e.properties as List<Property>
                      : []),
            )
            .toList(),
      );
    }).toList();

    final entities = parsedEntities
        .map(
          (e) => EntityEntity(
              name: e.name,
              generateRequest: e is! EnumEntity,
              generateResponse: e is! EnumEntity,
              classBody: e.generateClassBody(projectName: projectName),
              properties: e.properties is List<Property>
                  ? e.properties as List<Property>
                  : []),
        )
        .toList();

    return SwaggerData(
      basePath: basePath,
      entities: entities,
      sources: sources,
    );
  }

  static void _setSourceNameForImports(
      List<Entity> parsedEntities, Entity entity, Source source) {
    for (var import in parsedEntities
        .where((e) => entity.imports.contains(e.name.snakeCase))) {
      import.setSourceName(source.name);

      if (import.imports.isNotEmpty) {
        _setSourceNameForImports(parsedEntities, import, source);
      }
    }
  }

  static void _addEntityImportClasses(List<Entity> parsedEntities) {
    for (var entity in parsedEntities) {
      for (final import in entity.imports) {
        if (entity.entityImports.isNotEmpty) {
          entity.entityImports.add(parsedEntities
              .firstWhere((element) => element.name == import.pascalCase));
          _addEntityImportClasses(entity.entityImports.toList());
        }
      }
    }
  }
}
