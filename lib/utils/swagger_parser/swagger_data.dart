import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';

class SwaggerData {
  final String basePath;
  final List<Entity> entities;
  final List<SourceWrapper> sources;

  SwaggerData({
    required this.basePath,
    required this.entities,
    required this.sources,
  });
}
