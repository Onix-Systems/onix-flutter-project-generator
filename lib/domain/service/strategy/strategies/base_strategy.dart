import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_managemet_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/base_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

class BaseStrategy implements StateManagerStrategy {
  final BaseGenerationService<bool> _baseScreenGenerator =
      BaseScreenGenerator();

  final BaseGenerationService<bool> _defaultScreenRouteGenerator =
      DefaultScreenRouteGenerator();

  @override
  List<StateManagementVariant> get variants => [
        StatefulStateManagementVariant(),
        StatelessStateManagementVariant(),
      ];

  @override
  Future<void> generate({
    required Config config,
    required ScreenRepository screenRepository,
    required OutputService outputService,
  }) async {
    final screensNotExist = config.screens
        .where(
          (element) => !element.exists,
        )
        .toList();

    if (screensNotExist.isEmpty) {
      await _defaultScreenRouteGenerator.generate(
        DefaultScreenRouteGeneratorParams(
          projectPath: config.projectPath,
          projectName: config.projectName,
          router: config.router,
        ),
      );
    } else {
      for (int i = 0; i < screensNotExist.length; i++) {
        final screen = screensNotExist[i];
        outputService.add(
          'Generating screen ${screen.name}...'.toInfoMessage(),
        );

        await _baseScreenGenerator.generate(
          ScreenGeneratorParams(
            screen: screen,
            projectPath: config.projectPath,
            projectName: config.projectName,
            router: config.router,
            lastScreenItem: i == (screensNotExist.length - 1),
          ),
        );
        screen.exists = true;
        screenRepository.modifyScreen(screen, screen.name);
      }
    }
  }
}
