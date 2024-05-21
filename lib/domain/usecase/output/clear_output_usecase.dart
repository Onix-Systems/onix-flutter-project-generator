import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class ClearOutputUseCase {
  final OutputService _outputService;

  const ClearOutputUseCase(this._outputService);

  void call() {
    _outputService.clear();
  }
}
