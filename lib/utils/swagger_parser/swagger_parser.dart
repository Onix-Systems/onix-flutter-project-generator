import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_entity.dart';
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

    final sources = parsedSources.map((e) {
      final entitiesToMove = parsedEntities
          .where((element) => e.entities.contains(element.name))
          .toSet();

      final importsToMove = <Entity>{};

      for (final entity in parsedEntities
          .where((element) => e.entities.contains(element.name))) {
        final imports = entity.imports.toSet();

        for (final import in imports) {
          final entityToMove = parsedEntities
              .firstWhere((element) => element.name == import.pascalCase);

          entitiesToMove.add(entityToMove);
          importsToMove.add(entityToMove);
        }
      }

      parsedEntities
          .removeWhere((element) => e.entities.contains(element.name));

      for (final import in importsToMove) {
        if (parsedEntities
            .where((element) => element.name == import.name)
            .isNotEmpty) {
          parsedEntities.removeWhere((element) => element.name == import.name);
        }
      }

      return SourceEntity(
        name: e.name,
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
}
