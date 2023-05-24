import 'package:onix_flutter_bricks/utils/swagger_parser/entity_parser/entity/entity.dart';

class EnumEntity implements Entity {
  @override
  final String name;
  @override
  final List<String> properties;
  @override
  String sourceName = '';

  EnumEntity({required this.name, required this.properties});

  @override
  void setSourceName(String sourceName) {
    if (this.sourceName.isEmpty) {
      this.sourceName = sourceName;
    }
  }

  @override
  String toString() {
    var result = '';

    result += '$name {';

    for (final property in properties) {
      result += '\n     $property,';
    }

    result += '\n}';
    return result;
  }

  String generateClassBody({required String projectName, String? sourceName}) {
    final properties = this
        .properties
        .map((e) => '       ${e == 'default' ? '//' : ''}$e,')
        .join('\n');

    return '''
enum $name{
    $properties
}''';
  }

  @override
  Set<String> get imports => {};

  @override
  Set<Entity> get entityImports => {};
}
