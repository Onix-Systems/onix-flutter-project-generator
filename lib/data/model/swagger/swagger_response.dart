import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/tag/swagger_tag_response.dart';

import 'model/swagger_model_response.dart';

class SwaggerResponse {
  final List<SwaggerModelResponse> swaggerModels;
  final List<SwaggerPathResponse> swaggerPaths;
  final List<SwaggerTagResponse> swaggerTags;

  SwaggerResponse({
    required this.swaggerModels,
    required this.swaggerPaths,
    required this.swaggerTags,
  });
}
