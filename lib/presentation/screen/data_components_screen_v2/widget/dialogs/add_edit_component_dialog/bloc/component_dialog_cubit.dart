import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_data_object_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';
import 'package:recase/recase.dart';

class ComponentDialogCubit
    extends BaseCubit<ComponentDialogState, ComponentDialogSR> {
  final AddDataObjectComponentUseCase _addDataObjectComponentUseCase;
  final EditDataObjectComponentUseCase _editDataObjectComponentUseCase;

  ComponentDialogCubit({
    required AddDataObjectComponentUseCase addDataObjectComponentUseCase,
    required EditDataObjectComponentUseCase editDataObjectComponentUseCase,
  })  : _addDataObjectComponentUseCase = addDataObjectComponentUseCase,
        _editDataObjectComponentUseCase = editDataObjectComponentUseCase,
        super(const ComponentDialogState());

  void init({
    required Components components,
    String? componentName,
  }) {
    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    )..insertAll(0, DartTypes.types);

    if (componentName != null) {
      componentNames.remove(componentName);
    }

    emit(
      state.copyWith(
        componentName: componentName,
        components: componentNames,
        variables: componentName != null
            ? components.dataObjects
                .firstWhere((e) => e.name == componentName)
                .variables
            : [],
      ),
    );
  }

  void addVariable({
    required String name,
    required String type,
    bool isRequired = false,
    bool isEnum = false,
  }) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final variable = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
      isEnum: isEnum,
    );

    emit(
      state.copyWith(
        variables: [...state.variables, variable],
      ),
    );
  }

  void editVariable({
    required String name,
    required String type,
    required int index,
    bool isRequired = false,
    bool isEnum = false,
  }) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final variable = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
      isEnum: isEnum,
    );

    final variables = state.variables.toList();
    variables[index] = variable;

    emit(
      state.copyWith(
        variables: variables,
      ),
    );
  }

  void deleteVariable(DataVariableComponent variable) {
    emit(
      state.copyWith(
        variables: state.variables.where((e) => e != variable).toList(),
      ),
    );
  }

  Future<void> addDataObject({required String name}) async {
    final dataObject = DataObjectComponent(
      name: name,
      fileReference: SwaggerReference(name),
      variables: state.variables,
      fromSwagger: false,
    );

    _addDataObjectComponentUseCase(component: dataObject).when(
      success: (value) {
        addSr(const ComponentDialogSR.success());
      },
      error: onFailure,
    );
  }

  Future<void> editDataObject({required String name}) async {
    final componentName = state.componentName;
    if (componentName == null) return;

    final dataObject = DataObjectComponent(
      name: name,
      fileReference: SwaggerReference(name),
      variables: state.variables,
      fromSwagger: false,
    );

    _editDataObjectComponentUseCase(
      oldName: componentName,
      component: dataObject,
    ).when(
      success: (value) {
        addSr(const ComponentDialogSR.success());
      },
      error: onFailure,
    );
  }
}
