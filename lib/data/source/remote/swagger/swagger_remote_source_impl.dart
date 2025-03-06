import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_version_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/base_swagger_model_variable_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/tag/swagger_tag_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_response_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:recase/recase.dart';

class SwaggerRemoteSourceImpl implements SwaggerRemoteSource {
  const SwaggerRemoteSourceImpl();

  @override
  Future<SwaggerResponse> getSwaggerComponents({
    required String url,
    required ArchType arch,
  }) async {
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    ///Get Swagger version
    final swaggerVersion = json.getSwaggerVersion();
    if (swaggerVersion == SwaggerVersionType.unsupported ||
        !json.containsKey('paths')) {
      return SwaggerResponse(
        swaggerModels: [],
        swaggerPaths: [],
        swaggerTags: [],
      );
    }

    final swaggerModels = List<BaseSwaggerModelResponse>.empty(growable: true);
    final swaggerPaths = List<BaseSwaggerPathResponse>.empty(growable: true);
    final swaggerTags = List<SwaggerTagResponse>.empty(growable: true);

    _parseModels(swaggerVersion, arch, swaggerModels, json);

    _parseTags(json, swaggerTags);

    _parsePaths(json, swaggerVersion, arch, swaggerModels, swaggerPaths);

    return SwaggerResponse(
      swaggerModels: swaggerModels,
      swaggerPaths: swaggerPaths,
      swaggerTags: swaggerTags,
    );
  }

  void _parsePaths(
    Map<String, dynamic> json,
    SwaggerVersionType swaggerVersion,
    ArchType arch,
    List<BaseSwaggerModelResponse> swaggerModels,
    List<BaseSwaggerPathResponse> swaggerPaths,
  ) {
    ///Requests paths are similar for all versions
    (json['paths'] as Map<String, dynamic>).forEach(
      (path, value) {
        (value as Map<String, dynamic>).forEach(
          (type, value) {
            final pathResponse = BaseSwaggerPathResponse.fromJson(
              swaggerVersion,
              path,
              type,
              arch,
              value as Map<String, dynamic>,
            );

            final allOfResponses = pathResponse.output
                .where((element) => element.variable.type is SwaggerAllOf)
                .toList();

            pathResponse.output.removeWhere(
              (element) => element.variable.type is SwaggerAllOf,
            );

            for (final response in allOfResponses) {
              final allOf = response.variable.type as SwaggerAllOf;
              final allOfVariables = allOf.parameters;

              final parameters = <SwaggerType>[];

              for (final variable in allOfVariables) {
                if (variable is SwaggerAllOf) {
                  parameters.addAll(
                    variable.parameters,
                  );

                  logger.f('allOf variable: $variable');
                }
              }

              allOfVariables
                ..removeWhere(
                  (element) => element is SwaggerAllOf,
                )
                ..addAll(parameters);

              final model = SwaggerModelResponseV3(
                name: allOf.name,
                type: allOf.name,
                variables: allOfVariables
                    .map(
                      (e) => SwaggerModelVariableResponseV3(
                        name: e.getName(),
                        type: e,
                        isRequired: true,
                      ),
                    )
                    .toList(),
              );

              swaggerModels.add(model);

              pathResponse.output.add(
                SwaggerResponseType(
                  SwaggerModelVariableResponseV3(
                    name: response.variable.name,
                    type: SwaggerReference(model.name),
                    isRequired: true,
                  ),
                ),
              );
            }

            if (pathResponse is! SwaggerPathResponseUnsupported) {
              swaggerPaths.add(pathResponse);
            }
          },
        );
      },
    );
  }

  void _parseTags(
    Map<String, dynamic> json,
    List<SwaggerTagResponse> swaggerTags,
  ) {
    ///Tags are similar for all versions
    //get tags
    if (json.containsKey('tags') && json.asObjectList('tags').isNotEmpty) {
      final tags = json.asObjectList('tags');
      for (final tag in tags) {
        final tagModel = SwaggerTagResponse.fromJson(tag);
        swaggerTags.add(tagModel);
      }
    } else {
      ///if there no tags key collect keys from requests
      (json['paths'] as Map<String, dynamic>).forEach(
        (path, value) {
          final pathRequestVariations = value as Map<String, dynamic>;
          final requestTags = pathRequestVariations.getTagsFromRequests();
          for (final tag in requestTags) {
            final thisTag = swaggerTags.singleWhereOrNull((e) => e.name == tag);
            if (thisTag == null) {
              swaggerTags.add(SwaggerTagResponse(name: tag, description: ''));
            }
          }
        },
      );
    }
  }

