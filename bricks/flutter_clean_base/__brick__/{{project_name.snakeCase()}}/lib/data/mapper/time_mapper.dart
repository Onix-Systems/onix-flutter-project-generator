import 'package:{{project_name}}/core/arch/domain/common/converter/mapper.dart';
import 'package:{{project_name}}/data/model/remote/time/time_response.dart';
import 'package:{{project_name}}/domain/entity/time/time_entity.dart';

class _TimeMapper implements Mapper<TimeResponse, TimeEntity> {
  @override
  TimeEntity map(TimeResponse from) {
    return TimeEntity(currentDateTime: from.currentDateTime);
  }
}

class TimeMappers {
  final _timeResponseToEntityMapper = _TimeMapper();

  TimeEntity mapRemoteTimeList(TimeResponse response) =>
      _timeResponseToEntityMapper.map(response);
}
