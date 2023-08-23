import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

part 'data_components_screen_models.freezed.dart';

@freezed
class DataComponentsScreenEvent with _$DataComponentsScreenEvent {
  const factory DataComponentsScreenEvent.init({
    required Config config,
  }) = DataComponentsScreenEventInit;

  const factory DataComponentsScreenEvent.stateUpdate() =
      DataComponentsScreenEventStateUpdate;

  const factory DataComponentsScreenEvent.addSource({required Source source}) =
      DataComponentsScreenEventAddSource;

  const factory DataComponentsScreenEvent.deleteSource(
      {required Source source}) = DataComponentsScreenEventDeleteSource;

  const factory DataComponentsScreenEvent.modifySource({
    required Source source,
    required String oldSourceName,
  }) = DataComponentsScreenEventModifySource;

  const factory DataComponentsScreenEvent.addDataComponent({
    required DataComponent dataComponent,
    @Default(null) Source? source,
  }) = DataComponentsScreenEventAddDataComponent;

  const factory DataComponentsScreenEvent.deleteDataComponent({
    required DataComponent entity,
    @Default(null) Source? source,
  }) = DataComponentsScreenEventDeleteDataComponent;

  const factory DataComponentsScreenEvent.modifyDataComponent({
    required DataComponent dataComponent,
    required String oldDataComponentName,
    @Default(null) Source? source,
  }) = DataComponentsScreenEventModifyDataComponent;
}

@freezed
class DataComponentsScreenSR with _$DataComponentsScreenSR {
  const factory DataComponentsScreenSR.error({
    required String message,
  }) = _Error;
}

@freezed
class DataComponentsScreenState with _$DataComponentsScreenState {
  const factory DataComponentsScreenState.data({
    required Config config,
    @Default(0) int stateUpdate,
  }) = DataComponentsScreenStateData;
}
