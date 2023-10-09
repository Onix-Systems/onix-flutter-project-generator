import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_component_class.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_component_enum.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_mapper.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_request.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/data_component_generators/generate_response.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/generate_screen.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/signing_generator/generate_signing.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/source_generators/generate_source.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';

class FileGeneratorService {
  Future<void> generateScreen({
    required String projectPath,
    required String projectName,
    required Screen screen,
    required ProjectRouter router,
    bool build = false,
  }) async =>
      GenerateScreen().call(
        projectPath: projectPath,
        projectName: projectName,
        screen: screen,
        router: router,
        build: build,
      );

  Future<void> generateSource({
    required String projectName,
    required String projectPath,
    required Source source,
  }) async =>
      GenerateSource().call(
        projectName: projectName,
        projectPath: projectPath,
        source: source,
      );

  Future<void> generateComponent({
    required String projectName,
    required String projectPath,
    required String dataComponentName,
  }) async {
    final dataComponent =
        dataComponentRepository.getDataComponentByName(dataComponentName)!;
    if (dataComponent.isEnum && !dataComponent.exists) {
      await GenerateComponentEnum().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    } else if (!dataComponent.exists) {
      await GenerateComponentClass().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum && dataComponent.generateResponse) {
      await GenerateResponse().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum && dataComponent.generateRequest) {
      await GenerateRequest().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
    if (!dataComponent.isEnum &&
        (dataComponent.generateRequest || dataComponent.generateResponse)) {
      await GenerateMapper().call(
        projectName: projectName,
        projectPath: projectPath,
        dataComponent: dataComponent,
      );
    }
  }

  Future<void> generateSigning({
    required String projectPath,
    required String projectName,
    required String genPass,
    required List<String> signingVars,
  }) async {
    GenerateSigning.call(
      projectPath: projectPath,
      projectName: projectName,
      genPass: genPass,
      signingVars: signingVars,
    );
  }
}
