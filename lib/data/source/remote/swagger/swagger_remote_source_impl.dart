import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/app/util/enum/swagger_version_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_version_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/base_swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/base_swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response_unsupported.dart';
import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/tag/swagger_tag_response.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch_type.dart';

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
    if (swaggerVersion == SwaggerVersionType.unsupported) {
      return SwaggerResponse(
        swaggerModels: [],
        swaggerPaths: [],
        swaggerTags: [],
      );
    }

    final swaggerModels = List<BaseSwaggerModelResponse>.empty(growable: true);
    final swaggerPaths = List<BaseSwaggerPathResponse>.empty(growable: true);
    final swaggerTags = List<SwaggerTagResponse>.empty(growable: true);

    ///Tags are similar for all versions
    //get tags
    if (json.containsKey('tags')) {
      final tags = json.asObjectList('tags');
      for (final tag in tags) {
        final tagModel = SwaggerTagResponse.fromJson(tag);
        swaggerTags.add(tagModel);
      }
    } else {
      ///if there no tags key collect keys from requests
      if (json.containsKey('paths')) {
        final paths = json['paths'] as Map<String, dynamic>;
        paths.forEach(
          (path, value) {
            final pathRequestVariations = value as Map<String, dynamic>;
            final requestTags = pathRequestVariations.getTagsFromRequests();
            for (final tag in requestTags) {
              final thisTag =
                  swaggerTags.singleWhereOrNull((e) => e.name == tag);
              if (thisTag == null) {
                swaggerTags.add(SwaggerTagResponse(name: tag, description: ''));
              }
            }
          },
        );
      } else {
        return SwaggerResponse(
          swaggerModels: [],
          swaggerPaths: [],
          swaggerTags: [],
        );
      }
    }

    ///Requests paths are similar for all versions
    if (json.containsKey('paths')) {
      final paths = json['paths'] as Map<String, dynamic>;
      paths.forEach(
        (path, value) {
          final pathRequestVariations = value as Map<String, dynamic>;
          pathRequestVariations.forEach(
            (type, value) {
              final pathResponse = BaseSwaggerPathResponse.fromJson(
                swaggerVersion,
                path,
                type,
                arch,
                value as Map<String, dynamic>,
              );
              if (pathResponse is! SwaggerPathResponseUnsupported) {
                swaggerPaths.add(pathResponse);
              }
            },
          );
        },
      );
    } else {
      return SwaggerResponse(
        swaggerModels: [],
        swaggerPaths: [],
        swaggerTags: [],
      );
    }

    ///Check swagger version
    var objectsMap = <String, dynamic>{};
    switch (swaggerVersion) {
      case SwaggerVersionType.swagger2:
        {
          if (json.containsKey('definitions')) {
            objectsMap = json['definitions'] as Map<String, dynamic>;
            break;
          } else {
            return SwaggerResponse(
              swaggerModels: [],
              swaggerPaths: [],
              swaggerTags: [],
            );
          }
        }
      case SwaggerVersionType.swagger3:
        {
          if (json.containsKey('components')) {
            objectsMap = json['components']['schemas'] as Map<String, dynamic>;
          } else {
            return SwaggerResponse(
              swaggerModels: [],
              swaggerPaths: [],
              swaggerTags: [],
            );
          }
        }

      case SwaggerVersionType.unsupported:
        return SwaggerResponse(
          swaggerModels: [],
          swaggerPaths: [],
          swaggerTags: [],
        );
    }

    objectsMap.forEach(
      (name, value) {
        final swaggerModel = BaseSwaggerModelResponse.fromJson(
          swaggerVersion,
          name,
          arch,
          value as Map<String, dynamic>,
          objectsMap,
        );
        if (swaggerModel is! SwaggerModelResponseUnsupported) {
          swaggerModels.add(swaggerModel);
        }
      },
    );

    return SwaggerResponse(
      swaggerModels: swaggerModels,
      swaggerPaths: swaggerPaths,
      swaggerTags: swaggerTags,
    );
  }
}
