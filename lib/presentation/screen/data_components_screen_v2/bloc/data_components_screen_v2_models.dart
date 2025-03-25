import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

part 'data_components_screen_v2_models.freezed.dart';

@freezed
class DataComponentsScreenV2Event with _$DataComponentsScreenV2Event {
  const factory DataComponentsScreenV2Event.init({
    required Config config,
  }) = DataComponentsScreenV2IInit;

  const factory DataComponentsScreenV2Event.addSource({
    required String sourceName,
  }) = DataComponentsScreenV2AddSource;

  const factory DataComponentsScreenV2Event.editSourceName({
    required String sourceName,
    required String newName,
  }) = DataComponentsScreenV2EditSourceName;

  const factory DataComponentsScreenV2Event.deleteSource({
    required String sourceName,
  }) = DataComponentsScreenV2DeleteSource;

  const factory DataComponentsScreenV2Event.deleteComponent({
    required Component component,
  }) = DataComponentsScreenV2DeleteComponent;

  const factory DataComponentsScreenV2Event.deleteRequest({
    required String sourceName,
    required RequestComponent request,
    @Default(false) bool deleteRequestBodyComponent,
    @Default(false) bool deleteResponseComponent,
  }) = DataComponentsScreenV2DeleteRequest;
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
    required Components components,
  }) = DataComponentsScreenV2StateData;
}
