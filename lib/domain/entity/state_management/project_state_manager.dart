import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/base_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/bloc_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/mvvvm_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/provider_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/riverpod_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/signals_strategy.dart';

enum ProjectStateManager {
  bloc,
  provider,
  riverpod,
  signals,
  viewModel,
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
      case ProjectStateManager.riverpod:
        return RiverpodStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
      case ProjectStateManager.signals:
        return SignalsStateManagerStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
      case ProjectStateManager.viewModel:
        return MvvmStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
        );
    }
  }
}
