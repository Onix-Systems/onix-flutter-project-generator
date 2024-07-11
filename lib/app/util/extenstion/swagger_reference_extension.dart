import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:recase/recase.dart';

extension SwaggerReferenceExtenson on SwaggerReference {
  String getReferenceMapperImport(String projectName) {
    final name = getTypeDeclaration(DataFileType.none).snakeCase;
    return 'import \'package:$projectName/data/mapper/$name/${name}_mapper.dart\';';
  }

  String getReferenceMapperDeclaration() {
    final name = getTypeDeclaration(DataFileType.none);
    return 'final _${name.camelCase}Mappers = ${name}Mappers();';
  }
}
