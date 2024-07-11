import 'dart:convert';

import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/dynamic_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model/swagger_model_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/path/swagger_path_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/swagger_response.dart';
import 'package:onix_flutter_bricks/data/model/swagger/tag/swagger_tag_response.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:http/http.dart' as http;

class SwaggerRemoteSourceImpl implements SwaggerRemoteSource {
  @override
  Future<SwaggerResponse> getSwaggerComponents({
    required String url,
  }) async {
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body) as Map<String, dynamic>;

    var version = -1;
    if (json.containsKey('swagger')) {
      final textVersion = (json['swagger'] as String).split('.').first;
      version = int.parse(textVersion);
    } else if (json.containsKey('openapi')) {
      final textVersion = (json['openapi'] as String).split('.').first;
      version = int.parse(textVersion);
    }
    if (version == -1) {
      return SwaggerResponse(
        swaggerModels: [],
        swaggerPaths: [],
        swaggerTags: [],
      );
    }

    final swaggerModels = List<SwaggerModelResponse>.empty(growable: true);
    final swaggerPaths = List<SwaggerPathResponse>.empty(growable: true);
    final swaggerTags = List<SwaggerTagResponse>.empty(growable: true);

    ///Tags are similar for all versions
    //get tags
    if (json.containsKey('tags')) {
      final tags = json.asObjectList('tags');
      for (var tag in tags) {
        final tagModel = SwaggerTagResponse.fromJsonAllVersions(tag);
        swaggerTags.add(tagModel);
      }
    } else {
      return SwaggerResponse(
        swaggerModels: [],
        swaggerPaths: [],
        swaggerTags: [],
      );
    }

    ///Requests paths are similar for all versions
    if (json.containsKey('paths')) {
      final paths = json['paths'] as Map<String, dynamic>;
      paths.forEach(
        (path, value) {
          final pathRequestVariations = value as Map<String, dynamic>;
          if (version == 2) {
            pathRequestVariations.forEach(
              (type, value) {
                final pathResponse = SwaggerPathResponse.fromJsonV2(
                  path,
                  type,
                  value,
                );
                swaggerPaths.add(pathResponse);
              },
            );
          } else if (version >= 3) {
            pathRequestVariations.forEach(
              (type, value) {
                final pathResponse = SwaggerPathResponse.fromJsonV3(
                  path,
                  type,
                  value,
                );
                swaggerPaths.add(pathResponse);
              },
            );
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

    ///Check swagger version
    if (version == 2) {
      if (json.containsKey('definitions')) {
        final definitions = json['definitions'] as Map<String, dynamic>;
        definitions.forEach(
          (name, value) {
            final swaggerModel = SwaggerModelResponse.fromJsonV2(
              name,
              value as Map<String, dynamic>,
            );
            swaggerModels.add(swaggerModel);
          },
        );
      } else {
        return SwaggerResponse(
          swaggerModels: [],
          swaggerPaths: [],
          swaggerTags: [],
        );
      }
    } else if (version >= 3) {
      if (json.containsKey('components')) {
        final definitions =
            json['components']['schemas'] as Map<String, dynamic>;
        definitions.forEach(
          (name, value) {
            if (value.containsKey('allOf')) {
              final allOff =
                  (value as Map<String, dynamic>).asObjectList('allOf');
              final crossReferences = _getCrossReferencesForV3(
                allOff,
                definitions,
              );
              final swaggerModel = SwaggerModelResponse.fromJsonV3(
                name,
                value,
                crossReferences,
              );
              swaggerModels.add(swaggerModel);
            } else {
              final swaggerModel = SwaggerModelResponse.fromJsonV3(
                name,
                value as Map<String, dynamic>,
                [],
              );
              swaggerModels.add(swaggerModel);
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

    return SwaggerResponse(
      swaggerModels: swaggerModels,
      swaggerPaths: swaggerPaths,
      swaggerTags: swaggerTags,
    );
  }

  List<SwaggerModelResponse> _getCrossReferencesForV3(
    List<Map<String, dynamic>> allOff,
    Map<String, dynamic> definitions,
  ) {
    final crossReferences = List<SwaggerModelResponse>.empty(growable: true);
    for (var e in allOff) {
      if (!e.containsKey('\$ref')) {
        continue;
      }
      final typeValue = (e['\$ref'] as String).split('/').last;
      if (definitions.containsKey(typeValue)) {
        final crossReference = SwaggerModelResponse.fromJsonV3(
          typeValue,
          definitions[typeValue] as Map<String, dynamic>,
          [],
        );
        crossReferences.add(crossReference);
      }
    }
    return crossReferences;
  }
}
