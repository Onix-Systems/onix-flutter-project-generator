import 'package:onix_flutter_bricks/util/process_starter.dart';

class RunProcessUseCase {
  const RunProcessUseCase();
  Future<int> call({
    required String workDir,
    required List<String> commands,
  }) async {
    final process = await ProcessStarter.start(workingDirectory: workDir);

    for (var command in commands) {
      process.stdin.writeln(command);
    }

    return process.exitCode;
  }
}
