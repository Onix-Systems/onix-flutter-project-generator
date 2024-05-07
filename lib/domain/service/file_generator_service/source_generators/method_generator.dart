import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/base/params/base_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/inner_enum_file_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/inner_enum_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/method_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params/params_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/params_file_generator.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class MethodGenerator implements BaseGenerationService<String> {
  final _responseSuffix = 'Response';
  final _requestSuffix = 'Request';

  final _innerEnumGenerator = InnerEnumFileGenerator();
  final _paramsFileGenerator = ParamsFileGenerator();

  @override
  Future<String> generate(BaseGenerationParams params) async {
    if (params is! MethodGeneratorParams) {
      return '';
    }
    final responseIsEnum = dataComponentRepository.isEnum(
      dataComponentName:
          params.method.responseEntityName.stripRequestResponse(),
    );
    final method = params.method;

    final responseEntityName =
        method.responseEntityName.endsWith(_responseSuffix) || responseIsEnum
            ? method.responseEntityName
            : '${method.responseEntityName}$_responseSuffix';

    final requestEntityName =
        method.requestEntityName.endsWith(_requestSuffix) || responseIsEnum
            ? method.requestEntityName
            : '${method.requestEntityName}$_requestSuffix';

    if (method.responseEntityName.isNotEmpty) {
      final sourceName = dataComponentRepository
              .getDataComponentByName(
                  dataComponentName:
                      method.responseEntityName.stripRequestResponse())
              ?.sourceName ??
          '';

      if (responseIsEnum) {
        params.imports.add(
            "import 'package:${params.projectName}/domain/entity/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${method.responseEntityName.snakeCase}.dart';");
      } else {
        params.imports.add(
            "import 'package:${params.projectName}/data/model/remote/${sourceName.snakeCase}/${method.responseEntityName.stripRequestResponse().snakeCase}/${responseEntityName.snakeCase}.dart';");
      }
    }

    if (method.requestEntityName.isNotEmpty) {
      final sourceName = dataComponentRepository
              .getDataComponentByName(
                  dataComponentName: method.requestEntityName)
              ?.sourceName ??
          '';

      final innerEnumNameEquals = method.innerEnums.any(
        (element) => element.name == method.requestEntityName,
      );
      if (!(method.innerEnums.isNotEmpty && !innerEnumNameEquals)) {
        params.imports.add(
            "import 'package:${params.projectName}/data/model/remote/${sourceName.snakeCase}/${method.requestEntityName.stripRequestResponse().snakeCase}/${requestEntityName.snakeCase}.dart';");
      }
    }

    final methodParamsNotRequired = _generateMethodImports(
      method,
      params.imports,
      params.projectName,
      params.projectPath,
    );

    final methodRequestBodyPart = method.requestEntityName.isNotEmpty
        ? 'required ${method.requestEntityName.endsWith(_requestSuffix) ? method.requestEntityName : '${method.requestEntityName}$_requestSuffix'} ${method.requestEntityName.camelCase}'
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
        '${method.methodType.name}${_parsePathMethod(params.path.path, params.pathPrefix, params.source)}';

    methodParams =
        '{$methodParams${methodParamsNotRequired.isNotEmpty ? '${methodName.pascalCase}Params? params,' : ''}}';

    if (methodParams == '{}') methodParams = '';

    String generatedMethod =
        'Future<${method.responseEntityName.isNotEmpty ? 'DataResponse<$responseEntityName>' : method.responseRuntimeType.isNotEmpty ? 'DataResponse<${method.responseRuntimeType}>' : 'DataResponse<OperationStatus>'}> $methodName($methodParams);';

    ///Generate not required params
    if (methodParamsNotRequired.isNotEmpty) {
      params.imports.add(
          "import 'package:${params.projectName}/data/source/remote/${params.source.name.snakeCase}/params/${methodName.snakeCase}_params.dart';");
      await _paramsFileGenerator.generate(
        ParamsGeneratorParams(
          methodName: methodName,
          methodParamsNotRequired: methodParamsNotRequired,
          projectName: params.projectName,
          projectPath: params.projectPath,
          sourceName: params.source.name,
          innerEnums: method.innerEnums,
        ),
      );
    }

    ///Generate Enums
    if (method.innerEnums.isNotEmpty) {
      for (final innerEnum in method.innerEnums) {
        params.imports.add(
            'import \'package:${params.projectName}/data/model/remote/${params.source.name.snakeCase}/enums/${innerEnum.name.snakeCase}.dart\';');

        await _innerEnumGenerator.generate(
          InnerEnumGeneratorParams(
            innerEnum: innerEnum,
            projectName: params.projectName,
            projectPath: params.projectPath,
            sourceName: params.source.name,
          ),
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
            final sourceName = dataComponentRepository
                    .getDataComponentByName(
                        dataComponentName: parameter.type.snakeCase)
                    ?.sourceName ??
                '';

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
