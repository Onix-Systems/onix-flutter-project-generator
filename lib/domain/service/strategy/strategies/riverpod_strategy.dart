import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/default_screen_route_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/params/screen_generator_params.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/util/extension/output/output_message_extension.dart';

class RiverpodStrategy implements StateManagerStrategy {
  final BaseGenerationService _defaultScreenRouteGenerator;

  RiverpodStrategy({
    required DefaultScreenRouteGenerator defaultScreenRouteGenerator,
  }) : _defaultScreenRouteGenerator = defaultScreenRouteGenerator;

  @override
  List<StateManagementVariant> get variants => [
        const RiverpodStatefulStateManagementVariant(),
        const RiverpodStatelessStateManagementVariant(),
        const StatefulStateManagementVariant(),
        const StatelessStateManagementVariant(),
      ];

  @override
  Future<void> generate({
    required Config config,
    required ScreenRepository screenRepository,
    required void Function(String) logResult,
  }) async {
    try {
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
        for (var i = 0; i < screensNotExist.length; i++) {
          final screen = screensNotExist[i];
          logResult(
            'Generating screen ${screen.name}...'.toInfoMessage(),
          );

          await screen.stateVariant.screenGenerator.generate(
            ScreenGeneratorParams(
              screen: screen,
              projectRootPath: config.projectRootPath,
              projectName: config.projectName,
              arch: config.arch,
              router: config.router,
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
