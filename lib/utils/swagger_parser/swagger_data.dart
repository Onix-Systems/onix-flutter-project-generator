import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source/source_entity.dart';

class SwaggerData {
  final String basePath;
  final List<EntityWrapper> entities;
  final List<SourceEntity> sources;

  SwaggerData({
    required this.basePath,
    required this.entities,
    required this.sources,
  });
}
