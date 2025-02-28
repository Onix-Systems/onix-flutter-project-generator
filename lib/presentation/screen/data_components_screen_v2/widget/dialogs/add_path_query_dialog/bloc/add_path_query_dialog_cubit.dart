import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_component_by_name_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_path_query_dialog/bloc/add_path_query_dialog_models.dart';

class AddPathQueryDialogCubit
    extends BaseCubit<AddPathQueryDialogState, AddPathQueryDialogSR> {
  final GetComponentByNameUseCase _getComponentByNameUseCase;

  AddPathQueryDialogCubit({
    required GetComponentByNameUseCase getComponentByNameUseCase,
  })  : _getComponentByNameUseCase = getComponentByNameUseCase,
        super(const AddPathQueryDialogState());

  void init(List<RequestParamComponent> params) {
    emit(state.copyWith(params: params));
  }

  void addParam({
    required Type requestParamComponentType,
    required String type,
    required String name,
    required bool isList,
  }) {
    final paramType = DartTypes.types.contains(type)
        ? SwaggerVariable(type)
        : SwaggerReference(type);

    var isEnum = false;

    if (paramType is SwaggerReference) {
      final component = _getComponentByNameUseCase(type);

      if (component is SwaggerEnum) {
        isEnum = true;
      }
    }

    RequestParamComponent? paramComponent;

    if (requestParamComponentType == RequestPathComponent) {
      paramComponent = RequestPathComponent(
        name: name,
        type: paramType,
        isEnum: isEnum,
        isRequired: true,
        fromSwagger: false,
      );
    }

    if (requestParamComponentType == RequestQueryComponent) {
      logger.f('addParam: $name, $type, $isList');
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
