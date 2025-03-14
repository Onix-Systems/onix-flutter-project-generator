import 'dart:convert';

import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/json_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/classes_from_json_dialog/bloc/class_from_json_view_models.dart';
import 'package:recase/recase.dart';

class ClassFromJsonViewCubit
    extends BaseCubit<ClassFromJsonViewState, ClassFromJsonViewSR> {
  String tabs([int count = 1]) => '  ' * count;

  ClassFromJsonViewCubit() : super(const ClassFromJsonViewState());

  void init(String json) {
    emit(state.copyWith(json: json));
    generate();
  }

  void onClassNameChange(String className) {
    emit(
      state.copyWith(
        className: className.isNotEmpty ? className : 'GeneratedClass',
      ),
    );
    generate();
  }

  void generate() {
    final generatedCode = _generateClassesFromJson(
      json: state.json,
      name: state.className,
    );
    emit(state.copyWith(generatedCode: generatedCode));
  }

  String _generateClassesFromJson({required String json, String? name}) {
    try {
      final parsed = jsonDecode(json) as Map<String, dynamic>;

      final fields = <DataVariableComponent>[];

      final classes = <String>{};

      for (final key in parsed.keys) {
        final value = parsed[key];
        var valueType = value.runtimeType.toString();

        if (value is Map<String, dynamic>) {
          valueType = key.pascalCase;
          final newClass = _generateClassesFromJson(
            json: jsonEncode(value),
            name: valueType,
          );

          classes.add(newClass);
        } else if (value is List) {
          if (value.first is Map<String, dynamic>) {
            valueType = key.pascalCase;
            final newClass = _generateClassesFromJson(
              json: jsonEncode(value.first),
              name: valueType,
            );

            classes.add(newClass);
          } else {
            valueType = value.first.runtimeType.toString();
          }
        }

        fields.add(
          _createVariable(
            valueType,
            key,
            false,
            value is List,
          ),
        );
      }

      final result = [
        'class ${name ?? 'GeneratedClass'} {',
        ...fields.map((e) => '${tabs()}final ${e.type} ${e.name};'),
        '\n${tabs()}${'${name ?? 'GeneratedClass'} ({'}',
        ...fields.map((e) => '${tabs(2)}required this.${e.name},'),
        '${tabs()}});',
        _generateToJson(fields),
        _generateFromJson(fields, name ?? 'GeneratedClass'),
        '}\n',
        ...classes,
      ];

      return result.join('\n');
    } catch (e) {
      onFailure(JsonParserFailure(e: e as Exception));
      return '';
    }
  }

  DataVariableComponent _createVariable(
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

  String _generateToJson(List<DataVariableComponent> variables) {
    final result = <String>['\n${tabs()}Map<String, dynamic> toJson() => {'];

    for (final variable in variables) {
      if (variable.type is SwaggerVariable) {
        result.add(
          "${tabs(2)}'${variable.name}': ${variable.name},",
        );
      } else if (variable.type is SwaggerReference) {
        result.add(
          "${tabs(2)}'${variable.name}': ${variable.name}.toJson(),",
        );
      } else if (variable.type is SwaggerArray) {
        final itemType = (variable.type as SwaggerArray).itemType.type;

        if (itemType is SwaggerVariable) {
          result.add(
            "${tabs(2)}'${variable.name}': ${variable.name},",
          );
        } else if (itemType is SwaggerReference) {
          result.add(
            "${tabs(2)}'${variable.name}': ${variable.name}.map((e) => e.toJson()).toList(),",
          );
        }
      }
    }

    result.add('${tabs()}};');

    return result.join('\n');
  }

  String _generateFromJson(List<DataVariableComponent> variables, String name) {
    final result = <String>[
      '\n${tabs()}factory $name.fromJson(Map<String, dynamic> json) => $name(',
    ];

    for (final variable in variables) {
      if (variable.type is SwaggerVariable) {
        final type = (variable.type as SwaggerVariable).type;

        result.add(
          "${tabs(2)}${variable.name}: json['${variable.name}'] as ${type.toSwaggerDartType()},",
        );
      } else if (variable.type is SwaggerReference) {
        final reference = variable.type as SwaggerReference;
        result.add(
          "${tabs(2)}${variable.name}: $reference.fromJson(json['${variable.name}'] as Map<String, dynamic>),",
        );
      } else if (variable.type is SwaggerArray) {
        final itemType = (variable.type as SwaggerArray).itemType.type;

        if (itemType is SwaggerVariable) {
          result.add(
            "${tabs(2)}${variable.name}: json['${variable.name}'] as List<${itemType.type.toSwaggerDartType()}>,",
          );
        } else if (itemType is SwaggerReference) {
          result.add(
            "${tabs(2)}${variable.name}: (json['${variable.name}'] as List<Map<String, dynamic>>).map($itemType.fromJson).toList(),",
          );
        }
      }
    }

    result.add('${tabs()});');

    return result.join('\n');
  }
}
