import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_management_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';

abstract interface class StateManagerStrategy {
  List<StateManagementVariant> get variants;

  Future<void> generate({
    required Config config,
    required ScreenRepository screenRepository,
    required void Function(String) logResult,
  });
}
