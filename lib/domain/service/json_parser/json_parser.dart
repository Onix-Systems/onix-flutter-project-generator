import 'dart:convert';

import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/json_parser_failure.dart';
import 'package:onix_flutter_bricks/core/arch/result/result.dart';
import 'package:recase/recase.dart';

class JsonParser {
  static Result<List<DataObjectComponent>> parseJson(
    String json,
    String? name,
  ) {
    try {
      final parsed = jsonDecode(json) as Map<String, dynamic>;

      final fields = <DataVariableComponent>[];

      final children = <DataObjectComponent>{};

      final resultName = name?.pascalCase ?? 'GeneratedClass';

      for (final key in parsed.keys) {
        final value = parsed[key];
        var valueType = value.runtimeType.toString();

        if (value == null ||
            (value is Map && value.isEmpty) ||
            (value is List && value.isEmpty)) {
          valueType = 'UndefinedValue';

          children.add(
            DataObjectComponent(
              name: valueType,
              fileReference: SwaggerReference(valueType),
              variables: [
                DataVariableComponent(
                  name: 'value',
                  type: SwaggerVariable('integer'),
                  isRequired: false,
                ),
              ],
              fromSwagger: false,
            ),
          );
        } else if (value is Map<String, dynamic> ||
            (value is List && value.first is Map<String, dynamic>)) {
          valueType = key;
          final newClassResult = parseJson(
            jsonEncode(value is List ? value.first : value),
            valueType,
          );

          if (newClassResult.isError) {
            return Result.error(error: newClassResult.asError.error);
          }

          for (final child in newClassResult.data) {
            children.add(child);
          }
        } else if (value is List) {
          valueType = value.first.runtimeType.toString();
        }

        fields.add(
          _createVariable(
            valueType,
            key,
            true,
            value is List,
          ),
        );
      }

      final component = DataObjectComponent(
        name: resultName,
        fileReference: SwaggerReference(resultName),
        variables: fields,
        fromSwagger: false,
      );

      return Result.ok([component, ...children]);
    } catch (e) {
      return Result.error(
        error: JsonParserFailure(
          failureText: e.toString(),
        ),
      );
    }
  }

  static DataVariableComponent _createVariable(
    String type,
    String name,
    bool isRequired,
    bool isList,
  ) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final component = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
    );

    final variable = isList
        ? DataVariableComponent(
            name: name.camelCase,
            type: SwaggerArray(
              SwaggerModelVariableResponseV3(
                name: name.camelCase,
                type: variableType,
                isRequired: isRequired,
              ),
            ),
            isRequired: isRequired,
          )
        : component;
    return variable;
  }
}
