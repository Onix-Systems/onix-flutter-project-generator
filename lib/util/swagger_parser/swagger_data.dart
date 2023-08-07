import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

class SwaggerData {
  final String basePath;
  final Set<DataComponent> dataComponents;
  final Set<Source> sources;

  SwaggerData({
    required this.basePath,
    required this.dataComponents,
    required this.sources,
  });
}
