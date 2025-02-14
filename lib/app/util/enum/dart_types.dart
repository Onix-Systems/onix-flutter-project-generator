class DartTypes {
  static const List<String> types = ['String', 'int', 'double', 'bool'];

  static String toSwaggerType(String type) {
    switch (type) {
      case 'String':
        return 'string';
      case 'int':
        return 'integer';
      case 'double':
        return 'number';
      case 'bool':
        return 'boolean';
    }
    return '#ERR';
  }
}
