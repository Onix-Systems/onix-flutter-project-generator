import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/property.dart';
import 'package:onix_flutter_bricks/utils/swagger_parser/type_matcher.dart';
import 'package:recase/recase.dart';

part 'entity_wrapper.g.dart';

@JsonSerializable()
class EntityWrapper {
  String name;
  bool generateRequest;
  bool generateResponse;
  bool exists;
  String classBody;
  List<Property> properties;
  bool isEnum;

  EntityWrapper({
    required this.name,
    this.generateRequest = false,
    this.generateResponse = false,
    this.exists = false,
    this.classBody = '',
    this.properties = const [],
    this.isEnum = false,
  });

  EntityWrapper.copyOf(EntityWrapper entity)
      : this(
          name: entity.name,
          generateRequest: entity.generateRequest,
          generateResponse: entity.generateResponse,
          exists: entity.exists,
          classBody: entity.classBody,
        );

  Map<String, dynamic> toJson() => _$EntityWrapperToJson(this);

  factory EntityWrapper.fromJson(Map<String, dynamic> json) =>
      _$EntityWrapperFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityWrapper &&
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
    if (!isEnum && generateResponse) {
      _generateResponse(projectPath: projectPath, sourceName: sourceName);
    }
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
    final imports = classBody
        .replaceAll('\$\$', '\'')
        .split('\n')
        .where((element) => element.startsWith('import'))
        .join('\n');

    final fileContent = '''$imports

part '${name.snakeCase}_response.freezed.dart';
part '${name.snakeCase}_response.g.dart';

@freezed
class ${name.pascalCase}Response with _\$${name.pascalCase}Response {
    factory ${name.pascalCase}Response({
${properties.map((e) => '        ${TypeMatcher.getDartType(e.type)}? ${e.name},').join('\n')}
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
