import 'package:onix_flutter_bricks/app/extension/logger_extension.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/mapper/swagger/swagger_mapper.dart';
import 'package:onix_flutter_bricks/data/source/remote/swagger/swagger_remote_source.dart';
import 'package:onix_flutter_bricks/domain/entity/arch/arch.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/domain/repository/swagger_repository.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class SwaggerRepositoryImpl implements SwaggerRepository {
  @override
  Components? components;
  final SwaggerRemoteSource _swaggerSource;
  final _swaggerMapper = SwaggerMapper();

  SwaggerRepositoryImpl(this._swaggerSource);

  @override
  Future<Result<Components>> fetchSwaggerData({
    required String url,
    required Arch arch,
  }) async {
    try {
      final swaggerResponse = await _swaggerSource.getSwaggerComponents(
        url: url,
        arch: arch,
      );

      final sources = _swaggerMapper.mapSources(swaggerResponse, arch);
      final enums = _swaggerMapper.mapEnums(swaggerResponse);
      final dataObjects = _swaggerMapper.mapDataObjects(swaggerResponse);

      final parsedComponents = Components(
        sources: sources,
        enums: enums,
        dataObjects: dataObjects,
      );
      components = parsedComponents;
      return Result.success(parsedComponents);
    } catch (e, s) {
      logger.crash(error: e, stackTrace: s, reason: 'fetchSwaggerData');
      return const Result.error(failure: SwaggerParserFailure());
    }
  }

  @override
  void clearComponents() {
    components = null;
  }
}
