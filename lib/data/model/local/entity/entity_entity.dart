import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/core/di/di.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:recase/recase.dart';

part 'entity_entity.g.dart';

@JsonSerializable()
class EntityEntity {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  String classBody;
  List<Property> properties;
  bool isEnum;

  EntityEntity({
    required this.name,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.classBody = '',
    this.properties = const [],
    this.isEnum = false,
  });

  EntityEntity.copyOf(EntityEntity entity)
      : this(
          name: entity.name,
          generateRequest: entity.generateRequest,
          generateResponse: entity.generateResponse,
          exists: entity.exists,
          classBody: entity.classBody,
        );

  Map<String, dynamic> toJson() => _$EntityEntityToJson(this);

  factory EntityEntity.fromJson(Map<String, dynamic> json) =>
      _$EntityEntityFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          generateRequest == other.generateRequest &&
          generateResponse == other.generateResponse;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'EntityEntity{name: $name, exists: $exists, generateRequest: $generateRequest, generateResponse: $generateResponse, classBody: $classBody, properties: $properties}';
  }

  Future<void> generateFiles(
      {required String projectPath, String sourceName = ''}) async {
    await _generateEntity(projectPath: projectPath, sourceName: sourceName);
    if (!isEnum && generateRequest)
      _generateResponse(projectPath: projectPath, sourceName: sourceName);
  }

  Future<void> _generateEntity(
      {required String projectPath, String sourceName = ''}) async {
    final fileContent = classBody.replaceAll('\$\$', '\'');

    final path = await Directory(
            '$projectPath/lib/domain/entity/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file = await File('${path.path}/${name.snakeCase}.dart').create();

    await file.writeAsString(fileContent);
  }

  Future<void> _generateResponse(
      {required String projectPath, String sourceName = ''}) async {
    final fileContent =
        '''import 'package:freezed_annotation/freezed_annotation.dart';

part '${name.snakeCase}_response.freezed.dart';
part '${name.snakeCase}_response.g.dart';

@freezed
class ${name.pascalCase}Response with _\$${name.pascalCase}Response {
    factory ${name.pascalCase}Response({
        String? name,
    }) = _${name.pascalCase}Response;

    factory ${name.pascalCase}Response.fromJson(Map<String, dynamic> json) => _\$${name.pascalCase}ResponseFromJson(json);
}''';

    final path = await Directory(
            '$projectPath/lib/data/model/remote/${sourceName.isNotEmpty ? '${sourceName.snakeCase}/' : ''}${name.snakeCase}')
        .create(recursive: true);

    var file =
        await File('${path.path}/${name.snakeCase}_response.dart').create();

    await file.writeAsString(fileContent);
  }
}
