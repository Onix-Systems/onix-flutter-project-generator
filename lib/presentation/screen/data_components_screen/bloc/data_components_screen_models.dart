import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/source/source.dart';

part 'data_components_screen_models.freezed.dart';

@freezed
class DataComponentsScreenEvent with _$DataComponentsScreenEvent {
  const factory DataComponentsScreenEvent.init() =
      DataComponentsScreenEventInit;
}

@freezed
class DataComponentsScreenSR with _$DataComponentsScreenSR {
  const factory DataComponentsScreenSR.loadFinished() = _LoadFinished;
}

@freezed
class DataComponentsScreenState with _$DataComponentsScreenState {
  const factory DataComponentsScreenState.data({
    @Default({}) Set<DataComponent> dataComponents,
    @Default({}) Set<Source> sources,
  }) = DataComponentsScreenStateData;
}
