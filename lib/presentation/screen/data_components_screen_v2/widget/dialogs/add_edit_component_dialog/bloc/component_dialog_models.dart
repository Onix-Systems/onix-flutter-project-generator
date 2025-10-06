import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';

part 'component_dialog_models.freezed.dart';

class ComponentDialogSR {}

@freezed
sealed class ComponentDialogState with _$ComponentDialogState {
  const factory ComponentDialogState({
    Component? component,
    Components? components,
    @Default([]) List<String> componentNames,
    @Default([]) List<DataVariableComponent> variables,
    @Default([]) List<DataObjectComponent> children,
  }) = _ComponentDialogState;
}
