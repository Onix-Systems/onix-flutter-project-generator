import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

class GenerateScreensUseCase {
  final OutputService _outputService;
  final FileGeneratorService _fileGeneratorService;
  final ScreenRepository _screenRepository;

  const GenerateScreensUseCase(
    this._outputService,
    this._fileGeneratorService,
    this._screenRepository,
  );

  Future<void> call({
    required Config config,
  }) async {
    for (var screen in config.screens.where((element) => !element.exists)) {
      _outputService.add('{#info}Generating screen ${screen.name}...');

      await _fileGeneratorService.generateScreen(
        ScreenGeneratorParams(
          screen: screen,
          projectPath: config.projectPath,
          projectName: config.projectName,
          router: config.router,
        ),
      );

      screen.exists = true;
      _screenRepository.modifyScreen(screen, screen.name);
    }
    _outputService.add('{#info}Screens generated!');
  }
}
