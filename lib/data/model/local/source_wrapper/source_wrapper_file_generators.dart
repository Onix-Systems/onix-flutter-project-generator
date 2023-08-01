import 'package:onix_flutter_bricks/data/model/local/source_wrapper/source_wrapper.dart';
import 'package:onix_flutter_bricks/domain/use_case/source/generate_source_use_case.dart';

extension FileGenerator on SourceWrapper {
  Future<void> generateFiles({
    required String projectName,
    required String projectPath,
    required Set<SourceWrapper> allSources,
  }) async {
    await GenerateSourceUseCase()(
      projectName: projectName,
      projectPath: projectPath,
      sourceWrapper: this,
      allSources: allSources,
    );
  }
}
