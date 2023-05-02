import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/source_parser/entity/source.dart';

class SwaggerData {
  final String basePath;
  final List<Entity> entities;
  final List<Source> sources;

  SwaggerData({
    required this.basePath,
    required this.entities,
    required this.sources,
  });
}
