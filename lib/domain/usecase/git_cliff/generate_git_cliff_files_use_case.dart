import 'package:onix_flutter_bricks/domain/service/git_cliff_service/git_cliff_service.dart';
import 'package:onix_flutter_bricks/domain/service/git_cliff_service/params/git_cliff_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateGitCliffFilesUseCase {
  final GitCliffService _service;
  final OutputService _outputService;

  const GenerateGitCliffFilesUseCase({
    required GitCliffService service,
    required OutputService outputService,
  })  : _service = service,
        _outputService = outputService;

  Future<void> call(GitCliffParams params) async {
    _outputService.add('{#info}Start Git Cliff generation...');
    final result = await _service.generate(params);
    if (result.isEmpty) {
      _outputService.add('{#info}Git Cliff files generated!');
    } else {
      _outputService.add(
        '{#warning}Git Cliff files generation completed with errors!\n $result',
      );
    }
  }
}
