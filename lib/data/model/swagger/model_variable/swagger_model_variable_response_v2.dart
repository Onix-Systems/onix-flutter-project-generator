import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';

class SwaggerModelVariableResponseV2 extends BaseSwaggerModelVariableResponse {
  SwaggerModelVariableResponseV2({
    required super.name,
    required super.type,
    required super.isRequired,
  });

  factory SwaggerModelVariableResponseV2.fromJson(
    String name,
    List<String> requiredVariables,
    ArchType arch,
    Map<String, dynamic> json,
    String from,
  ) {
    SwaggerType? type;

    ///Check type
    if (json.containsKey('enum')) {
      final enumTypes = json.asStringList('enum');
      type = SwaggerEnum(
        name.clearEnumComponentName(),
        enumTypes,
        from: from,
      );
    } else if (json.containsKey('type')) {
      type = BaseSwaggerModelVariableResponse.parseSimpleType(
        name,
        from,
        arch,
        requiredVariables,
        json,
      );
    } else if (json.containsKey('\$ref')) {
      final typeValue =
          (json['\$ref'] as String).split('/').last.clearDataComponentsName();
      type = SwaggerReference(
        typeValue,
        from: from,
      );
    } else if (json.containsKey('schema')) {
      if (json['schema'].containsKey('type')) {
        type = BaseSwaggerModelVariableResponse.parseSimpleType(
          name,
          from,
          arch,
          requiredVariables,
          json['schema'],
        );
      } else {
        final typeValue = (json['schema']['\$ref'] as String)
            .split('/')
            .last
            .clearDataComponentsName();
        type = SwaggerReference(
          typeValue,
          from: from,
        );
      }
    }
    final isRequired = requiredVariables.contains(name);
    return SwaggerModelVariableResponseV2(
      name: name,
      type: type ?? SwaggerOperationDefault(),
      isRequired: (type == null) ? true : isRequired,
    );
  }
}