  void _parseModels(
    SwaggerVersionType swaggerVersion,
    ArchType arch,
    List<BaseSwaggerModelResponse> swaggerModels,
    Map<String, dynamic> json,
  ) {
    var objectsMap = <String, dynamic>{};
    switch (swaggerVersion) {
      case SwaggerVersionType.swagger2:
        {
          if (json.containsKey('definitions')) {
            objectsMap = json['definitions'] as Map<String, dynamic>;
            break;
          } else {
            return;
          }
        }
      case SwaggerVersionType.swagger3:
        {
          if (json.containsKey('components')) {
            objectsMap = json['components']['schemas'] as Map<String, dynamic>;
          } else {
            return;
          }
        }

      case SwaggerVersionType.unsupported:
        return;
    }

    objectsMap.forEach((key, value) {
      final swaggerModel = BaseSwaggerModelResponse.fromJson(
        swaggerVersion,
        key,
        arch,
        value as Map<String, dynamic>,
        objectsMap,
      );
      if (swaggerModel is! SwaggerModelResponseUnsupported) {
        swaggerModels.add(swaggerModel);
      }
    });

    ///Fix map generated enum params to models
    final enumModels =
        swaggerModels.where((element) => element.type == 'enum').toList();

    final objectModels =
        swaggerModels.where((element) => element.type == 'object').toList();

    if (enumModels.isEmpty) {
      return;
    }

    for (final model in objectModels) {
      if (model.variables.any(
        (variable) => _variableIsEnum(variable) || _variableMayBeEnum(variable),
      )) {
        final enumVariables = model.variables
            .where(
              (element) =>
                  _variableIsEnum(element) || _variableMayBeEnum(element),
            )
            .toList();

        for (final enumVariable in enumVariables) {
          if (enumVariable.type is SwaggerEnum) {
            final variable = enumVariable.type as SwaggerEnum;

            var sourceEnumModel = enumModels.firstWhereOrNull(
              (model) => model.name == variable.name.pascalCase,
            );

            if (sourceEnumModel != null) {
              model.variables
                ..remove(enumVariable)
                ..add(
                  SwaggerModelVariableResponseV3(
                    name: enumVariable.name,
                    type: SwaggerReference(sourceEnumModel.name),
                    isRequired: true,
                  ),
                );
            } else {
              final variableValues = variable.enumValues;

              sourceEnumModel = enumModels.firstWhereOrNull(
                (model) =>
                    (model.variables.first.type as SwaggerEnum).enumValues ==
                    variableValues,
              );

              if (sourceEnumModel != null) {
                logger.f('sourceEnumModel: ${sourceEnumModel.name}');
              }
            }
          } else if (enumVariable.type is SwaggerArray &&
              (enumVariable.type as SwaggerArray).itemType.type
                  is SwaggerEnum) {
            final variable = (enumVariable.type as SwaggerArray).itemType.type
                as SwaggerEnum;

            var sourceEnumModel = enumModels.firstWhereOrNull(
              (model) => model.name == variable.name.pascalCase,
            );

            if (sourceEnumModel != null) {
              model.variables
                ..remove(enumVariable)
                ..add(
                  SwaggerModelVariableResponseV3(
                    name: enumVariable.name,
                    type: SwaggerArray(
                      SwaggerModelVariableResponseV3(
                        name: sourceEnumModel.name,
                        type: SwaggerReference(sourceEnumModel.name),
                        isRequired: enumVariable.isRequired,
                      ),
                    ),
                    isRequired: true,
                  ),
                );
            } else {
              final variableValues = variable.enumValues;

              sourceEnumModel = enumModels.firstWhereOrNull(
                (model) {
                  return setEquals(
                    (model.variables.first.type as SwaggerEnum)
                        .enumValues
                        .toSet(),
                    variableValues.toSet(),
                  );
                },
              );

              if (sourceEnumModel != null) {
                model.variables
                  ..remove(enumVariable)
                  ..add(
                    SwaggerModelVariableResponseV3(
                      name: enumVariable.name,
                      type: SwaggerArray(
                        SwaggerModelVariableResponseV3(
                          name: sourceEnumModel.name,
                          type: SwaggerReference(sourceEnumModel.name),
                          isRequired: enumVariable.isRequired,
                        ),
                      ),
                      isRequired: true,
                    ),
                  );
              }
            }
          } else if (_variableMayBeEnum(enumVariable)) {
            final variable = (enumVariable.type as SwaggerArray).itemType.type
                as SwaggerReference;

            final sourceEnumModel = enumModels.firstWhereOrNull(
              (model) => model.name == variable.reference.pascalCase,
            );

            if (sourceEnumModel != null) {
              model.variables
                ..remove(enumVariable)
                ..add(
                  SwaggerModelVariableResponseV3(
                    name: enumVariable.name,
                    type: SwaggerArray(
                      SwaggerModelVariableResponseV3(
                        name: sourceEnumModel.name,
                        type: SwaggerReference(sourceEnumModel.name),
                        isRequired: enumVariable.isRequired,
                      ),
                    ),
                    isRequired: true,
                  ),
                );
            }
          }
        }
      }
    }
  }

  bool _variableIsEnum(BaseSwaggerModelVariableResponse variable) {
    return variable.type is SwaggerEnum ||
        (variable.type is SwaggerArray &&
            (variable.type as SwaggerArray).itemType.type is SwaggerEnum);
  }

  bool _variableMayBeEnum(BaseSwaggerModelVariableResponse variable) {
    return variable.type is SwaggerArray &&
        (variable.type as SwaggerArray).itemType.type is SwaggerReference;
  }
}
