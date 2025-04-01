import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class EnumParamComponent extends Component {
  final SwaggerEnum type;

  EnumParamComponent({
    required String name,
    required this.type,
    super.fromSwagger = true,
  }) : super(name: name.pascalCase);

  String getFolderPath(String projectRoot, ArchType arch) =>
      '$projectRoot/${arch.getEnumPath()}';

  String getFilePath(String projectRoot, ArchType arch) =>
      '${getFolderPath(projectRoot, arch)}/${type.getFileName(DataFileType.none)}';

  String getEnumFileBody() {
    final codeLines = List<String>.empty(growable: true)
      ..addNewLine()
      ..add('//ignore_for_file: constant_identifier_names')
      ..add('enum ${type.getTypeDeclaration(DataFileType.none)} {');
    for (final e in type.enumValues) {
      codeLines.add('${e.camelCase},');
    }
    codeLines.add('}');
    return codeLines.join('\n');
  }

  @override
  String getString({int level = 1}) {
    final variablesString =
        '${'  ' * level}{${type.enumValues.map((e) => e).join(', ')}}';

    return variablesString;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.toJson(),
      'fromSwagger': true,
    };
  }

  factory EnumParamComponent.fromJson(Map<String, dynamic> json) {
    return EnumParamComponent(
      name: json['name'] as String,
      type: SwaggerEnum(
        json['type']['name'] as String,
        (json['type']['enumValues'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      ),
    );
  }
}
