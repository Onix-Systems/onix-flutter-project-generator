import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class AddOutputMessageUseCase {
  final OutputService _outputService;

  AddOutputMessageUseCase(this._outputService);

  void call({required String message}) {
    _outputService.add(message);
  }
}
