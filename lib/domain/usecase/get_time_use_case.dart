import 'package:onix_flutter_bricks/core/arch/domain/entity/common/result.dart';
import 'package:onix_flutter_bricks/domain/entity/time/time_entity.dart';
import 'package:onix_flutter_bricks/domain/repository/time_repository.dart';

class GetTimeUseCase {
  final TimeRepository _timeRepository;

  GetTimeUseCase(this._timeRepository);

  Future<Result<TimeEntity>> call() async {
    return _timeRepository.getTime();
  }
}
