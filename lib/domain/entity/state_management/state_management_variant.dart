import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/bloc_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/cubit_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/provider_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/riverpod_stateful_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/riverpod_stateless_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/signals_passive_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/signals_reactive_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/stateful_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/stateless_screen_generator.dart';

abstract class StateManagementVariant {
  String get name;

  ScreenGenerationService get screenGenerator;

  const StateManagementVariant();

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

final class StatelessStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Stateless';

  @override
  ScreenGenerationService get screenGenerator => StatelessScreenGenerator();

  const StatelessStateManagementVariant();
}

final class StatefulStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Stateful';

  @override
  ScreenGenerationService get screenGenerator => StatefulScreenGenerator();

  const StatefulStateManagementVariant();
}

final class BlocStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Bloc';

  @override
  ScreenGenerationService get screenGenerator => BlocScreenGenerator();

  const BlocStateManagementVariant();
}

final class CubitStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Cubit';

  @override
  ScreenGenerationService get screenGenerator => CubitScreenGenerator();

  const CubitStateManagementVariant();
}

final class ProviderStateManagementVariant extends StateManagementVariant {
  @override
  String get name => 'Provider';

  @override
  ScreenGenerationService get screenGenerator => ProviderScreenGenerator();

  const ProviderStateManagementVariant();
}

final class RiverpodStatelessStateManagementVariant
    extends StateManagementVariant {
  @override
  String get name => 'RiverpodStateless';

  @override
  ScreenGenerationService get screenGenerator =>
      RiverpodStatelessScreenGenerator();

  const RiverpodStatelessStateManagementVariant();
}

final class RiverpodStatefulStateManagementVariant
    extends StateManagementVariant {
  @override
  String get name => 'RiverpodStateful';

  @override
  ScreenGenerationService get screenGenerator =>
      RiverpodStatefulScreenGenerator();

  const RiverpodStatefulStateManagementVariant();
}

final class SignalsPassiveStateManagementVariant
    extends StateManagementVariant {
  @override
  String get name => 'SignalsPassive';

  @override
  ScreenGenerationService get screenGenerator =>
      SignalsPassiveScreenGenerator();

  const SignalsPassiveStateManagementVariant();
}

final class SignalsReactiveStateManagementVariant
    extends StateManagementVariant {
  @override
  String get name => 'SignalsReactive';

  @override
  ScreenGenerationService get screenGenerator =>
      SignalsReactiveScreenGenerator();

  const SignalsReactiveStateManagementVariant();
}
