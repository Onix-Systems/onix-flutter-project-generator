import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method.dart';
import 'package:onix_flutter_bricks/domain/entity/source/method_parameter.dart';
import 'package:onix_flutter_bricks/domain/entity/source/path.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/repository/source_repository.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';
import 'package:recase/recase.dart';

class SourceRepositoryImpl implements SourceRepository {
  @override
  Source get timeSource => Source(
        name: 'Time',
        exists: true,
        isGenerated: false,
        dataComponentsNames: ['Time'],
      );

  final Set<Source> _sources = {};

  @override
  void empty() {
    _sources.clear();
  }

  @override
  Set<Source> get sources => _sources.map((e) => Source.copyOf(e)).toSet();

  @override
  bool containsNewComponents() => sourceRepository.sources.any((source) =>
      !source.exists ||
      dataComponentRepository.dataComponents
          .where((component) => !component.exists)
          .isNotEmpty);

  @override
  void addSource(Source source) {
    if (_sources
        .where((element) => element.name.pascalCase == source.name.pascalCase)
        .isEmpty) {
      source.name = source.name.pascalCase;
      _sources.add(source);
    }
  }

  @override
  void addAll(Set<Source> sources) {
    for (final source in sources) {
      addSource(source);
    }
  }

  @override
  Source? getSourceByName(String name) {
    return _sources.firstWhereOrNull(
        (element) => element.name.pascalCase == name.pascalCase);
  }

  @override
  void parse(Map<String, dynamic> data) {
    final sources = <Source>{};

    final paths = <Path>[];

    for (final path in data['paths'].entries) {
      final methods = <Method>[];

      if (path.value.entries.isEmpty) {
        continue;
      }

      if (!path.value.entries.toString().contains('tags')) {
        continue;
      }

      for (final entry in path.value.entries) {
        if (MethodType.values
            .where((element) => element.name == entry.key)
            .isEmpty) {
          continue;
        }

        final method = Method(
          methodType:
              MethodType.values.firstWhere((value) => value.name == entry.key),
          tags: entry.value['tags'].cast<String>(),
          entities: {},
        );

        if (entry.value.containsKey('parameters') &&
            entry.value['parameters'].isNotEmpty) {
          for (final parameter in entry.value['parameters']) {
            if (parameter['schema'] != null) {
              final isArray = parameter['schema']['type'] == 'array';
              final isEnum = parameter['schema']['type'] == 'string' &&
                  parameter['schema']['enum'] != null;

              if (TypeMatcher.isReference(parameter['schema']) ||
                  (isArray &&
                      TypeMatcher.isReference(parameter['schema']['items']))) {
                String entityName = isArray
                    ? _getRefClassName(parameter['schema']['items'])
                    : _getRefClassName(parameter['schema']);

                final entity =
                    dataComponentRepository.getDataComponentByName(entityName);

                if (entity == null) {
                  continue;
                }

                method.entities.add(entity);

                method.params.add(MethodParameter(
                    name: entityName.camelCase,
                    place: MethodPlace.values.firstWhere(
                        (element) => element.name == parameter['in']),
                    type: entityName,
                    isList: isArray,
                    nullable: parameter['required'] != null
                        ? !parameter['required']
                        : true));
              } else {
                if (isEnum) {
                  method.innerEnums.add(DataComponent(
                    name:
                        '${entry.value['operationId'].toString().pascalCase}${parameter['name'].toString().pascalCase}',
                    isEnum: true,
                    imports: {},
                    properties: List<Property>.generate(
                      parameter['schema']['enum']
                          .where((e) => e.runtimeType.toString() == 'String')
                          .toList()
                          .length,
                      (index) {
                        return Property(
                            name: parameter['schema']['enum']
                                .where(
                                    (e) => e.runtimeType.toString() == 'String')
                                .toList()[index]
                                .toString(),
                            type: "string");
                      },
                    ),
                  ));
                }

                method.params.add(MethodParameter(
                    name: parameter['name'],
                    place: MethodPlace.values.firstWhere(
                        (element) => element.name == parameter['in']),
                    type: isEnum
                        ? '${entry.value['operationId'].toString().pascalCase}${parameter['name'].toString().pascalCase}'
                        : TypeMatcher.getDartType(parameter['schema']['type']),
                    nullable: parameter['required'] != null
                        ? !parameter['required']
                        : true));
              }
            } else {
              final isArray = parameter['type'] == 'array';

              method.params.add(MethodParameter(
                  name: parameter['name'],
                  place: MethodPlace.values
                      .firstWhere((element) => element.name == parameter['in']),
                  type: TypeMatcher.getDartType(parameter['type']),
                  isList: isArray,
                  nullable: parameter['required'] != null
                      ? !parameter['required']
                      : true));
            }
          }
        }

        if (entry.value.containsKey('requestBody') &&
            entry.value['requestBody'].isNotEmpty) {
          for (final parameter
              in entry.value['requestBody']['content'].values) {
            if (parameter['schema'] == null) {
              continue;
            }

            if (TypeMatcher.isReference(parameter['schema'])) {
              String entityName = _getRefClassName(parameter['schema']);

              var entity =
                  dataComponentRepository.getDataComponentByName(entityName);

              if (entity == null) {
                entity = dataComponentRepository
                    .getDataComponentByName(entityName.stripRequestResponse());

                if (entity == null) {
                  continue;
                }
              }

              if (!entityName.contains('Request')) {
                entity.generateRequest = true;
              }

              method.entities.add(entity);
              method.setRequestEntityName(entity.name);
            }
          }
        }

        if (entry.value.containsKey('responses')) {
          _getMethodSchemaReference(entry, method);
        }

        methods.add(method);
      }

      paths.add(Path(path: path.key, methods: methods));
    }

    final tags = <String>{};

    for (final path in paths) {
      for (final method in path.methods) {
        for (final tag in method.tags) {
          if (tag.isNotEmpty) {
            tags.add(tag);
          }
        }
      }
    }

    for (final tag in tags) {
      final dependencies = <String>{};

      for (final path in paths) {
        for (final method in path.methods) {
          if (method.tags.contains(tag)) {
            dependencies.addAll(method.entities.map((e) => e.name));
          }
        }
      }

      final source = Source(
        name: tag
            .replaceAll(' ', '_')
            .replaceAll(RegExp('[^A-Za-z0-9_-]'), '')
            .pascalCase
            .replaceAll('Api', ''),
        paths: paths
            .where((element) =>
                element.methods.any((method) => method.tags.contains(tag)))
            .toList(),
        dataComponentsNames: dependencies.toList(),
      );
      sources.add(source);
    }

    addAll(sources);
  }

