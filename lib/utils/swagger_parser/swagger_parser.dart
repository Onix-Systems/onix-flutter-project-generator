import 'dart:developer';

import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/base_parser.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/json_writer.dart';

class SwaggerParser implements BaseParser {
  String _basePath = '';

  @override
  String get basePath => _basePath;

  @override
  Future<void> parse(Map<String, dynamic> data) async {
    logger.d('Swagger Parser!');

    JsonWriter.write(json: data);

    log(data.toString());
  }
}
