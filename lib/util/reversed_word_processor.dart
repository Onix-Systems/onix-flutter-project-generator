import 'package:recase/recase.dart';

class ReservedWordProcessor {
  static bool isReservedWord(String name) {
    return _reservedWords[name.toLowerCase()] ?? false;
  }

  static String changeVariableName(String name) => '${name}Variable';

  static String checkAndReplaceReservedWord(String name) {
    if (isReservedWord(name)) {
      return changeVariableName(name).camelCase;
    }
    return name.camelCase;
  }

  static const Map<String, bool> _reservedWords = {
    'abstract': true,
    'as': true,
    'assert': true,
    'async': true,
    'await': true,
    'break': true,
    'case': true,
    'catch': true,
    'class': true,
    'const': true,
    'continue': true,
    'covariant': true,
    'default': true,
    'deferred': true,
    'do': true,
    'dynamic': true,
    'else': true,
    'enum': true,
    'export': true,
    'extends': true,
    'extension': true,
    'external': true,
    'factory': true,
    'false': true,
    'final': true,
    'finally': true,
    'for': true,
    'Function': true,
    'get': true,
    'goto': true,
    'if': true,
    'implements': true,
    'import': true,
    'in': true,
    'interface': true,
    'is': true,
    'late': true,
    'library': true,
    'mixin': true,
    'new': true,
    'null': true,
    'on': true,
    'operator': true,
    'part': true,
    'required': true,
    'rethrow': true,
    'return': true,
    'set': true,
    'show': true,
    'static': true,
    'super': true,
    'switch': true,
    'sync': true,
    'this': true,
    'throw': true,
    'true': true,
    'try': true,
    'typedef': true,
    'var': true,
    'void': true,
    'while': true,
    'with': true,
    'yield': true
  };

  const ReservedWordProcessor._();
}
