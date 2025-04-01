import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:recase/recase.dart';

sealed class SwaggerType {
  final String from;

  SwaggerType({this.from = ''});

  @override
  String toString() {
    return getTypeDeclaration(DataFileType.none);
  }

  String getName();

  String getTypeDeclaration(DataFileType fileType);

  String getDefaultParserClosure(DataFileType fileType);

  String? getFileName(DataFileType fileType);

  String? getFileFolder(DataFileType fileType, ArchType arch);

  String? getFileImportName(DataFileType fileType, ArchType arch);

  String? getDefaultReturnType(DataFileType fileType);

  String? getFullFileImport(
    String projectName,
    DataFileType fileType,
    ArchType arch,
  ) {
    final importName = getFileImportName(fileType, arch);
    if (importName == null) return null;
    return "import 'package:$projectName/$importName';";
  }

  Map<String, dynamic> toJson() {
    var object = <String, dynamic>{};

    switch (runtimeType) {
      case SwaggerVariable:
        object = (this as SwaggerVariable).getJson();
      case SwaggerReference:
        object = (this as SwaggerReference).getJson();
      case SwaggerArray:
        object = (this as SwaggerArray).getJson();
      case SwaggerEnum:
        object = (this as SwaggerEnum).getJson();
      case SwaggerFile:
        object = (this as SwaggerFile).getJson();
      case SwaggerAllOf:
        object = (this as SwaggerAllOf).getJson();
      case SwaggerOperationDefault:
      default:
        object = (this as SwaggerOperationDefault).getJson();
    }

    return {
      'type': runtimeType.toString(),
      ...object,
    };
  }

  factory SwaggerType.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;

    switch (type) {
      case 'SwaggerReference':
        return SwaggerReference(
          json['reference'] as String,
        );
      case 'SwaggerArray':
        return SwaggerArray(
          SwaggerModelVariableResponseV3(
            name: json['itemType']['name'] as String,
            type: SwaggerType.fromJson(
              json['itemType']['type'] as Map<String, dynamic>,
            ),
            isRequired: json['itemType']['isRequired'] as bool,
          ),
        );
      case 'SwaggerEnum':
        return SwaggerEnum(
          json['name'] as String,
          (json['enumValues'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );
      case 'SwaggerFile':
        return SwaggerFile(from: json['from'] as String);
      case 'SwaggerAllOf':
        return SwaggerAllOf(
          name: json['name'] as String,
          parameters: (json['parameters'] as List<dynamic>)
              .map((e) => SwaggerType.fromJson(e))
              .toList(),
        );
      case 'SwaggerVariable':
      default:
        return SwaggerVariable(
          json['type'] as String,
        );
    }
  }
}

class SwaggerVariable extends SwaggerType {
  final String type;

  SwaggerVariable(
    this.type, {
    super.from,
  });

  @override
  String getName() => type;

  @override
  String getTypeDeclaration(DataFileType fileType) => type.toSwaggerDartType();

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${type.getDefaultPrimitiveTypeClosure()};';

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) => null;

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      type.getDefaultPrimitiveTypeClosure();

  Map<String, dynamic> getJson() {
    return {
      'type': type,
    };
  }
}

class SwaggerReference extends SwaggerType {
  final String reference;

  SwaggerReference(
    String reference, {
    super.from,
  }) : reference = reference.pascalCase;

  @override
  String getName() => reference;

  @override
  String getTypeDeclaration(DataFileType fileType) {
    final clearName = reference;
    if (fileType == DataFileType.none) {
      return clearName;
    }
    if (fileType == DataFileType.entity) {
      return clearName;
    }
    return '$clearName${fileType.name.pascalCase}';
  }

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${getTypeDeclaration(fileType)}.fromJson(response.data,);';

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) {
    return '${getFileFolder(fileType, arch)}/${getFileName(fileType)}';
  }

  @override
  String? getFileName(DataFileType fileType) {
    final clearName = reference;
    if (fileType == DataFileType.none) {
      return '${clearName.snakeCase}.dart';
    }
    if (fileType == DataFileType.entity) {
      return '${clearName.snakeCase}.dart';
    }
    return '${clearName.snakeCase}_${fileType.name}.dart';
  }

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) {
    final namePath = getTypeDeclaration(fileType).snakeCase;
    final clearName = reference.snakeCase;
    final folderName = arch == ArchType.clean ? fileType.name : clearName;
    if (fileType == DataFileType.entity) {
      return arch.getEntityPath(
        folderName,
        namePath,
      );
    }

    return arch.getModelPath(
      folderName,
      namePath,
    );
  }

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      '${getTypeDeclaration(fileType)}.empty()';

  Map<String, dynamic> getJson() {
    return {
      'reference': reference,
    };
  }
}

