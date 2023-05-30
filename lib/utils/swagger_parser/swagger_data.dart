import 'package:onix_flutter_bricks/data/model/local/entity_wrapper/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';

class SwaggerData {
  final String basePath;
  final List<EntityWrapper> entities;
  final List<SourceWrapper> sources;

  SwaggerData({
    required this.basePath,
    required this.entities,
    required this.sources,
  });
}
