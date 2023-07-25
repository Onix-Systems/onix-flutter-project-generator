import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/domain/entity/entity.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_class_entity.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_enum_entity.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_mapper.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_request.dart';
import 'package:onix_flutter_bricks/domain/use_case/entity/generate_response.dart';

extension FileGenerator on Entity {
  Future<void> generateFiles({
    required String projectName,
    required String projectPath,
  }) async {
    if (isEnum) {
      logger.wtf('Generate enum: $name');
      GenerateEnumEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entity: this,
      );
    } else {
      logger.wtf('Generate class: $name');
      GenerateClassEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entity: this,
      );
    }
    if (!isEnum && generateResponse) {
      logger.wtf('Generate response: $name');
      GenerateResponse()(
        projectName: projectName,
        projectPath: projectPath,
        entity: this,
      );
    }
    if (!isEnum && generateRequest) {
      logger.wtf('Generate request: $name');
      GenerateRequest()(
        projectName: projectName,
        projectPath: projectPath,
        entity: this,
      );
    }
    if (!isEnum && (generateRequest || generateResponse)) {
      logger.wtf('Generate mapper: $name');
      GenerateMapper()(
        projectName: projectName,
        projectPath: projectPath,
        entity: this,
      );
    }
  }
}
