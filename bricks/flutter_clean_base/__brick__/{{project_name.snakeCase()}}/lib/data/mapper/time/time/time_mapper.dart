import 'package:{{project_name}}/core/arch/domain/common/converter/mapper.dart';
import 'package:{{project_name}}/data/model/remote/time/time/time_response.dart';
import 'package:{{project_name}}/domain/entity/time/time/time.dart';

class _TimeMapper implements Mapper<TimeResponse, Time> {
  @override
  Time map(TimeResponse from) {
    return Time(currentDateTime: from.currentDateTime);
  }
}

class TimeMappers {
  final _timeResponseToEntityMapper = _TimeMapper();

  Time mapResponseToEntity(TimeResponse response) =>
      _timeResponseToEntityMapper.map(response);
}
