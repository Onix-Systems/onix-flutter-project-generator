import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';

extension SwaggerTypeExtension on String {
  String toSwaggerDartType() {
    //['string', 'integer', 'boolean', 'number']
    switch (this) {
      case 'string':
        return 'String';
      case 'integer':
        return 'int';
      case 'boolean':
        return 'bool';
      case 'number':
        return 'double';
    }
    return '#ERR';
  }

  String getDefaultPrimitiveTypeClosure() {
    //['string', 'integer', 'boolean', 'number']
    switch (this) {
      case 'string':
        return '\'\'';
      case 'integer':
        return '-1';
      case 'boolean':
        return 'false';
      case 'number':
        return '-1';
    }
    return '#ERR';
  }
}

extension SwaggerTypeRefExtension on SwaggerType {
  SwaggerReference? getSwaggerObjectReference() {
    if (this is SwaggerReference) {
      return this as SwaggerReference;
    } else if (this is SwaggerArray) {
      final array = this as SwaggerArray;
      if (array.itemType is SwaggerReference) {
        return array.itemType as SwaggerReference;
      }
    }
    return null;
  }

  SwaggerEnum? getSwaggerEnumReference() {
    if (this is SwaggerEnum) {
      return this as SwaggerEnum;
    } else if (this is SwaggerArray) {
      final array = this as SwaggerArray;
      if (array.itemType is SwaggerEnum) {
        return array.itemType as SwaggerEnum;
      }
    }
    return null;
  }
}
