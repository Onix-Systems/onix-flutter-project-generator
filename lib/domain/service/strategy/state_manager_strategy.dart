import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/state_management/state_managemet_variant.dart';
import 'package:onix_flutter_bricks/domain/repository/screen_repository.dart';
import 'package:onix_flutter_bricks/domain/service/output_service/output_service.dart';

abstract interface class StateManagerStrategy<T> {
  List<StateManagementVariant> get variants;

  Future<T> generate({
    required Config config,
    required ScreenRepository screenRepository,
    required OutputService outputService,
  });
}
