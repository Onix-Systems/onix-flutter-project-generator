import 'package:{{project_name}}/core/arch/domain/entity/common/data_response.dart';
import 'package:{{project_name}}/data/model/remote/time/time_response.dart';

//{response_imports}
//{request_imports}

abstract class TimeSource {
  Future<DataResponse<TimeResponse>> getTime();
}
