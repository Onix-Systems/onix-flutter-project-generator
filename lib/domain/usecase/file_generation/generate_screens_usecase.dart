import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/file_generator_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

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
    final screensNotExist = config.screens
        .where(
          (element) => !element.exists,
        )
        .toList();

    if (screensNotExist.isEmpty) {
      await _fileGeneratorService.generateDefaultScreenRoute(
        DefaultScreenRouteGeneratorParams(
          projectPath: config.projectPath,
          projectName: config.projectName,
          router: config.router,
        ),
      );
    } else {
      for (int i = 0; i < screensNotExist.length; i++) {
        final screen = screensNotExist[i];
        _outputService.add(
          'Generating screen ${screen.name}...'.toInfoMessage(),
        );

        await _fileGeneratorService.generateScreen(
          ScreenGeneratorParams(
            screen: screen,
            projectPath: config.projectPath,
            projectName: config.projectName,
            router: config.router,
            lastScreenItem: i == (screensNotExist.length - 1),
          ),
        );
        screen.exists = true;
        _screenRepository.modifyScreen(screen, screen.name);
      }
    }

    _outputService.add(
      'Screens generated!'.toInfoMessage(),
    );
  }
}
