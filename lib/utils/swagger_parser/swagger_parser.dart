import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/entity_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';

class SwaggerParser {
  static Future<SwaggerData> parse(
      {required Map<String, dynamic> data, required String projectName}) async {
    final String basePath = data['basePath'] ?? '';
    final parsedEntities = await EntityParser.parse(data);

    final entities = parsedEntities
        .map(
          (e) => EntityEntity(
              name: e.name,
              generateRequest: true,
              generateResponse: true,
              classBody: e.generateClassBody(projectName: projectName),
              properties: e.properties is List<Property>
                  ? e.properties as List<Property>
                  : []),
        )
        .toList();

    final parsedSources = await SourceParser.parse(data);

    final sources = parsedSources.map((e) {
      final entitiesToMove = entities
          .where((element) => e.entities.contains(element.name))
          .toList();

      entities.removeWhere((element) => e.entities.contains(element.name));

      return SourceEntity(
        name: e.name,
        entities: entitiesToMove,
      );
    }).toList();

    logger.d('Entities: $entities');
    return SwaggerData(
      basePath: basePath,
      entities: entities,
      sources: sources,
    );
  }
}
