import 'package:onix_flutter_bricks/domain/entity/json_class_variable.dart';
import 'package:onix_flutter_bricks/domain/service/base/class_builder/class_builder.dart';
import 'package:onix_flutter_bricks/util/extension/codelines_extension.dart';
import 'package:recase/recase.dart';

// ignore_for_file: avoid_setters_without_getters
class JsonClassBuilder extends ClassBuilder {
  final String _className;
  final String _classNameSuffix;

  Iterable<String> _imports = List.empty();

  Iterable<String> _variableDeclarations = List.empty();
  Iterable<String> _baseConstructorProperties = List.empty();

  bool _withToJson = true;

  set withToJson(bool withToJson) => _withToJson = withToJson;

  set imports(Iterable<String> imports) => _imports = imports;

  set baseConstructorProperties(Iterable<String> baseConstructorProperties) =>
      _baseConstructorProperties = baseConstructorProperties;

  set variableDeclarations(Iterable<String> variableDeclarations) =>
      _variableDeclarations = variableDeclarations;

  JsonClassBuilder({
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
      ..add("import 'package:json_annotation/json_annotation.dart';")
      ..addAll(_imports)
      ..addNewLine()
      ..add("part '$classPartImport.g.dart';")
      ..addNewLine()
      ..add('@JsonSerializable()')
      ..add('class $classFullName {')
      ..addNewLine()
      ..addAll(_variableDeclarations)
      ..addNewLine();
    if (_variableDeclarations.isEmpty) {
      lines.add('const $classFullName();');
    } else {
      lines
        ..add('const $classFullName({')
        ..addAll(_baseConstructorProperties)
        ..add('});');
    }
    lines
      ..addNewLine()
      ..add(
        'factory $classFullName.fromJson(Map<String, dynamic> json,) '
        '=> _\$${classFullName}FromJson(json);',
      );

    if (_withToJson) {
      lines
        ..addNewLine()
        ..add(
          'Map<String, dynamic> toJson() => _\$${classFullName}ToJson(this);',
        );
    }
    lines
      ..add('}')
      ..addNewLine();
    return super.build();
  }

  static Iterable<String> variablesFromJsonVariable(
    Iterable<JsonClassVariable> input,
  ) {
    return input.map(
      (e) {
        final variableDeclaration = List<String>.empty(growable: true)
          ..add('@JsonKey(includeIfNull: false)')
          ..addNewLine()
          ..add('final ${e.dartType}${e.nullable ? '?' : ''} ${e.name};');
        return variableDeclaration.join('\n');
      },
    );
  }

  static Iterable<String> constructorPropertiesFromJsonVariable(
    Iterable<JsonClassVariable> input,
  ) {
    return input.map(
      (e) {
        final prefix = e.nullable ? '' : 'required';
        return '$prefix this.${e.name},';
      },
    );
  }
}
