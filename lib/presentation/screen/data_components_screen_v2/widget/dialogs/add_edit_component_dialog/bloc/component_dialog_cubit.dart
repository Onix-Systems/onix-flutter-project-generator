import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';

class ComponentDialogCubit
    extends BaseCubit<ComponentDialogState, ComponentDialogSR> {
  ComponentDialogCubit() : super(const ComponentDialogState());

  void init(Components components) {
    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    )..insertAll(0, DartTypes.types);

    emit(
      state.copyWith(
        components: componentNames,
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
      name: name,
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
      name: name,
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
}
