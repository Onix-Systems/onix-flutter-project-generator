import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_bloc.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen/widgets/data_components_widgets/fields_dialog/bloc/fields_dialog_imports.dart';
import 'package:recase/recase.dart';

class FieldsDialogBloc
    extends BaseBloc<FieldsDialogEvent, FieldsDialogState, FieldsDialogSR> {
  FieldsDialogBloc() : super(const FieldsDialogStateData()) {
    on<FieldsDialogEventInit>(_onInit);
    on<FieldsDialogEventAddField>(_onAddField);
    on<FieldsDialogEventRemoveField>(_onRemoveField);
    on<FieldsDialogEventUpdateField>(_onUpdateField);
    on<FieldsDialogEventValidate>(_onValidate);
  }

  FutureOr<void> _onInit(
    FieldsDialogEventInit event,
    Emitter<FieldsDialogState> emit,
  ) {
    final components = <String>[];

    components.addAll(dataComponentRepository.dataComponents
        .where((element) =>
            element.name.pascalCase != event.componentName.pascalCase)
        .map((e) => e.name.pascalCase));

    components.sort((a, b) => a.compareTo(b));

    emit(state.copyWith(
      properties: event.properties,
      components: components,
    ));
  }

  FutureOr<void> _onAddField(
    FieldsDialogEventAddField event,
    Emitter<FieldsDialogState> emit,
  ) {
    final properties = List<Property>.from(state.properties);
    properties.add(
        event.isComponent ? Property(name: '', type: '') : Property.empty());

    add(const FieldsDialogEvent.validate());

    emit(
      state.copyWith(
        properties: properties,
      ),
    );
  }

  FutureOr<void> _onRemoveField(
    FieldsDialogEventRemoveField event,
    Emitter<FieldsDialogState> emit,
  ) {
    final properties = List<Property>.from(state.properties);
    properties.removeAt(event.index);

    add(const FieldsDialogEvent.validate());

    emit(
      state.copyWith(
        properties: properties,
      ),
    );
  }

  FutureOr<void> _onUpdateField(
    FieldsDialogEventUpdateField event,
    Emitter<FieldsDialogState> emit,
  ) {
    final properties = List<Property>.from(state.properties);
    properties[event.index] = event.property;

    add(const FieldsDialogEvent.validate());

    emit(
      state.copyWith(
        properties: properties,
      ),
    );
  }

  FutureOr<void> _onValidate(
    FieldsDialogEventValidate event,
    Emitter<FieldsDialogState> emit,
  ) {
    final errorIndexes = <int>[];

    for (final property in state.properties) {
      if (property.name.isEmpty ||
          property.type.isEmpty ||
          state.properties
                  .where((element) =>
                      element.name.pascalCase == property.name.pascalCase)
                  .length >
              1) {
        errorIndexes.add(state.properties.indexOf(property));
      }
    }

    emit(
      state.copyWith(
        errorIndexes: errorIndexes,
      ),
    );
  }
}
