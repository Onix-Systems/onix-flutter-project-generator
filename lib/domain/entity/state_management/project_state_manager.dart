import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/bloc_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/base_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/provider_strategy.dart';

enum ProjectStateManager {
  bloc,
  provider,
  base;

  StateManagerStrategy get strategy {
    switch (this) {
      case ProjectStateManager.bloc:
        return BlocStateManagerStrategy();
      case ProjectStateManager.base:
        return BaseStrategy();
      case ProjectStateManager.provider:
        return ProviderStrategy();
    }
  }
}