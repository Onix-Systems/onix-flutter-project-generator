import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/mapper/swagger/swagger_mapper.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch_type/arch_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
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
    if (isSourceExists(sourceName)) {
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
        ),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  Result<OperationStatus> removeSource(String sourceName) {
    if (!isSourceExists(sourceName)) {
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
    if (!isSourceExists(sourceName)) {
      return Result.error(
        failure: SwaggerParserFailureNotFound(
          sourceName,
        ),
      );
    }

    if (isSourceExists(newName)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          newName,
        ),
      );
    }

    final sourceIndex =
        _components.sources.indexWhere((element) => element.name == sourceName);
    final source = _components.sources[sourceIndex];
    final updatedSource = source.copyWith(name: newName);

    _components = _components.copyWith(
      sources: [
        ..._components.sources.sublist(0, sourceIndex),
        updatedSource,
        ..._components.sources.sublist(sourceIndex + 1),
      ],
    );

    return const Result.success(OperationStatus.success);
  }

  @override
  bool isSourceExists(String sourceName) {
    return _components.sources.any((element) => element.name == sourceName);
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

    if (oldName.toUpperCase() != component.name.toUpperCase() &&
        isComponentExists(component.name)) {
      return Result.error(
        failure: SwaggerParserFailureAlreadyExists(
          component.name,
        ),
      );
    }

    if (component is DataObjectComponent) {
      final dataObjectIndex = _components.dataObjects
          .indexWhere((element) => element.name == oldName);

      _components = _components.copyWith(
        dataObjects: [
          ..._components.dataObjects.sublist(0, dataObjectIndex),
          component,
          ..._components.dataObjects.sublist(dataObjectIndex + 1),
        ],
      );
    } else if (component is EnumParamComponent) {
      final enumIndex =
          _components.enums.indexWhere((element) => element.name == oldName);

      _components = _components.copyWith(
        enums: [
          ..._components.enums.sublist(0, enumIndex),
          component,
          ..._components.enums.sublist(enumIndex + 1),
        ],
      );
    }

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

    return const Result.success(OperationStatus.success);
  }

  bool isComponentExists(String dataObjectName) {
    return _components.dataObjects.any(
          (element) =>
              element.name.toUpperCase() == dataObjectName.toUpperCase(),
        ) ||
        _components.enums.any(
          (element) =>
              element.name.toUpperCase() == dataObjectName.toUpperCase(),
        );
  }
}
