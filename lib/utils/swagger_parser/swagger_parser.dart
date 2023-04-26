import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/base_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/domain/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/domain/entity/type_matcher.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/json_writer.dart';

class SwaggerParser extends BaseParser {
  String _basePath = '';

  @override
  String get basePath => _basePath;

  @override
  Future<void> parse(Map<String, dynamic> data) async {
    logger.d('Swagger Parser!');

    //JsonWriter.write(json: data);

    final entities = data['definitions'].entries.map((e) {
      // print('e: key: {${e.key}}: value: {${e.value}}');
      final entity = Entity(
        name: e.key,
        properties:
            (e.value['properties'] as Map<String, dynamic>).entries.map((e) {
          bool isReference = false;
          if (e.value.toString().contains('\$ref: #/definitions/')) {
            isReference = true;
            logger.wtf(e.value['\$ref']);
          }

          var property = Property(
            name: e.key,
            type: isReference
                ? e.value
                    .toString()
                    .replaceAll('{', '')
                    .replaceAll('}', '')
                    .split('/')
                    .last
                    .replaceAll('}', '')
                : e.value['type'],
            nullable: e.value['nullable'] ?? false,
          );
          if (property.type == 'array') {
            property.type =
                'List<${TypeMatcher.getDartType(e.value['items']['type'])}>';
          }
          return property;
        }).toList(),
      );
      logger.d(entity);
      return entity;
    }).toList();
  }
}
