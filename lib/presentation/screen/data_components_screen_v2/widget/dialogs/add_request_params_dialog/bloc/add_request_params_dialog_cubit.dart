import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/model/swagger/model_variable/swagger_model_variable_response_v3.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/enum_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_component_by_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/bloc/add_request_params_dialog_models.dart';

class AddRequestParamsDialogCubit
    extends BaseCubit<AddRequestParamsDialogState, AddRequestParamsDialogSR> {
  final GetComponentByNameUseCase _getComponentByNameUseCase;
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;

  AddRequestParamsDialogCubit({
    required GetComponentByNameUseCase getComponentByNameUseCase,
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
  })  : _getComponentByNameUseCase = getComponentByNameUseCase,
        _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        super(const AddRequestParamsDialogState());

  void init<T>({required List<RequestParamComponent> params}) {
    final types = DartTypes.types.toList();

    if (T == RequestQueryComponent || T == RequestMultipartComponent) {
      final swaggerComponents = _getSwaggerComponentsUseCase();

      final components = [
        ...swaggerComponents.dataObjects,
        ...swaggerComponents.enums,
      ];

      final componentTypes = components.map((e) => e.name).toList();

      types.addAll(componentTypes);
    }

    emit(
      state.copyWith(
        params: params,
        types: types,
      ),
    );
  }

  void addParam<T>({
    required String type,
    required String name,
    required bool isList,
  }) {
    var paramType = DartTypes.types.contains(type)
        ? SwaggerVariable(DartTypes.toSwaggerType(type))
        : SwaggerReference(type);

    if (isList) {
      paramType = SwaggerArray(
        SwaggerModelVariableResponseV3(
          name: name,
          type: paramType,
          isRequired: false,
        ),
      );
    }

    var isEnum = false;

    if (paramType is SwaggerReference) {
      final component = _getComponentByNameUseCase(type);

      if (component is EnumParamComponent) {
        isEnum = true;
      }
    }

    RequestParamComponent? paramComponent;

    if (T == RequestPathComponent) {
      paramComponent = RequestPathComponent(
        name: name,
        type: paramType,
        isEnum: isEnum,
        isRequired: true,
        fromSwagger: false,
      );
    }

    if (T == RequestQueryComponent) {
      paramComponent = RequestQueryComponent(
        name: name,
        type: paramType,
        isEnum: isEnum,
        isRequired: false,
        fromSwagger: false,
      );
    }

    if (T == RequestMultipartComponent) {
      paramComponent = RequestMultipartComponent(
        name: name,
        type: paramType,
        isEnum: isEnum,
        isRequired: true,
        fromSwagger: false,
      );
    }

    if (paramComponent != null) {
      emit(state.copyWith(params: [...state.params, paramComponent]));
    }
  }

  void editParam({
    required String name,
    required String type,
    required int index,
    required bool isList,
  }) {
    logger.f('editParam: $name, $type, $index, $isList');
    //emit(state.copyWith(params: newParams));
  }
}
