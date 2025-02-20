import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';

part 'component_dialog_models.freezed.dart';

@freezed
class ComponentDialogSR with _$ComponentDialogSR {
  const factory ComponentDialogSR.success() = _ComponentDialogSRSuccess;
}

@freezed
class ComponentDialogState with _$ComponentDialogState {
  const factory ComponentDialogState({
    Component? component,
    Components? components,
    @Default([]) List<String> componentNames,
    @Default([]) List<DataVariableComponent> variables,
  }) = _ComponentDialogState;
}
