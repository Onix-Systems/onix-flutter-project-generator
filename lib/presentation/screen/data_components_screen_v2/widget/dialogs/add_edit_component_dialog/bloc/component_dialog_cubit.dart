import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';
import 'package:recase/recase.dart';

class ComponentDialogCubit
    extends BaseCubit<ComponentDialogState, ComponentDialogSR> {
  final AddComponentUseCase _addDataObjectComponentUseCase;
  final EditComponentUseCase _editDataObjectComponentUseCase;
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;

  ComponentDialogCubit({
    required AddComponentUseCase addDataObjectComponentUseCase,
    required EditComponentUseCase editDataObjectComponentUseCase,
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
  })  : _addDataObjectComponentUseCase = addDataObjectComponentUseCase,
        _editDataObjectComponentUseCase = editDataObjectComponentUseCase,
        _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        super(const ComponentDialogState());

  void init({
    Component? component,
  }) {
    final components = _getSwaggerComponentsUseCase();

    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    )..insertAll(0, DartTypes.types);

    if (component != null) {
      componentNames.remove(component.name);
    }

    final variables = component != null
        ? (component is DataObjectComponent)
            ? component.variables
            : (component as EnumParamComponent)
                .type
                .enumValues
                .map(
                  (e) => DataVariableComponent(
                    name: e,
                    type: SwaggerVariable('string'),
                    isRequired: true,
                  ),
                )
                .toList()
        : <DataVariableComponent>[];

    emit(
      state.copyWith(
        component: component,
        components: components,
        componentNames: componentNames,
        variables: variables,
      ),
    );
  }

  void addVariable({
    required String name,
    required String type,
    bool isRequired = false,
    bool isList = false,
  }) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final isEnum = _isEnum(variableType);

    final component = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
      isEnum: isEnum,
    );

    final variable = isList
        ? DataVariableComponent(
            name: name.camelCase,
            type: SwaggerArray(
              SwaggerModelVariableResponseV3(
                name: name.camelCase,
                type: variableType,
                isRequired: isRequired,
              ),
            ),
            isRequired: isRequired,
            isEnum: isEnum,
          )
        : component;

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
    bool isList = false,
  }) {
    final variableType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    final isEnum = _isEnum(variableType);

    final component = DataVariableComponent(
      name: name.camelCase,
      type: variableType,
      isRequired: isRequired,
      isEnum: isEnum,
    );

    final variable = isList
        ? DataVariableComponent(
            name: name.camelCase,
            type: SwaggerArray(
              SwaggerModelVariableResponseV3(
                name: name.camelCase,
                type: variableType,
                isRequired: isRequired,
              ),
            ),
            isRequired: isRequired,
            isEnum: isEnum,
          )
        : component;

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

  Future<Component> addDataObject({
    required String name,
    bool isEnum = false,
    bool addToRepository = true,
  }) async {
    Component? dataObject;

    name = name.pascalCase;

    if (isEnum) {
      dataObject = EnumParamComponent(
        name: name,
        type: SwaggerEnum(
          name,
          state.variables.map((e) => e.name).toList(),
        ),
        fromSwagger: false,
      );
    } else {
      dataObject = DataObjectComponent(
        name: name,
        fileReference: SwaggerReference(name),
        variables: state.variables,
        fromSwagger: false,
      );
    }

    if (addToRepository) {
      _addDataObjectComponentUseCase(component: dataObject).when(
        success: (value) {
          addSr(const ComponentDialogSR.success());
        },
        error: onFailure,
      );
    }

    return dataObject;
  }

  Future<void> editDataObject({required String name}) async {
    final component = state.component;
    if (component == null) return;

    Component? dataObject;

    if (component is DataObjectComponent) {
      dataObject = DataObjectComponent(
        name: name,
        fileReference: SwaggerReference(name),
        variables: state.variables,
        fromSwagger: false,
      );
    } else if (component is EnumParamComponent) {
      dataObject = EnumParamComponent(
        name: name,
        type: SwaggerEnum(
          name,
          state.variables.map((e) => e.name).toList(),
        ),
        fromSwagger: false,
      );
    }

    if (dataObject == null) return;

    _editDataObjectComponentUseCase(
      oldName: component.name,
      component: dataObject,
    ).when(
      success: (value) {
        addSr(const ComponentDialogSR.success());
      },
      error: onFailure,
    );
  }

  bool _isEnum(SwaggerType variableType) =>
      variableType is SwaggerReference &&
      state.components!.enums.any((e) => e.name == variableType.getName());
}
