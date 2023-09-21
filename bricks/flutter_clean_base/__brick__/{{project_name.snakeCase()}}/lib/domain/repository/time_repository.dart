import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/domain/entity/time/time/time.dart';
//{entities_imports}

abstract class TimeRepository {
  Future<Result<Time>> getTime();
}
