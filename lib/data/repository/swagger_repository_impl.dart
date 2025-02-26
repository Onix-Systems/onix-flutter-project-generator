import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/mapper/swagger/swagger_mapper.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
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
  }) async {
    try {
      final swaggerResponse = await _swaggerSource.getSwaggerComponents(
        url: url,
        arch: arch,
      );

      final enums = _swaggerMapper.mapEnums(swaggerResponse);
      final sources = _swaggerMapper.mapSources(swaggerResponse, arch, enums);
      final dataObjects = _swaggerMapper.mapDataObjects(swaggerResponse, enums);

      final parsedComponents = Components(
        sources: sources,
        enums: enums,
        dataObjects: dataObjects,
      );
      _components = parsedComponents;
      return Result.success(parsedComponents);
    } catch (e, s) {
      logger.crash(error: e, stackTrace: s, reason: 'fetchSwaggerData');
      return const Result.error(
        failure: SwaggerParserFailureFailedToParse(),
      );
    }
  }

  @override
  void clearComponents() {
    _components = Components.empty();
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
    if (_isComponentExists(component.name)) {
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
    if (!_isComponentExists(oldName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          oldName,
        ),
      );
    }

    if (oldName.toUpperCase() != component.name.toUpperCase() &&
        _isComponentExists(component.name)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          component.name,
        ),
      );
    }

    _editComponentObject(component, oldName);

    for (final dataObject in _components.dataObjects) {
      if (dataObject.variables.map((e) => e.type.getName()).contains(oldName)) {
        final variables = dataObject.variables.toList()
          ..removeWhere(
            (element) => element.type.getName() == oldName,
          )
          ..add(
            DataVariableComponent(
              name: dataObject.name,
              type: SwaggerReference(
                component.name,
              ),
              isRequired: false,
            ),
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
    }

    _updateRequests(oldName, component);

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> deleteComponent(
    Component component,
  ) {
    if (!_isComponentExists(component.name)) {
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
    for (final source in _components.sources) {
      for (final request in source.requests) {
        final requestBody = request.requestBody;
        if (requestBody != null && requestBody.type.getName() == oldName) {
          deleteSourceRequest(
            sourceName: source.name,
            requestComponent: request,
          );

          final updatedRequest = request.copyWith(
            requestBody: _isComponentExists(component.name)
                ? RequestBodyComponent(
                    name: requestBody.name,
                    type: SwaggerReference(
                      component.name,
                    ),
                    isRequired: requestBody.isRequired,
                  )
                : null,
          );

          addSourceRequest(
            sourceName: source.name,
            requestComponent: updatedRequest,
          );
        }
      }
    }
  }

  bool _isComponentExists(String dataObjectName) {
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
}
