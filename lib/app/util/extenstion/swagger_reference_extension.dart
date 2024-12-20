import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:recase/recase.dart';

extension SwaggerReferenceExtenson on SwaggerReference {
  String getReferenceMapperImport(String projectName) {
    final name = getTypeDeclaration(DataFileType.none).snakeCase;
    return "import 'package:$projectName/data/mapper/$name/${name}_mapper.dart';";
  }

  String getReferenceMapperDeclaration({bool private = true}) {
    final name = getTypeDeclaration(DataFileType.none);
    final visibilitySymbol = private ? '_' : '';
    return 'final $visibilitySymbol${name.camelCase}Mappers = ${name}Mappers();';
  }
}
