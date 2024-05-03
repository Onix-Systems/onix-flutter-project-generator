import 'package:onix_flutter_bricks/domain/service/fastlane_service/fastlane_service.dart';
import 'package:onix_flutter_bricks/domain/service/fastlane_service/params/fastlane_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateFastlaneFilesUseCase {
  final OutputService _outputService;
  final FastlaneService _fastlaneService;

  const GenerateFastlaneFilesUseCase({
    required OutputService outputService,
    required FastlaneService fastlaneService,
  })  : _outputService = outputService,
        _fastlaneService = fastlaneService;

  Future<void> call(
    FastlaneGenerationParams params, {
    required bool isModify,
  }) async {
    if (isModify) {
      _outputService.add(
        '{#info}Fastlane generation omitted because of the project modification',
      );
      return;
    }

    _outputService.add('{#info}Start Fastlane generation...');
    final succeed = await _fastlaneService.generate(params);
    if (succeed) {
      _outputService.add('{#info}Fastlane files generated!');
    } else {
      _outputService
          .add('{#warning}Fastlane files generation completed with errors!');
    }
  }
}
