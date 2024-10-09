import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/base_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/bloc_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/provider_strategy.dart';

enum ProjectStateManager {
  bloc,
  provider,
  base;

  StateManagerStrategy get strategy {
    switch (this) {
      case ProjectStateManager.bloc:
        return BlocStateManagerStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
      case ProjectStateManager.base:
        return BaseStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
      case ProjectStateManager.provider:
        return ProviderStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
    }
  }
}
