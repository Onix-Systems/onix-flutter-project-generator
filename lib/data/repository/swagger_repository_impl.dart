import 'package:flutter/foundation.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/failure/api_failure.dart';
import 'package:onix_flutter_bricks/core/arch/domain/entity/result/result.dart';
import 'package:onix_flutter_bricks/data/mapper/swagger/swagger_mapper.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';

class SwaggerRepositoryImpl implements SwaggerRepository {
  @override
  Components? components;
  final SwaggerRemoteSource _swaggerSource;
  final _swaggerMapper = SwaggerMapper();

  SwaggerRepositoryImpl(this._swaggerSource);

  @override
  Future<Result<Components>> fetchSwaggerData({
    required String url,
  }) async {
    try {
      final swaggerResponse = await _swaggerSource.getSwaggerComponents(
        url: url,
      );

      final sources = _swaggerMapper.mapSources(swaggerResponse);
      final enums = _swaggerMapper.mapEnums(swaggerResponse);
      final dataObjects = _swaggerMapper.mapDataObjects(swaggerResponse);

      final parsedComponents = Components(
        sources: sources,
        enums: enums,
        dataObjects: dataObjects,
      );
      components = parsedComponents;
      return Result.success(parsedComponents);
    } catch (e, trace) {
      if (kDebugMode) {
        print(e);
        print(trace);
      }
      //logger.e(e, stackTrace: trace);
      return Result.error(failure: SwaggerParserFailure());
    }
  }

  @override
  void clearComponents() {
    components = null;
  }
}
