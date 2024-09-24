import 'package:onix_flutter_bricks/domain/service/strategy/state_manager_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/bloc_strategy.dart';
import 'package:onix_flutter_bricks/domain/service/strategy/strategies/stateful_strategy.dart';

enum ProjectStateManager {
  bloc,
  none;

  StateManagerStrategy get strategy {
    switch (this) {
      case ProjectStateManager.bloc:
        return BlocStateManagerStrategy();
      case ProjectStateManager.none:
        return StatefulStrategy();
    }
  }
}
