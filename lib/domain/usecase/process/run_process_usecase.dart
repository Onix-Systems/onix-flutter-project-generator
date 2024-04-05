import 'package:onix_flutter_bricks/domain/service/base/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/process_starter.dart';

class RunProcessUseCase {
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
