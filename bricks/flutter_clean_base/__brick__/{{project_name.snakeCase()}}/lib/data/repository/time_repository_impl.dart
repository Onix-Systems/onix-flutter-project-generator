import 'package:{{project_name}}/core/arch/data/remote/base/map_common_server_error.dart';
import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/core/arch/domain/entity/failure/api_failure.dart';
import 'package:{{project_name}}/core/di/app.dart';
import 'package:{{project_name}}/data/mapper/time/time_mapper.dart';
import 'package:{{project_name}}/data/source/remote/time/time_source.dart';
import 'package:{{project_name}}/domain/entity/time/time/time.dart';
import 'package:{{project_name}}/domain/repository/time_repository.dart';
import 'package:{{project_name}}/core/extension/logger_extension.dart';

//{entities_imports}
//{mappers_imports}

class TimeRepositoryImpl extends TimeRepository {
  final TimeSource _timeSource;

  final _timeMappers = TimeMappers();

  //{mappers}

  TimeRepositoryImpl(
    this._timeSource,
  );

  @override
  Future<Result<Time>> getTime() async {
    try {
      final response = await _timeSource.getTime();
      if (response.isSuccess()) {
        final entities = _timeMappers.mapResponseToEntity(response.data);
        return Result.success(entities);
      } else {
        final failure = MapCommonServerError.getServerFailureDetails(response);
        return Result.error(failure: failure);
      }
    } catch (e, trace) {
      logger.crash(reason: 'getTime_API_ERR', error: e, stackTrace: trace);
      //TODO make repository failure
      return Result.error(
        failure: ApiFailure(
          ServerFailure.exception,
          message: e.toString(),
        ),
      );
    }
  }
}