class SwaggerArray extends SwaggerType {
  final BaseSwaggerModelVariableResponse itemType;

  SwaggerArray(
    this.itemType, {
    super.from,
  });

  @override
  String getName() => itemType.name;

  @override
  String getTypeDeclaration(DataFileType fileType) =>
      'List<${itemType.type.getTypeDeclaration(fileType)}>';

  @override
  String getDefaultParserClosure(DataFileType fileType) {
    if (itemType.type is SwaggerReference) {
      final codeLines = List<String>.empty(growable: true)
        ..add('final jsonItems = response.data as List<dynamic>;')
        ..add(
          'final items = jsonItems.map((e) => '
          '${itemType.type.getTypeDeclaration(fileType)}.fromJson(e '
          'as Map<String,dynamic>),).toList();',
        )
        ..add('return items;');
      return codeLines.join('\n');
    } else {
      return 'return response.data as '
          'List<${itemType.type.getTypeDeclaration(fileType)}>;';
    }
  }

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) =>
      itemType.type.getFileImportName(fileType, arch);

  @override
  String? getFileName(DataFileType fileType) =>
      itemType.type.getFileName(fileType);

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) =>
      itemType.type.getFileFolder(fileType, arch);

  @override
  String? getDefaultReturnType(DataFileType fileType) => '[]';

  Map<String, dynamic> getJson() {
    return {
      'itemType': itemType.toJson(),
    };
  }
}

class SwaggerEnum extends SwaggerType {
  final String name;

  final List<String> enumValues;

  SwaggerEnum(
    String name,
    this.enumValues, {
    super.from,
  }) : name = name.pascalCase;

  @override
  String getName() => name;

  @override
  String getTypeDeclaration(DataFileType fileType) {
    if (fileType == DataFileType.response || fileType == DataFileType.request) {
      return 'String';
    }
    return '$from$name';
  }

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${getTypeDeclaration(fileType)}.values.first';

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) {
    return '${getFileFolder(fileType, arch)}/${getFileName(fileType)}';
  }

  @override
  String? getFileName(DataFileType fileType) {
    return '${from.isNotEmpty ? '${from.snakeCase}_' : ''}${name.snakeCase}.dart';
  }

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) =>
      arch.getEnumPath();

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      '${getTypeDeclaration(fileType)}.${enumValues.first.camelCase}';

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'enumValues': enumValues,
    };
  }
}

class SwaggerOperationDefault extends SwaggerType {
  final type = 'OperationStatus';

  @override
  String getName() => type;

  @override
  String getTypeDeclaration(DataFileType fileType) => type;

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return OperationStatus.success;';

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) => null;
  // '${getFileFolder(fileType, arch)}/${getFileName(fileType)}';

  @override
  String? getFileName(DataFileType fileType) => 'onix_flutter_core.dart';

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) =>
      'onix_flutter_core';

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      'OperationStatus.success';

  @override
  String? getFullFileImport(
    String projectName,
    DataFileType fileType,
    ArchType arch,
  ) {
    final importName = getFileImportName(fileType, arch);
    if (importName == null) return null;
    return "import 'package:$importName';";
  }

  Map<String, dynamic> getJson() {
    return {
      'type': type,
    };
  }
}

class SwaggerFile extends SwaggerType {
  final type = 'String';

  SwaggerFile({
    super.from,
  });

  @override
  String getName() => type;

  @override
  String getTypeDeclaration(DataFileType fileType) => type;

  @override
  String getDefaultParserClosure(DataFileType fileType) => 'return ' ';';

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) => null;

  @override
  String? getDefaultReturnType(DataFileType fileType) => null;

  Map<String, dynamic> getJson() {
    return {
      'type': 'string',
    };
  }
}

class SwaggerAllOf extends SwaggerType {
  final String name;
  final List<SwaggerType> parameters;

  SwaggerAllOf({
    required String name,
    required this.parameters,
    super.from,
  }) : name = name.pascalCase;

  @override
  String getName() => name;

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      parameters.first.getDefaultParserClosure(fileType);

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      parameters.first.getDefaultReturnType(fileType);

  @override
  String? getFileFolder(DataFileType fileType, ArchType arch) =>
      parameters.first.getFileFolder(fileType, arch);

  @override
  String? getFileImportName(DataFileType fileType, ArchType arch) =>
      parameters.first.getFileImportName(fileType, arch);

  @override
  String? getFileName(DataFileType fileType) =>
      parameters.first.getFileName(fileType);

  @override
  String getTypeDeclaration(DataFileType fileType) => name;

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'parameters': parameters.map((e) => e.toJson()).toList(),
    };
  }
}
