import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch.dart';
import 'package:recase/recase.dart';

sealed class SwaggerType {
  final String from;

  SwaggerType({this.from = ''});

  @override
  String toString() {
    return getTypeDeclaration(DataFileType.none);
  }

  String getTypeDeclaration(DataFileType fileType);

  String getDefaultParserClosure(DataFileType fileType);

  String? getFileName(DataFileType fileType);

  String? getFileFolder(DataFileType fileType, Arch arch);

  String? getFileImportName(DataFileType fileType, Arch arch);

  String? getDefaultReturnType(DataFileType fileType);

  String? getFullFileImport(
    String projectName,
    DataFileType fileType,
    Arch arch,
  ) {
    final importName = getFileImportName(fileType, arch);
    if (importName == null) return null;
    return "import 'package:$projectName/$importName';";
  }
}

class SwaggerVariable extends SwaggerType {
  final String type;

  SwaggerVariable(
    this.type, {
    super.from,
  });

  @override
  String getTypeDeclaration(DataFileType fileType) => type.toSwaggerDartType();

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${type.getDefaultPrimitiveTypeClosure()};';

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType, Arch arch) => null;

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      type.getDefaultPrimitiveTypeClosure();
}

class SwaggerReference extends SwaggerType {
  final String reference;

  SwaggerReference(
    this.reference, {
    super.from,
  });

  @override
  String getTypeDeclaration(DataFileType fileType) {
    final clearName = reference;
    if (fileType == DataFileType.none) {
      return clearName.pascalCase;
    }
    if (fileType == DataFileType.entity) {
      return clearName.pascalCase;
    }
    return '${clearName.pascalCase}${fileType.name.pascalCase}';
  }

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${getTypeDeclaration(fileType)}.fromJson(response.data,);';

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) {
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
  String? getFileFolder(DataFileType fileType, Arch arch) {
    final namePath = getTypeDeclaration(fileType).snakeCase;
    final clearName = reference.snakeCase;
    if (fileType == DataFileType.entity) {
      return arch.getEntityPath(namePath);
    }

    return arch.getModelPath(
      arch == Arch.clean ? fileType.name : clearName,
      namePath,
    );
  }

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      '${getTypeDeclaration(fileType)}.empty()';
}

class SwaggerArray extends SwaggerType {
  final BaseSwaggerModelVariableResponse itemType;

  SwaggerArray(
    this.itemType, {
    super.from,
  });

  @override
  String getTypeDeclaration(DataFileType fileType) =>
      'List<${itemType.type.getTypeDeclaration(fileType)}>';

  @override
  String getDefaultParserClosure(DataFileType fileType) {
    if (itemType.type is SwaggerReference) {
      final codeLines = List<String>.empty(growable: true)
        ..add('final jsonItems = response.data as List<dynamic>;')
        ..add(
          'final items = jsonItems.map((e) => ${itemType.type.getTypeDeclaration(fileType)}.fromJson(e  as Map<String,dynamic>),).toList();',
        )
        ..add('return items;');
      return codeLines.join('\n');
    } else {
      return 'return response.data as List<${itemType.type.getTypeDeclaration(fileType)}>;';
    }
  }

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) =>
      itemType.type.getFileImportName(fileType, arch);

  @override
  String? getFileName(DataFileType fileType) =>
      itemType.type.getFileName(fileType);

  @override
  String? getFileFolder(DataFileType fileType, Arch arch) =>
      itemType.type.getFileFolder(fileType, arch);

  @override
  String? getDefaultReturnType(DataFileType fileType) => '[]';
}

class SwaggerEnum extends SwaggerType {
  final String name;

  final List<String> enumValues;

  SwaggerEnum(
    this.name,
    this.enumValues, {
    super.from,
  });

  @override
  String getTypeDeclaration(DataFileType fileType) =>
      '${from.pascalCase}${name.pascalCase}Type';

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return ${getTypeDeclaration(fileType)}.${enumValues.first.camelCase}';

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) {
    return '${getFileFolder(fileType, arch)}/${getFileName(fileType)}';
  }

  @override
  String? getFileName(DataFileType fileType) {
    return '${from.snakeCase}_${name.snakeCase}_type.dart';
  }

  @override
  String? getFileFolder(DataFileType fileType, Arch arch) => 'app/util/enums';

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      '${getTypeDeclaration(fileType)}.${enumValues.first.camelCase}';
}

class SwaggerOperationDefault extends SwaggerType {
  final type = 'OperationStatus';

  @override
  String getTypeDeclaration(DataFileType fileType) => type;

  @override
  String getDefaultParserClosure(DataFileType fileType) =>
      'return OperationStatus.success;';

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) =>
      '${getFileFolder(fileType, arch)}/${getFileName(fileType)}';

  @override
  String? getFileName(DataFileType fileType) => 'onix_flutter_core.dart';

  @override
  String? getFileFolder(DataFileType fileType, Arch arch) =>
      'onix_flutter_core';

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      'OperationStatus.success';

  @override
  String? getFullFileImport(
      String projectName, DataFileType fileType, Arch arch) {
    final importName = getFileImportName(fileType, arch);
    if (importName == null) return null;
    return "import 'package:$importName';";
  }
}

class SwaggerFile extends SwaggerType {
  final type = 'String';

  SwaggerFile({
    super.from,
  });

  @override
  String getTypeDeclaration(DataFileType fileType) => type;

  @override
  String getDefaultParserClosure(DataFileType fileType) => 'return ' ';';

  @override
  String? getFileImportName(DataFileType fileType, Arch arch) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType, Arch arch) => null;

  @override
  String? getDefaultReturnType(DataFileType fileType) => null;
}
