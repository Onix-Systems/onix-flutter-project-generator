import 'package:{{project_name}}/core/arch/domain/entity/common/result.dart';
import 'package:{{project_name}}/domain/entity/time/time_entity.dart';
import 'package:{{project_name}}/domain/repository/time_repository.dart';

class GetTimeUseCase {
  final TimeRepository _timeRepository;

  GetTimeUseCase(this._timeRepository);

  Future<Result<TimeEntity>> call() async {
    return _timeRepository.getTime();
  }
}
