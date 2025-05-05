import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bricks/domain/service/config_service/config_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/default_screen_route_generator.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/base_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/bloc_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/mvvm_strategy.dart';
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
    final configService = GetIt.I.get<ConfigService>();
    switch (this) {
      case ProjectStateManager.bloc:
        return BlocStateManagerStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
      case ProjectStateManager.base:
        return BaseStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
      case ProjectStateManager.provider:
        return ProviderStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
      case ProjectStateManager.riverpod:
        return RiverpodStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
      case ProjectStateManager.signals:
        return SignalsStateManagerStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
      case ProjectStateManager.viewModel:
        return MvvmStrategy(
          defaultScreenRouteGenerator: DefaultScreenRouteGenerator(),
          configService: configService,
        );
    }
  }
}
