import 'package:onix_flutter_bricks/core/arch/domain/entity/common/result.dart';
import 'package:onix_flutter_bricks/domain/entity/time/time_entity.dart';

//{entities_imports}

abstract class TimeRepository {
  Future<Result<TimeEntity>> getTime();
}
