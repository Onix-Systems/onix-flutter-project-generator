import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';

class AddRequestDialogCubit
    extends BaseCubit<AddRequestDialogState, AddRequestDialogSR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;

  AddRequestDialogCubit({
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
  })  : _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        super(AddRequestDialogState(request: RequestComponent.empty()));

  Future<void> init({
    required RequestComponent? request,
  }) async {
    final components = _getSwaggerComponentsUseCase();

    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    )..insertAll(0, DartTypes.types);

    emit(
      state.copyWith(
        components: componentNames,
        request: request ?? state.request,
      ),
    );
  }

  void addBody({
    required RequestBodyComponent body,
    required List<SwaggerVariable> variables,
    bool isRequired = false,
  }) {
    emit(
      state.copyWith(
        request: state.request.copyWith(
          requestBody: body,
        ),
      ),
    );
  }
}
