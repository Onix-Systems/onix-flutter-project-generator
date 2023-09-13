import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/inner_enum_file_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params_file_generator.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class MethodGenerator {
  static Future<String> call({
    required Method method,
    required Path path,
    required String pathPrefix,
    required Set<String> imports,
    required String projectName,
    required String projectPath,
    required Source source,
  }) async {
    final responseIsEnum = sourceRepository.checkEntityIsEnum(
        entityName: method.responseEntityName);

    final responseEntityName =
        method.responseEntityName.endsWith('Response') || responseIsEnum
            ? method.responseEntityName
            : '${method.responseEntityName}Response';

    final requestEntityName =
        method.requestEntityName.endsWith('Request') || responseIsEnum
            ? method.requestEntityName
            : '${method.requestEntityName}Request';

    if (method.responseEntityName.isNotEmpty) {
      final sourceName = sourceRepository
          .getDataComponentSourceName(method.responseEntityName);

      if (responseIsEnum) {
        imports.add(
            "import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${method.responseEntityName.snakeCase}.dart';");
      } else {
        imports.add(
            "import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${responseEntityName.snakeCase}.dart';");
      }
    }

    if (method.requestEntityName.isNotEmpty) {
      final sourceName =
          sourceRepository.getDataComponentSourceName(method.requestEntityName);

      if (!(method.innerEnums.isNotEmpty &&
          !method.innerEnums
              .any((element) => element.name == method.requestEntityName))) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${sourceName.snakeCase}/${method.requestEntityName.stripRequestResponse().snakeCase}/${requestEntityName.snakeCase}.dart';");
      }
    }

    final methodParamsNotRequired =
        _generateMethodImports(method, imports, projectName, projectPath);

    final methodRequestBodyPart = method.requestEntityName.isNotEmpty
        ? 'required ${method.requestEntityName.endsWith('Request') ? method.requestEntityName : '${method.requestEntityName}Request'} ${method.requestEntityName.camelCase}'
        : '';

    final methodRequestParamsPart = method.params.isNotEmpty
        ? method.params
            .where((param) => !param.nullable)
            .map((param) => 'required ${param.type} ${param.name.camelCase}')
            .join(', ')
        : '';

    String methodParams =
        '$methodRequestBodyPart${methodRequestBodyPart.isNotEmpty ? ', ' : ''}$methodRequestParamsPart${methodRequestParamsPart.isNotEmpty ? ', ' : ''}';

    final methodName =
        '${method.methodType.name}${_parsePathMethod(path.path, pathPrefix, source)}';

    methodParams =
        '{$methodParams${methodParamsNotRequired.isNotEmpty ? '${methodName.pascalCase}Params? params,' : ''}}';

    if (methodParams == '{}') methodParams = '';

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<$responseEntityName>' : method.responseRuntimeType.isNotEmpty ? 'DataResponse<${method.responseRuntimeType}>' : 'DataResponse<OperationStatus>'}> $methodName($methodParams);';

    if (methodParamsNotRequired.isNotEmpty) {
      imports.add(
          "import 'package:$projectName/data/source/remote/${source.name.snakeCase}/params/${methodName.snakeCase}_params.dart';");
      await ParamsFileGenerator.call(
        methodName: methodName,
        methodParamsNotRequired: methodParamsNotRequired,
        projectName: projectName,
        projectPath: projectPath,
        sourceName: source.name,
        innerEnums: method.innerEnums,
      );
    }

    if (method.innerEnums.isNotEmpty) {
      for (final innerEnum in method.innerEnums) {
        imports.add(
            "import 'package:$projectName/data/model/remote/${source.name.snakeCase}/enums/${innerEnum.name.snakeCase}.dart';");

        await InnerEnumFileGenerator.call(
          innerEnum: innerEnum,
          projectName: projectName,
          projectPath: projectPath,
          sourceName: source.name,
        );
      }
    }

    return generatedMethod;
  }

  static String _parsePathMethod(String path, String prefix, Source source) {
    final pathParts = <String>[];

    if (prefix.contains('{')) {
      pathParts.addAll(prefix.split('/'));
    } else {
      pathParts.addAll(path.replaceFirst(prefix, '').split('/'));
    }

    String result = pathParts.last.startsWith('{')
        ? '${pathParts.sublist(0, pathParts.length - 1).join('/').pascalCase}By${pathParts.last.replaceAll(RegExp('[{}]'), '').pascalCase}'
        : pathParts.join('/').pascalCase;

    if (result.contains('{')) {
      final resultParts = result.split('{');
      final lastPart = resultParts.last.split('}').last;

      result =
          '${resultParts.first}${resultParts.first.endsWith(source.name) ? '' : source.name}$lastPart';
    }

    return result.isEmpty ? prefix.replaceFirst('/', '').pascalCase : result;
  }

  static Set<Property> _generateMethodImports(Method method,
      Set<String> imports, String projectName, String projectPath) {
    final methodParamsNotRequired = <Property>{};

    if (method.params.isNotEmpty) {
      for (final parameter in method.params) {
        if (parameter.type.isNotEmpty) {
          if (!parameter.nullable) {
            final sourceName = sourceRepository
                .getDataComponentSourceName(parameter.type.snakeCase);

            if (sourceName.isNotEmpty &&
                !method.innerEnums.any((element) =>
                    element.name.snakeCase == parameter.type.snakeCase)) {
              imports.add(
                  "import 'package:$projectName/domain/entity/${sourceName.snakeCase}/${parameter.type.snakeCase}/${parameter.type.snakeCase}.dart';");
            }
          } else {
            methodParamsNotRequired.add(parameter);
          }
        }
      }
    }

    return methodParamsNotRequired;
  }
}
