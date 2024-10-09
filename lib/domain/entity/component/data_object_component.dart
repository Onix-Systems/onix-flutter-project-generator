import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/enum/mapper_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_reference_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_sort_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/freezed_class_builder.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/json_class_builder.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:onix_flutter_bricks/util/reversed_word_processor.dart';
import 'package:recase/recase.dart';

part 'data_object_component.freezed.dart';

@freezed
class DataObjectComponent with _$DataObjectComponent {
  const DataObjectComponent._();

  const factory DataObjectComponent({
    required String name,
    required SwaggerReference fileReference,
    required List<DataVariableComponent> variables,
  }) = _DataObjectComponent;

  String getFilePath(DataFileType type) =>
      fileReference.getFileImportName(type) ?? '';

  String getFileFolder(DataFileType type) =>
      fileReference.getFileFolder(type) ?? '';

  String getFileName(DataFileType type) =>
      fileReference.getFileName(type) ?? '';

  String getClassName(DataFileType type) =>
      fileReference.getTypeDeclaration(type);

  String getObjectMapperFolder() =>
      'data/mapper/${fileReference.getTypeDeclaration(DataFileType.none).snakeCase}';

  String getObjectMapperFilePath() =>
      '${getObjectMapperFolder()}/${fileReference.getTypeDeclaration(DataFileType.none).snakeCase}_mapper.dart';

  String getObjectBody(
    String projectName,
    DataFileType type,
  ) {
    final imports = _getImports(projectName, type);
    late ClassBuilder classBuilder;
    switch (type) {
      case DataFileType.request:
        {
          final constructorProperties = _getJsonConstructorProperties(type);
          final declarations = _getJsonVariableDeclarations(type);
          classBuilder = JsonClassBuilder(className: getClassName(type))
            ..imports = imports
            ..baseConstructorProperties = constructorProperties
            ..variableDeclarations = declarations
            ..withToJson = true;
          break;
        }
      case DataFileType.response:
        {
          final constructorProperties = _getJsonConstructorProperties(type);
          final declarations = _getJsonVariableDeclarations(type);
          classBuilder = JsonClassBuilder(className: getClassName(type))
            ..imports = imports
            ..baseConstructorProperties = constructorProperties
            ..variableDeclarations = declarations;
          break;
        }
      case DataFileType.entity:
        {
          final constructorProperties = _getFreezedConstructorProperties(type);
          final emptyConstructorProperties =
              _getFreezedEmptyConstructorProperties(type);
          classBuilder = FreezedClassBuilder(className: getClassName(type))
            ..imports = imports
            ..baseConstructorProperties = constructorProperties
            ..emptyConstructorProperties = emptyConstructorProperties;
          break;
        }

      case DataFileType.none:
        return '';
    }

    return classBuilder.build();
  }

