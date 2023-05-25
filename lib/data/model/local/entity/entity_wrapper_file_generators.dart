import 'package:onix_flutter_bricks/data/model/local/entity/entity_wrapper.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/use_case/generate_class_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/use_case/generate_enum_entity.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/use_case/generate_mapper.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/use_case/generate_request.dart';
import 'package:onix_flutter_bricks/data/model/local/entity/use_case/generate_response.dart';

extension FileGenerator on EntityWrapper {
  Future<void> generateFiles({
    required String projectName,
    required String projectPath,
  }) async {
    if (isEnum) {
      GenerateEnumEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    } else {
      GenerateClassEntity()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!isEnum && generateResponse) {
      GenerateResponse()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!isEnum && generateRequest) {
      GenerateRequest()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
    if (!isEnum && (generateRequest || generateResponse)) {
      GenerateMapper()(
        projectName: projectName,
        projectPath: projectPath,
        entityWrapper: this,
      );
    }
  }
}
