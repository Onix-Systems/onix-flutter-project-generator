import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/tag/swagger_tag_response.dart';

class SwaggerResponse {
  final List<BaseSwaggerModelResponse> swaggerModels;
  final List<BaseSwaggerPathResponse> swaggerPaths;
  final List<SwaggerTagResponse> swaggerTags;

  SwaggerResponse({
    required this.swaggerModels,
    required this.swaggerPaths,
    required this.swaggerTags,
  });
}
