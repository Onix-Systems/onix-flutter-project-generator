import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/data_component.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';

part 'fields_dialog_models.freezed.dart';

@freezed
class FieldsDialogEvent with _$FieldsDialogEvent {
  const factory FieldsDialogEvent.init({
    required List<Property> properties,
    required String componentName,
  }) = FieldsDialogEventInit;

  const factory FieldsDialogEvent.addField({
    @Default(false) bool isComponent,
  }) = FieldsDialogEventAddField;

  const factory FieldsDialogEvent.removeField({
    required int index,
  }) = FieldsDialogEventRemoveField;

  const factory FieldsDialogEvent.updateField({
    required int index,
    required Property property,
  }) = FieldsDialogEventUpdateField;

  const factory FieldsDialogEvent.validate() = FieldsDialogEventValidate;
}

@freezed
class FieldsDialogSR with _$FieldsDialogSR {
  const factory FieldsDialogSR.loadFinished() = _LoadFinished;

  const factory FieldsDialogSR.validated() = _Validated;
}

@freezed
class FieldsDialogState with _$FieldsDialogState {
  const factory FieldsDialogState.data({
    @Default('') componentName,
    @Default([]) List<Property> properties,
    @Default([]) List<DataComponent> components,
    @Default([]) List<int> errorIndexes,
  }) = FieldsDialogStateData;
}
