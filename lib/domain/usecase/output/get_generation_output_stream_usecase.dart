import 'package:onix_flutter_bricks/domain/entity/config/output_line.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/enum/output_type.dart';

class GetGenerationOutputStream {
  final OutputService _outputService;

  const GetGenerationOutputStream(this._outputService);

  Future<Stream<List<OutputLine>>> call() async {
    _outputService.clear();
    return _outputService.outputStream.map(
      (event) {
        if (_outputService.outputLines.last.tag == OutputType.progress) {
          _outputService.outputLines.removeLast();
        }
        return _outputService.outputLines;
      },
    );
  }
}