  String getMapperBody({
    required String projectName,
    required bool createEntityToRequestMapper,
    required bool createResponseToEntityMapper,
  }) {
    final responseName =
        fileReference.getTypeDeclaration(DataFileType.response);
    final requestName = fileReference.getTypeDeclaration(DataFileType.request);
    final entityName = fileReference.getTypeDeclaration(DataFileType.entity);

    final codeLines = List<String>.empty(growable: true);

    ///Add common imports
    if (createResponseToEntityMapper) {
      codeLines.add(
        "import 'package:$projectName/${fileReference.getFileImportName(DataFileType.response)}';",
      );
    }
    if (createEntityToRequestMapper) {
      codeLines.add(
        "import 'package:$projectName/${fileReference.getFileImportName(DataFileType.request)}';",
      );
    }
    codeLines
      ..add(
        "import 'package:$projectName/${fileReference.getFileImportName(DataFileType.entity)}';",
      )
      ..addAll(
        _getImports(
          projectName,
          DataFileType.response,
          createResponseToEntityMapper: createResponseToEntityMapper,
          createEntityToRequestMapper: createEntityToRequestMapper,
        ),
      )
      ..addAll(
        _getImports(
          projectName,
          DataFileType.entity,
          createResponseToEntityMapper: createResponseToEntityMapper,
          createEntityToRequestMapper: createEntityToRequestMapper,
        ),
      )
      ..add(
        "import 'package:onix_flutter_core/onix_flutter_core.dart';",
      );

    ///Add imports to different variables and their mappers
    for (final variable in variables) {
      final ref = variable.type.getSwaggerObjectReference();
      if (ref != null) {
        final variableImportName =
            ref.getTypeDeclaration(DataFileType.none).snakeCase;
        codeLines.add(
          "import 'package:$projectName/data/mapper/$variableImportName/${variableImportName}_mapper.dart';",
        );
      }
    }
    codeLines.addNewLine();
    final classNamePrefix = fileReference.getTypeDeclaration(DataFileType.none);

    ///Inner mapper class declaration
    ///Response to Entity
    if (createResponseToEntityMapper) {
      final objects =
          _getMapperObjectVariablesContent(MapperType.mapResponseToEntity);
      final classModifier = objects.isEmpty ? 'const ' : '';

      codeLines
        ..add(
          'class _Map${classNamePrefix}ResponseToEntity implements Mapper<$responseName, $entityName> {',
        )
        ..addNewLine()
        ..add('const _Map${classNamePrefix}ResponseToEntity();')
        ..add('@override')

        ///Mapper functions
        ..add('$entityName map($responseName from,) {')

        ///Declare inner objects mapper variables
        ..addAll(_getInnerMapperVariables())

        ///return function
        ..add('return $classModifier$entityName(')

        ///Use inner variable mapper for inner variables
        ..addAll(objects)
        ..add(');')
        ..add('}')
        ..add('}')
        ..addNewLine();
    }

    ///Entity to Request
    if (createEntityToRequestMapper) {
      final objects =
          _getMapperObjectVariablesContent(MapperType.mapEntityToRequest);
      final classModifier = objects.isEmpty ? 'const ' : '';

      codeLines
        ..add(
          'class _Map${classNamePrefix}EntityToRequest implements Mapper<$entityName, $requestName> {',
        )
        ..addNewLine()
        ..add('const _Map${classNamePrefix}EntityToRequest();')
        ..add('@override')

        ///Mapper functions
        ..add('$requestName map($entityName from,) {')

        ///Declare inner objects mapper variables
        ..addAll(_getInnerMapperVariables())

        ///return function
        ..add('return $classModifier$requestName(')

        ///Use inner variable mapper for inner variables
        ..addAll(objects)
        ..add(');')
        ..add('}')
        ..add('}');
    }
    codeLines
      ..addNewLine()

      ///Main mapper class declaration
      ..add('class ${classNamePrefix}Mappers {');
    if (createResponseToEntityMapper) {
      codeLines.add(
        'final _mapResponseToEntity = const _Map${classNamePrefix}ResponseToEntity();',
      );
    }
    if (createEntityToRequestMapper) {
      codeLines.add(
        'final _mapEntityToRequest = const _Map${classNamePrefix}EntityToRequest();',
      );
    }
    codeLines.addNewLine();
    if (createResponseToEntityMapper) {
      codeLines
        ..add('$entityName mapResponseToEntity($responseName from,) =>')
        ..add('_mapResponseToEntity.map(from);');
    }
    codeLines.addNewLine();
    if (createEntityToRequestMapper) {
      codeLines
        ..add('$requestName mapEntityToRequest($entityName from,) =>')
        ..add('_mapEntityToRequest.map(from);');
    }
    codeLines
      ..add('}')
      ..addNewLine();
    return codeLines.join('\n');
  }

  List<String> _getInnerMapperVariables() {
    final codeLines = <String>{};
    for (final variable in variables) {
      if (variable.type is SwaggerReference) {
        final reference = variable.type as SwaggerReference;
        codeLines.add(reference.getReferenceMapperDeclaration(private: false));
      } else if (variable.type is SwaggerArray) {
        final array = variable.type as SwaggerArray;
        if (array.itemType.type is SwaggerReference) {
          final reference = array.itemType.type as SwaggerReference;
          codeLines
              .add(reference.getReferenceMapperDeclaration(private: false));
        }
      }
    }
    return codeLines.toList();
  }

