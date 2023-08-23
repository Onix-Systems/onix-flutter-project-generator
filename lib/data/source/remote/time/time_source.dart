import 'package:onix_flutter_bricks/core/arch/domain/entity/common/data_response.dart';
import 'package:onix_flutter_bricks/data/model/remote/time/time_response.dart';

//{response_imports}
//{request_imports}

abstract class TimeSource {
  Future<DataResponse<TimeResponse>> getTime();
}
