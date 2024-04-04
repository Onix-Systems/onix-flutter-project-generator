import 'package:onix_flutter_bricks/domain/service/base/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateDocumentationUseCase {
  final OutputService _outputService;
  final DocsService _docsGeneratorService;

  GenerateDocumentationUseCase(
    this._outputService,
    this._docsGeneratorService,
  );

  Future<void> call({required DocsGenerationParams params}) async {
    _outputService.add('{#info}Start documentation generation...');
    final succeed = await _docsGeneratorService.generate(params);
    if (succeed) {
      _outputService.add('{#info}Documentation generated!');
    } else {
      _outputService
          .add('{#warning}Documentation generation completed with errors!');
    }
  }
}
