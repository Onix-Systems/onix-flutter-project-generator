import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_variable_response.dart';
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

  String? getFileFolder(DataFileType fileType);

  String? getFileImportName(DataFileType fileType);

  String? getDefaultReturnType(DataFileType fileType);
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
  String? getFileImportName(DataFileType fileType) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType) => null;

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
    var clearName = reference;
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
      'return ${getTypeDeclaration(fileType)}.fromJson(response.data);';

  @override
  String? getFileImportName(DataFileType fileType) {
    return '${getFileFolder(fileType)}/${getFileName(fileType)}';
  }

  @override
  String? getFileName(DataFileType fileType) {
    var clearName = reference;
    if (fileType == DataFileType.none) {
      return '${clearName.snakeCase}.dart';
    }
    if (fileType == DataFileType.entity) {
      return '${clearName.snakeCase}.dart';
    }
    return '${clearName.snakeCase}_${fileType.name}.dart';
  }

  @override
  String? getFileFolder(DataFileType fileType) {
    final namePath = getTypeDeclaration(fileType).snakeCase;
    if (fileType == DataFileType.entity) {
      return 'domain/entity/$namePath';
    }

    return 'data/model/remote/${fileType.name}/$namePath';
  }

  @override
  String? getDefaultReturnType(DataFileType fileType) =>
      '${getTypeDeclaration(fileType)}.empty()';
}

class SwaggerArray extends SwaggerType {
  final SwaggerModelVariableResponse itemType;

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
      final codeLines = List<String>.empty(growable: true);
      codeLines.add('final jsonItems = response.data as List<dynamic>;');
      codeLines.add(
          'final items = jsonItems.map((e) => ${itemType.type.getTypeDeclaration(fileType)}.fromJson(e  as Map<String,dynamic>),).toList();');
      codeLines.add('return items;');
      return codeLines.join('\n');
    } else {
      return 'return response.data as List<${itemType.type.getTypeDeclaration(fileType)}>;';
    }
  }

  @override
  String? getFileImportName(DataFileType fileType) =>
      itemType.type.getFileImportName(fileType);

  @override
  String? getFileName(DataFileType fileType) =>
      itemType.type.getFileName(fileType);

  @override
  String? getFileFolder(DataFileType fileType) =>
      itemType.type.getFileFolder(fileType);

  @override
  String? getDefaultReturnType(fileType) => '[]';
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
  String? getFileImportName(DataFileType fileType) {
    return '${getFileFolder(fileType)}/${getFileName(fileType)}';
  }

  @override
  String? getFileName(DataFileType fileType) {
    return '${from.snakeCase}_${name.snakeCase}_type.dart';
  }

  @override
  String? getFileFolder(DataFileType fileType) => 'app/util/enums';

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
  String? getFileImportName(DataFileType fileType) =>
      'core/arch/domain/entity/common/operation_status.dart';

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType) => null;

  @override
  String? getDefaultReturnType(fileType) => null;
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
  String? getFileImportName(DataFileType fileType) => null;

  @override
  String? getFileName(DataFileType fileType) => null;

  @override
  String? getFileFolder(DataFileType fileType) => null;

  @override
  String? getDefaultReturnType(DataFileType fileType) => null;
}
