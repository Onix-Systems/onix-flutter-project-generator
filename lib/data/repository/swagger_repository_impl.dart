import 'package:collection/collection.dart';
import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/mapper/swagger/swagger_mapper.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class SwaggerRepositoryImpl implements SwaggerRepository {
  Components _components = Components.empty();
  final SwaggerRemoteSource _swaggerSource;
  final _swaggerMapper = SwaggerMapper();

  @override
  Components get components => _components;

  SwaggerRepositoryImpl(this._swaggerSource);

  @override
  Future<Result<Components>> fetchSwaggerData({
    required String url,
    required ArchType arch,
    bool? overwriteDuplicates,
  }) async {
    try {
      clearComponents();

      final swaggerResponse = await _swaggerSource.getSwaggerComponents(
        url: url,
        arch: arch,
      );

      final enums = _swaggerMapper.mapEnums(swaggerResponse);
      final sources = _swaggerMapper.mapSources(swaggerResponse, arch, enums);
      final dataObjects = _swaggerMapper.mapDataObjects(swaggerResponse, enums);

      final duplicates = <String>[];

      for (final component in [...dataObjects, ...enums]) {
        final addResult = addComponent(component);

        if (addResult.isError) {
          if (overwriteDuplicates != null) {
            if (overwriteDuplicates) {
              editComponent(
                oldName: component.name,
                component: component,
              );
            } else {
              duplicates.add(component.name);
            }
          }
        }
      }

      if (duplicates.isNotEmpty) {
        return Result.error(
          failure: SwaggerParserFailureDuplicatesFound(
            duplicates.map((e) => e).toList().join(', '),
          ),
        );
      }

      _components = _components.copyWith(
        sources: [
          ..._components.sources,
          ...sources,
        ],
      );

      return Result.success(components);
    } catch (e, s) {
      logger.crash(error: e, stackTrace: s, reason: 'fetchSwaggerData');
      return const Result.error(
        failure: SwaggerParserFailureFailedToParse(),
      );
    }
  }

  @override
  void clearComponents({
    bool empty = false,
  }) {
    if (empty) {
      _components = Components.empty();
      return;
    }

    final swaggerComponents = [..._components.dataObjects, ..._components.enums]
        .where(
          (element) => element.fromSwagger,
        )
        .toList();

    for (final component in swaggerComponents) {
      deleteComponent(component);
    }

    _components = _components.copyWith(
      sources: _components.sources
          .where(
            (element) => !element.fromSwagger,
          )
          .toList(),
    );
  }

  @override
  Result<OperationStatus> addSource({
    required String sourceName,
    required ArchType arch,
  }) {
    if (_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          sourceName,
        ),
      );
    }

    _components = _components.copyWith(
      sources: [
        ..._components.sources,
        SourceComponent(
          name: sourceName,
          requests: [],
          arch: arch,
          fromSwagger: false,
        ),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> removeSource(String sourceName) {
    if (!_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    _components = _components.copyWith(
      sources: _components.sources
          .where((element) => element.name != sourceName)
          .toList(),
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> editSourceName({
    required String sourceName,
    required String newName,
  }) {
    if (!_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    if (_isSourceExists(newName)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          newName,
        ),
      );
    }

    final updatedSource = _components.sources
        .firstWhere(
          (element) => element.name == sourceName,
        )
        .copyWith(
          name: newName,
        );

    _components = _components.copyWith(
      sources: [
        ..._components.sources.where((element) => element.name != sourceName),
        updatedSource,
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> addSourceRequest({
    required String sourceName,
    required RequestComponent requestComponent,
  }) {
    if (!_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    if (_isSourceRequestExists(sourceName, requestComponent)) {
      return const Result.error(
        failure: SwaggerParserFailureRequestAlreadyExists(''),
      );
    }

    final sourceIndex = _components.sources.indexWhere(
      (element) => element.name == sourceName,
    );

    final source = _components.sources[sourceIndex];

    if (source.requests.contains(requestComponent)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          requestComponent.operationId,
        ),
      );
    }

    _components = _components.copyWith(
      sources: [
        ..._components.sources.sublist(0, sourceIndex),
        source.copyWith(
          requests: [
            ...source.requests,
            requestComponent,
          ],
        ),
        ..._components.sources.sublist(sourceIndex + 1),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> editSourceRequest({
    required String sourceName,
    required RequestComponent oldComponent,
    required RequestComponent requestComponent,
  }) {
    if (!_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    final sourceIndex = _components.sources.indexWhere(
      (element) => element.name == sourceName,
    );

    final source = _components.sources[sourceIndex];

    if (source.requests.where((e) => e.equals(oldComponent)).isEmpty) {
      return const Result.error(
        failure: SwaggerParserFailureNotFound(
          'Request Component',
        ),
      );
    }

    _components = _components.copyWith(
      sources: [
        ..._components.sources.sublist(0, sourceIndex),
        source.copyWith(
          requests: [
            ...source.requests.where(
              (element) => !element.equals(oldComponent),
            ),
            requestComponent,
          ],
        ),
        ..._components.sources.sublist(sourceIndex + 1),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> deleteSourceRequest({
    required String sourceName,
    required RequestComponent requestComponent,
  }) {
    if (!_isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    final sourceIndex = _components.sources.indexWhere(
      (element) => element.name == sourceName,
    );

    final source = _components.sources[sourceIndex];

    if (!source.requests.contains(requestComponent)) {
      return const Result.error(
        failure: SwaggerParserFailureNotFound(
          'Request Component',
        ),
      );
    }

    _components = _components.copyWith(
      sources: [
        ..._components.sources.sublist(0, sourceIndex),
        source.copyWith(
          requests: [
            ...source.requests.where(
              (element) => !element.equals(requestComponent),
            ),
          ],
        ),
        ..._components.sources.sublist(sourceIndex + 1),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> addComponent(
    Component component,
  ) {
    if (isComponentExists(component.name)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          component.name,
        ),
      );
    }

    if (component is DataObjectComponent) {
      _components = _components.copyWith(
        dataObjects: [
          ..._components.dataObjects,
          component,
        ],
      );
    } else if (component is EnumParamComponent) {
      _components = _components.copyWith(
        enums: [
          ..._components.enums,
          component,
        ],
      );
    }

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> editComponent({
    required String oldName,
    required Component component,
  }) {
    if (!isComponentExists(oldName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          oldName,
        ),
      );
    }

    if (oldName != component.name && isComponentExists(component.name)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          component.name,
        ),
      );
    }

    _editComponentObject(component, oldName);

    for (final dataObject in _components.dataObjects) {
      final dataObjectVariables = dataObject.variables.toList();

      if (dataObjectVariables
          .map(
            (e) => e.type.getTypeName(),
          )
          .contains(oldName)) {
        final variables = dataObjectVariables
            .where(
              (element) => element.type.getTypeName() == oldName,
            )
            .toList();

        for (final variable in variables) {
          if (variable is SwaggerEnum) {
            final index = dataObjectVariables.indexOf(variable);
            final updatedVariable = variable.copyWith(
              name: component.name,
            );

            dataObjectVariables[index] = updatedVariable;
          } else if (variable.type is SwaggerReference) {
            final index = dataObjectVariables.indexOf(variable);
            final updatedVariable = variable.copyWith(
              type: SwaggerReference(
                component.name,
              ),
            );

            dataObjectVariables[index] = updatedVariable;
          } else if (variable.type is SwaggerArray) {
            final array = variable.type as SwaggerArray;
            final index = dataObjectVariables.indexOf(variable);

            final updatedVariable = variable.copyWith(
              type: SwaggerArray(
                SwaggerModelVariableResponseV3(
                  name: array.itemType.type.getName(),
                  type: (component is EnumParamComponent)
                      ? component.type
                      : (component as DataObjectComponent).fileReference,
                  isRequired: variable.isRequired,
                ),
              ),
            );

            dataObjectVariables[index] = updatedVariable;
          }
        }

        editComponent(
          oldName: dataObject.name,
          component: DataObjectComponent(
            name: dataObject.name,
            fileReference: dataObject.fileReference,
            variables: dataObjectVariables,
            fromSwagger: component.fromSwagger,
          ),
        );
      }
    }

    _updateRequests(oldName, component);

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> deleteComponent(
    Component component,
  ) {
    if (!isComponentExists(component.name)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          component.name,
        ),
      );
    }

    for (final dataObject in _components.dataObjects) {
      final variables = dataObject.variables.toList()
        ..removeWhere(
          (element) => element.type.getName() == component.name,
        )
        ..removeWhere(
          (element) =>
              element.type is SwaggerArray &&
              (element.type as SwaggerArray).itemType.type.getName() ==
                  component.name,
        );

      editComponent(
        oldName: dataObject.name,
        component: DataObjectComponent(
          name: dataObject.name,
          fileReference: dataObject.fileReference,
          variables: variables,
          fromSwagger: dataObject.fromSwagger,
        ),
      );
    }

    _deleteComponentObject(component);

    _updateRequests(component.name, component);

    return const Result.success(OperationStatus.success);
  }

  void _editComponentObject(Component component, String oldName) {
    if (component is DataObjectComponent) {
      _components = _components.copyWith(
        dataObjects: [
          ..._components.dataObjects.where(
            (element) => element.name != oldName,
          ),
          component,
        ],
      );
    } else if (component is EnumParamComponent) {
      _components = _components.copyWith(
        enums: [
          ..._components.enums.where(
            (element) => element.name != oldName,
          ),
          component,
        ],
      );
    }
  }

  void _deleteComponentObject(Component component) {
    if (component is DataObjectComponent) {
      _components = _components.copyWith(
        dataObjects: _components.dataObjects
            .where((element) => element.name != component.name)
            .toList(),
      );
    } else if (component is EnumParamComponent) {
      _components = _components.copyWith(
        enums: _components.enums
            .where((element) => element.name != component.name)
            .toList(),
      );
    }
  }

  void _updateRequests(String oldName, Component component) {
    final componentExists = isComponentExists(component.name);

    for (final source in _components.sources) {
      for (final request in source.requests) {
        var requestBody = request.requestBody;
        var response = request.response;
        final multipart = request.multipartBody.toList();
        final queryParams = request.queryParams.toList();

        if (component is DataObjectComponent &&
            requestBody != null &&
            requestBody.type.getName() == oldName) {
          requestBody = requestBody.updateComponentType(
            componentExists ? component.fileReference : null,
          );
        }

        if (component is DataObjectComponent &&
            response != ResponseParamComponent.operationDefault() &&
            response.type.getName() == oldName) {
          response = response.changeComponentType(
            componentExists ? component.fileReference : null,
          );
        }

        if (multipart.isNotEmpty && multipart.containsName(oldName)) {
          for (final part in multipart) {
            if (part.getTypeName() == oldName) {
              final index = multipart.indexOf(part);

              multipart.remove(part);

              if (componentExists) {
                final updatedPart = part.updateComponentType(component);
                multipart.insert(index, updatedPart);
              }
            }
          }
        }

        if (queryParams.isNotEmpty && queryParams.containsName(oldName)) {
          for (final param in queryParams) {
            if (param.getTypeName() == oldName) {
              final index = queryParams.indexOf(param);

              queryParams.remove(param);

              if (componentExists) {
                final updatedParam = param.updateComponentType(component);
                queryParams.insert(index, updatedParam);
              }
            }
          }
        }

        final updatedRequest = request.copyWith(
          requestBody: requestBody,
          response: response,
          multipartBody: multipart,
          queryParams: queryParams,
        );

        editSourceRequest(
          sourceName: source.name,
          oldComponent: request,
          requestComponent: updatedRequest,
        );
      }
    }
  }

  @override
  bool isComponentExists(String dataObjectName) {
    return _components.dataObjects.any(
          (element) => element.name == dataObjectName,
        ) ||
        _components.enums.any(
          (element) => element.name == dataObjectName,
        );
  }

  bool _isSourceExists(String sourceName) {
    return _components.sources.any(
      (element) => element.name == sourceName,
    );
  }

  bool _isSourceRequestExists(
    String sourceName,
    RequestComponent request,
  ) {
    return _components.sources
        .firstWhere(
          (source) => source.name == sourceName,
        )
        .requests
        .any(
          (element) => element.equals(request),
        );
  }

  @override
  Result<Component> getComponentByName({required String componentName}) {
    final component = _components.dataObjects.firstWhereOrNull(
          (element) => element.name == componentName,
        ) ??
        _components.enums.firstWhereOrNull(
          (element) => element.name == componentName,
        );

    if (component == null) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          componentName,
        ),
      );
    }

    return Result.success(component);
  }
}
