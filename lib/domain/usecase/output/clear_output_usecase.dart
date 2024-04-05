import 'package:onix_flutter_bricks/domain/service/base/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class ClearOutputUseCase {
  final OutputService _outputService;

  ClearOutputUseCase(this._outputService);

  void call() {
    _outputService.clear();
  }
}