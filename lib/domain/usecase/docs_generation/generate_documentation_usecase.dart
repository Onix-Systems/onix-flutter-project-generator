import 'package:onix_flutter_bricks/domain/service/docs_service/docs_service.dart';
import 'package:onix_flutter_bricks/domain/service/docs_service/params/docs_generation_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

class GenerateDocumentationUseCase {
  final OutputService _outputService;
  final DocsService _docsGeneratorService;

  const GenerateDocumentationUseCase(
    this._outputService,
    this._docsGeneratorService,
  );

  Future<void> call({required DocsGenerationParams params}) async {
    _outputService.add(
      'Start documentation generation...'.toInfoMessage(),
    );
    final succeed = await _docsGeneratorService.generate(params);
    if (succeed) {
      _outputService.add(
        'Documentation generated!'.toInfoMessage(),
      );
    } else {
      _outputService.add(
        'Documentation generation completed with errors!'.toErrorMessage(),
      );
    }
  }
}
