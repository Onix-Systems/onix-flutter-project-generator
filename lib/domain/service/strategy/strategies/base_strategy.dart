import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

class BaseStrategy implements StateManagerStrategy {
  final BaseGenerationService _defaultScreenRouteGenerator;
  final ConfigService _configService;

  BaseStrategy({
    required DefaultScreenRouteGenerator defaultScreenRouteGenerator,
    required ConfigService configService,
  })  : _defaultScreenRouteGenerator = defaultScreenRouteGenerator,
        _configService = configService;

  @override
  List<StateManagementVariant> get variants => [
        const StatefulStateManagementVariant(),
        const StatelessStateManagementVariant(),
      ];

  @override
  Future<void> generate({
    required ScreenRepository screenRepository,
    required void Function(String) logResult,
  }) async {
    try {
      final screensNotExist = _configService.config.screens
          .where(
            (element) => !element.exists,
          )
          .toList();

      if (screensNotExist.isEmpty) {
        await _defaultScreenRouteGenerator.generate(
          DefaultScreenRouteGeneratorParams(
            projectPath: _configService.config.projectPath,
            projectName: _configService.config.projectName,
            router: _configService.config.router,
          ),
        );
      } else {
        for (var i = 0; i < screensNotExist.length; i++) {
          final screen = screensNotExist[i];
          logResult(
            'Generating screen ${screen.name}...'.toInfoMessage(),
          );

          await screen.stateVariant.screenGenerator.generate(
            ScreenGeneratorParams(
              screen: screen,
              projectRootPath: _configService.config.projectRootPath,
              projectName: _configService.config.projectName,
              archType: _configService.config.arch,
              router: _configService.config.router,
              lastScreenItem: i == (screensNotExist.length - 1),
            ),
          );
          screen.exists = true;
          screenRepository.modifyScreen(screen, screen.name);
        }
      }

      logResult(
        'Screens generated!'.toInfoMessage(),
      );
    } catch (e) {
      logResult(
        'Error generating screens: $e'.toErrorMessage(),
      );
    }
  }
}
