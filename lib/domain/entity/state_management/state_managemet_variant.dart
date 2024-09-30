import 'package:onix_flutter_bricks/domain/service/base/base_generation_service.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/bloc_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/cubit_screen_generator.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/screen_generators/provider_screen_generator.dart';
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
  ScreenGenerationService get screenGenerator => StatelessScreenGenerator();

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
