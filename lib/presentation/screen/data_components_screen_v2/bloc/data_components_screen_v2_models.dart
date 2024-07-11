import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';


part 'data_components_screen_v2_models.freezed.dart';

@freezed
class DataComponentsScreenV2Event with _$DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2Event.init({
    required Config config,
  }) = DataComponentsScreenV2IInit;

}

@freezed
class DataComponentsScreenV2SR with _$DataComponentsScreenV2SR {
  const factory DataComponentsScreenV2SR.error({
    required String message,
  }) = _Error;
}

@freezed
class DataComponentsScreenV2State with _$DataComponentsScreenV2State {
  const factory DataComponentsScreenV2State.data({
    required Config config,
     Components? components,
  }) = DataComponentsScreenV2StateData;
}
