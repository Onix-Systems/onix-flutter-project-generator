import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateDocumentationUseCase {
  final OutputService _outputService;
  final DocsService _docsGeneratorService;

  const GenerateDocumentationUseCase(
    this._outputService,
    this._docsGeneratorService,
  );

  Future<void> call({
    required DocsGenerationParams params,
    required bool isModify,
  }) async {
    if (isModify) {
      _outputService.add(
        '{#info}Documentation generation omitted because of the project modification',
      );

      return;
    }

    _outputService.add('{#info}Start documentation generation...');
    final result = await _docsGeneratorService.generate(params);
    if (result.isEmpty) {
      _outputService.add('{#info}Documentation generated!');
    } else {
      _outputService.add(
        '{#warning}Documentation generation completed with errors!\n $result',
      );
    }
  }
}
