import 'package:onix_flutter_bricks/domain/service/base/class_builder/class_builder.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

// ignore_for_file: avoid_setters_without_getters
class FreezedClassBuilder extends ClassBuilder {
  final String _className;
  final String _classNameSuffix;

  Iterable<String> _imports = List.empty();
  Iterable<String> _baseConstructorProperties = List.empty();
  Iterable<String> _emptyConstructorProperties = List.empty();

  set imports(Iterable<String> imports) => _imports = imports;

  set baseConstructorProperties(Iterable<String> baseConstructorProperties) =>
      _baseConstructorProperties = baseConstructorProperties;

  set emptyConstructorProperties(Iterable<String> emptyConstructorProperties) =>
      _emptyConstructorProperties = emptyConstructorProperties;

  FreezedClassBuilder({
    required String className,
    String classNameSuffix = '',
  })  : _className = className,
        _classNameSuffix = classNameSuffix;

  @override
  String build() {
    final importSuffix =
        _classNameSuffix.isNotEmpty ? '_${_classNameSuffix.snakeCase}' : '';
    final classPartImport = '${_className.snakeCase}$importSuffix';
    final classFullName =
        '${_className.pascalCase}${_classNameSuffix.pascalCase}';
    lines
      ..add("import 'package:freezed_annotation/freezed_annotation.dart';")
      ..addAll(_imports)
      ..addNewLine()
      ..add("part '$classPartImport.freezed.dart';")
      ..addNewLine()
      ..add('@freezed')
      ..add('class $classFullName with _\$$classFullName {');
    if (_baseConstructorProperties.isEmpty) {
      lines.add('const factory $classFullName() = _$classFullName;');
    } else {
      lines
        ..add('factory $classFullName({')
        ..addAll(_baseConstructorProperties)
        ..add('}) = _$classFullName;');
    }
    lines.addNewLine();
    if (_emptyConstructorProperties.isNotEmpty) {
      lines
        ..add('factory $classFullName.empty() => $classFullName(')
        ..addAll(_emptyConstructorProperties)
        ..add(');');
    } else {
      lines.add('factory $classFullName.empty() => const $classFullName();');
    }
    lines
      ..addNewLine()
      ..add('}')
      ..addNewLine();
    return super.build();
  }
}
