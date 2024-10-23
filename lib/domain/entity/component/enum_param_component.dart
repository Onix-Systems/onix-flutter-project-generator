import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

part 'enum_param_component.freezed.dart';

@freezed
class EnumParamComponent with _$EnumParamComponent {
  const EnumParamComponent._();

  const factory EnumParamComponent({
    required String name,
    required SwaggerEnum type,
  }) = _EnumParamComponent;

  String getFolderPath(String projectRoot) => '$projectRoot/app/util/enums';

  String getFilePath(String projectRoot) =>
      '${getFolderPath(projectRoot)}/${type.getFileName(DataFileType.none)}';

  String getEnumFileBody() {
    final codeLines = List<String>.empty(growable: true)
      ..addNewLine()
      ..add('enum ${type.getTypeDeclaration(DataFileType.none)} {');
    for (final e in type.enumValues) {
      codeLines.add('${e.camelCase},');
    }
    codeLines.add('}');
    return codeLines.join('\n');
  }
}
