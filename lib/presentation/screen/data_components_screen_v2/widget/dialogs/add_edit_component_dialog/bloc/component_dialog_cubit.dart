import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/json_parser_failure.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/domain/service/json_parser/json_parser.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/is_component_exists_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';
import 'package:recase/recase.dart';

class ComponentDialogCubit
    extends BaseCubit<ComponentDialogState, ComponentDialogSR> {
  final AddComponentUseCase _addDataObjectComponentUseCase;
  final EditComponentUseCase _editDataObjectComponentUseCase;
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;
  final IsComponentExistsUseCase _isComponentExistsUseCase;

  ComponentDialogCubit({
    required AddComponentUseCase addDataObjectComponentUseCase,
    required EditComponentUseCase editDataObjectComponentUseCase,
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
    required IsComponentExistsUseCase isComponentExistsUseCase,
  })  : _addDataObjectComponentUseCase = addDataObjectComponentUseCase,
        _editDataObjectComponentUseCase = editDataObjectComponentUseCase,
        _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        _isComponentExistsUseCase = isComponentExistsUseCase,
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
    if (_hasDuplicates(name: name)) {
      return;
    }

    final variable = _createVariable(type, name, isRequired, isList);

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
    if (state.variables[index].name != name && _hasDuplicates(name: name)) {
      return;
    }

    final variable = _createVariable(type, name, isRequired, isList);

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

  Component? addDataObject({
    required String name,
    bool isEnum = false,
    bool addToRepository = true,
    bool addChildren = false,
  }) {
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
      final componentsToAdd = [
        dataObject,
      ];

      if (addChildren) {
        for (final child in state.children) {
          if (!componentsToAdd.any((e) => e.name == child.name)) {
            componentsToAdd.add(child);
          }
        }
      }

      for (final component in componentsToAdd) {
        final result = _addDataObjectComponentUseCase(component: component);

        if (result.isError) {
          onFailure(result.error.failure);
          return null;
        }
      }
    }

    return dataObject;
  }

  Component? editDataObject({required String name}) {
    final component = state.component;
    if (component == null) return null;

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

    if (dataObject == null) return null;

    final componentExists = _isComponentExistsUseCase(name);

    if (!componentExists) {
      return dataObject;
    }

    final result = _editDataObjectComponentUseCase(
      oldName: component.name,
      component: dataObject,
    );

    if (result.isError) {
      onFailure(result.error.failure);
      return null;
    }

    return dataObject;
  }

  void addFromJson({required String json}) {
    try {
      final parsedResult = JsonParser.parseJson(json, state.component?.name);

      if (parsedResult.isError) {
        onFailure(
          parsedResult.error.failure,
        );
        return;
      }

      final parsed = parsedResult.data;

      final parsedChildren = parsed.sublist(1);

      final children = <DataObjectComponent>{};

      if (parsedChildren.isNotEmpty) {
        for (final child in parsedChildren) {
          final exists = _hasDuplicates(name: child.name, showFailure: false) ||
              _isComponentExistsUseCase(child.name);

          if (!exists) {
            children.add(child);
          }
        }
      }

      emit(
        state.copyWith(
          variables: [...state.variables, ...parsed.first.variables],
          children: children.toList(),
        ),
      );
    } catch (e) {
      onFailure(JsonParserFailure(failureText: e.toString()));
    }
  }

  DataVariableComponent _createVariable(
      String type, String name, bool isRequired, bool isList) {
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
    return variable;
  }

  bool _isEnum(SwaggerType variableType) =>
      variableType is SwaggerReference &&
      state.components!.enums.any((e) => e.name == variableType.getName());

  bool _hasDuplicates({required String name, bool showFailure = true}) {
    if (state.variables
        .any((element) => element.name.toUpperCase() == name.toUpperCase())) {
      final existingName = state.variables
          .firstWhere(
            (element) => element.name.toUpperCase() == name.toUpperCase(),
          )
          .name;
      if (showFailure) {
        onFailure(SwaggerParserFailureAlreadyExists(existingName));
      }
      return true;
    }
    return false;
  }
}
