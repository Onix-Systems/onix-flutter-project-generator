import 'package:onix_flutter_bricks/domain/service/base/class_builder/class_builder.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

class FreezedClassBuilder extends ClassBuilder {
  final String _className;
  final String _classNameSuffix;

  Iterable<String> _imports = List.empty();
  Iterable<String> _baseConstructorProperties = List.empty();
  Iterable<String> _emptyConstructorProperties = List.empty();
  bool _withJsonAnnotation = true;

  set imports(Iterable<String> imports) => _imports = imports;

  set baseConstructorProperties(Iterable<String> baseConstructorProperties) =>
      _baseConstructorProperties = baseConstructorProperties;

  set emptyConstructorProperties(Iterable<String> emptyConstructorProperties) =>
      _emptyConstructorProperties = emptyConstructorProperties;

  set withJsonAnnotation(bool withJsonAnnotation) =>
      _withJsonAnnotation = withJsonAnnotation;

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
    lines.add('import \'package:freezed_annotation/freezed_annotation.dart\';');
    lines.addAll(_imports);
    lines.addNewLine();
    lines.add('part \'$classPartImport.freezed.dart\';');
    if (_withJsonAnnotation) {
      lines.add('part \'$classPartImport.g.dart\';');
    }
    lines.addNewLine();
    lines.add('@freezed');
    lines.add('class $classFullName with _\$$classFullName {');
    lines.add('factory $classFullName({');
    lines.addAll(_baseConstructorProperties);
    lines.add('}) = _$classFullName;');
    lines.addNewLine();
    if (_emptyConstructorProperties.isNotEmpty) {
      lines.add('factory $classFullName.empty() => $classFullName(');
      lines.addAll(_emptyConstructorProperties);
      lines.add(');');
      lines.addNewLine();
    }
    if (_withJsonAnnotation) {
      lines.add(
          'factory $classFullName.fromJson(Map<String, dynamic> json) => _\$${classFullName}FromJson(json);');
    }
    lines.add('}');
    lines.addNewLine();
    return super.build();
  }
}