  List<String> _getMapperObjectVariablesContent(MapperType type) {
    final codeLines = List<String>.empty(growable: true);
    for (final variable in variables) {
      final variableName =
          ReservedWordProcessor.checkAndReplaceReservedWord(variable.name)
              .camelCase;

      if (variable.type is SwaggerReference) {
        final name = (variable.type as SwaggerReference)
            .getTypeDeclaration(DataFileType.none);

        if (variable.isRequired || type == MapperType.mapEntityToRequest) {
          codeLines.add(
            '$variableName: ${name.camelCase}Mappers.${type.name}(from.$variableName),',
          );
        } else {
          codeLines.add(
            '$variableName: (from.$variableName != null) ? ${name.camelCase}Mappers.${type.name}(from.$variableName!) : ${variable.type.getDefaultReturnType(DataFileType.entity)},',
          );
        }
      } else if (variable.type is SwaggerArray) {
        final array = variable.type as SwaggerArray;
        if (array.itemType.type is SwaggerReference) {
          final reference = array.itemType.type as SwaggerReference;
          final className = reference.getTypeDeclaration(DataFileType.none);
          if (variable.isRequired || type == MapperType.mapEntityToRequest) {
            codeLines.add(
              '$variableName: from.$variableName.map(${className.camelCase}Mappers.${type.name},).toList(),',
            );
          } else {
            codeLines.add(
              '$variableName: (from.$variableName != null) ? from.$variableName!.map(${className.camelCase}Mappers.${type.name},).toList() : [],',
            );
          }
        } else {
          if (variable.isRequired || type == MapperType.mapEntityToRequest) {
            codeLines.add('$variableName: from.$variableName,');
          } else {
            codeLines.add(
              '$variableName: from.$variableName ?? ${variable.type.getDefaultReturnType(DataFileType.entity)},',
            );
          }
        }
      } else {
        if (variable.isRequired || type == MapperType.mapEntityToRequest) {
          codeLines.add('$variableName: from.$variableName,');
        } else {
          codeLines.add(
            '$variableName: from.$variableName ?? ${variable.type.getDefaultReturnType(DataFileType.entity)},',
          );
        }
      }
    }

    return codeLines;
  }

  List<String> _getImports(
    String projectName,
    DataFileType type, {
    bool? createEntityToRequestMapper,
    bool? createResponseToEntityMapper,
  }) {
    final imports = List<SwaggerType>.empty(growable: true);
    final notNullImports =
        variables.where((e) => e.type.getFileImportName(type) != null);
    for (final e in notNullImports) {
      if (createEntityToRequestMapper != null &&
          createResponseToEntityMapper != null) {
        if (type == DataFileType.request) {
          if (createEntityToRequestMapper) {
            imports.add(e.type);
          }
        } else if (type == DataFileType.response) {
          if (createResponseToEntityMapper) {
            imports.add(e.type);
          }
        } else {
          imports.add(e.type);
        }
      } else {
        imports.add(e.type);
      }
    }
    return imports
        .map((e) => e.getFullFileImport(projectName, type) ?? '')
        .toList();
  }

  List<String> _getFreezedConstructorProperties(
    DataFileType type,
  ) {
    final sorted = variables.sortByRequired();

    return sorted.map((e) {
      final name =
          ReservedWordProcessor.checkAndReplaceReservedWord(e.name).camelCase;
      return 'required ${e.type.getTypeDeclaration(type)} $name,';
    }).toList();
  }

  List<String> _getFreezedEmptyConstructorProperties(
    DataFileType type,
  ) {
    final sorted = variables.sortByRequired();
    return sorted.map((e) {
      final name =
          ReservedWordProcessor.checkAndReplaceReservedWord(e.name).camelCase;
      return '$name: ${e.type.getDefaultReturnType(type)} ,';
    }).toList();
  }

  List<String> _getJsonConstructorProperties(
    DataFileType type,
  ) {
    final sorted = variables.sortByRequired();
    return sorted.map((e) {
      final name =
          ReservedWordProcessor.checkAndReplaceReservedWord(e.name).camelCase;
      final requiredPrefix = e.isRequired ? 'required' : '';
      return '$requiredPrefix this.$name,';
    }).toList();
  }

  List<String> _getJsonVariableDeclarations(
    DataFileType type,
  ) {
    final sorted = variables.sortByRequired();
    return sorted.map((e) {
      final requiredSuffix = e.isRequired ? '' : '?';
      final name =
          ReservedWordProcessor.checkAndReplaceReservedWord(e.name).camelCase;
      return "@JsonKey(name: '${e.name}')\nfinal ${e.type.getTypeDeclaration(type)}$requiredSuffix $name;";
    }).toList();
  }
}
