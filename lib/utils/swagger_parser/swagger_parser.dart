import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/path_parser/source_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/swagger_data.dart';

class SwaggerParser {
  static Future<SwaggerData> parse(Map<String, dynamic> data) async {
    final String basePath = data['basePath'] ?? '';
    final entities = await EntityParser.parse(data);
    final sources = await SourceParser.parse(data);
    logger.d('Entities: $entities');
    return SwaggerData(
        basePath: basePath, entities: entities, sources: sources);
  }
}