  void _getMethodSchemaReference(entry, Method method) {
    final responses = entry.value['responses'].entries
        .where((response) => response.key == '200' || response.key == '201');

    if (responses.isEmpty) {
      return;
    }

    for (final response in responses) {
      final schema = response.value.containsKey('content')
          ? response.value['content']['schema'] ??
                  response.value['content'].containsKey('application/json')
              ? response.value['content']['application/json']['schema']
              : response.value['content']['*/*']['schema']
          : response.value['schema'];

      if (schema == null) {
        return;
      }

      if (!TypeMatcher.isReference(schema) &&
          !TypeMatcher.isReferenceArray(schema)) {
        if (!schema.containsKey('type')) {
          return;
        }

        if (schema['type'] == 'array') {
          if (!schema.containsKey('items')) {
            return;
          }

          if (!TypeMatcher.isReference(schema['items'])) {
            method.setResponseRuntimeType(
                'List<${TypeMatcher.getDartType(schema['items']['type'])}>');
          }
        } else {
          if (schema is Map &&
              (schema.containsKey('additionalProperties') ||
                  schema.containsKey('properties'))) {
            method.setResponseRuntimeType('Map<String, dynamic>');
          } else {
            method.setResponseRuntimeType(
                TypeMatcher.getDartType(schema['type']));
          }
        }

        return;
      }

      if (method.methodType == MethodType.get) {
        method.setResponseEntityName(_getRefClassName(schema));
      }

      String entityName = _getRefClassName(schema);

      final entity = dataComponentRepository
          .getDataComponentByName(entityName.stripRequestResponse());

      if (entity == null) {
        continue;
      }

      entity.generateResponse = true;

      method.entities.add(entity);
    }
  }

  String _getRefClassName(Map<String, dynamic> ref) {
    if (ref.containsKey('items')) {
      return ref['items']
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split('/')
          .last;
    }
    return ref
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split('/')
        .last;
  }

  @override
  void addDataComponentToSource(Source source, DataComponent dataComponent) {
    dataComponent.name = dataComponent.name.pascalCase;
    _sources
        .firstWhere((element) => element.name == source.name)
        .dataComponentsNames
        .add(dataComponent.name);
  }

  @override
  void deleteDataComponentFromSource(
      Source source, DataComponent dataComponent) {
    _sources
        .firstWhere((element) => element.name == source.name)
        .dataComponentsNames
        .remove(dataComponent.name);
  }

  @override
  void deleteDataComponentFromAllSources(String name) {
    for (var source in _sources) {
      var dependants = source.dataComponentsNames
          .where((entity) => dataComponentRepository
              .getDataComponentByName(entity)!
              .properties
              .any((property) => property.type.pascalCase == name.pascalCase))
          .toList();

      for (var dependant in dependants) {
        final dependantComponent =
            dataComponentRepository.getDataComponentByName(dependant);
        dependantComponent!.properties.removeWhere(
            (property) => property.type.pascalCase == name.pascalCase);

        modifyDataComponentInSource(
            source.name, dependantComponent, dependantComponent.name);
      }
    }
  }

  @override
  void deleteSource(Source source) {
    _sources.remove(source);
  }

  @override
  void modifyDataComponentInSource(String sourceName,
      DataComponent dataComponent, String oldDataComponentName) {
    final source = _sources.firstWhere(
        (element) => element.name.pascalCase == sourceName.pascalCase);

    deleteDataComponentFromSource(
        source,
        dataComponentRepository
            .getDataComponentByName(oldDataComponentName.pascalCase)!);
    addDataComponentToSource(source, dataComponent);
  }

  @override
  void modifySource(Source source, String sourceName) {
    _sources.removeWhere((element) => element.name == sourceName);
    _sources.add(source);
  }

  @override
  void modifyDataComponentInAllSources(
      DataComponent dataComponent, String oldDataComponentName) {
    modifyDataComponentInSource(
        dataComponent.sourceName, dataComponent, oldDataComponentName);

    for (var source in _sources) {
      final dependants = source.dataComponentsNames
          .where((element) => dataComponentRepository
              .getDataComponentByName(element)!
              .properties
              .any((property) =>
                  property.type == oldDataComponentName.pascalCase))
          .toList();

      for (final dependant in dependants) {
        final dependantComponent =
            dataComponentRepository.getDataComponentByName(dependant);
        if (dependantComponent != null) {
          for (var property in dependantComponent.properties) {
            if (property.type == oldDataComponentName.pascalCase) {
              property.type = dataComponent.name.pascalCase;
            }
          }

          dependantComponent.imports.removeWhere((element) =>
              element.pascalCase == oldDataComponentName.pascalCase);
          dependantComponent.addImports([dataComponent.name.pascalCase]);
        }
      }
    }
  }

  @override
  void setAllExists() {
    for (final source in _sources) {
      source.exists = true;
    }
  }
}
