import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/process_runner.dart';

class RunProcessUseCase {
  final OutputService _outputService;

  const RunProcessUseCase(this._outputService);

  Future<int> call({
    required String workDir,
    required List<String> commands,
  }) async {
    final processRunner = ProcessRunner(_outputService);
    await processRunner.newProcess(workingDirectory: workDir);

    for (var command in commands) {
      processRunner.execCommand(command);
    }
    final exitCode = await processRunner.waitForExit();
    processRunner.dispose();
    return exitCode;
  }
}
