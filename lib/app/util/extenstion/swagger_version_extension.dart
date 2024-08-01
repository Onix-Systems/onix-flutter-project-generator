import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';

extension SwaggerVersionExtension on Map<String, dynamic> {
  SwaggerVersionType getSwaggerVersion() {
    var version = -1;
    if (containsKey('swagger')) {
      final textVersion = (this['swagger'] as String).split('.').first;
      version = int.parse(textVersion);
    } else if (containsKey('openapi')) {
      final textVersion = (this['openapi'] as String).split('.').first;
      version = int.parse(textVersion);
    }
    if (version == 2) {
      return SwaggerVersionType.swagger2;
    } else if (version == 3) {
      return SwaggerVersionType.swagger3;
    }
    return SwaggerVersionType.unsupported;
  }
}
