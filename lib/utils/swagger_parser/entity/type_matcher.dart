class TypeMatcher {
  static const String _typeString = 'string';
  static const String _typeInteger = 'integer';
  static const String _typeNumber = 'number';
  static const String _typeBoolean = 'boolean';
  static const String _typeArray = 'array';
  static const String _typeObject = 'object';
  static const String _typeEnum = 'enum';

  static bool isString(String type) => type == _typeString;

  static bool isInteger(String type) => type == _typeInteger;

  static bool isNumber(String type) => type == _typeNumber;

  static bool isBoolean(String type) => type == _typeBoolean;

  static bool isArray(String type) => type == _typeArray;

  static bool isEnum(String type) => type == _typeEnum;

  static bool isObject(String type) => type == _typeObject;

  static bool isReference(Map<String, dynamic> type) =>
      type.containsKey(r'$ref');

  static String getDartType(String type) {
    if (isString(type)) {
      return 'String';
    } else if (isInteger(type)) {
      return 'int';
    } else if (isNumber(type)) {
      return 'double';
    } else if (isBoolean(type)) {
      return 'bool';
    } else if (isArray(type)) {
      return 'List';
    } else if (isEnum(type)) {
      return 'String';
    } else if (isObject(type)) {
      return 'Map';
    } else {
      return type;
    }
  }
}
