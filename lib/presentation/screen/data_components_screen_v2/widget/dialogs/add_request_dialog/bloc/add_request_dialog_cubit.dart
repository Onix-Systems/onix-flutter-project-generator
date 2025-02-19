import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';

class AddRequestDialogCubit
    extends BaseCubit<AddRequestDialogState, AddRequestDialogSR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;
  final AddSourceRequestUseCase _addSourceRequestUseCase;

  AddRequestDialogCubit({
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
    required AddSourceRequestUseCase addSourceRequestUseCase,
  })  : _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        _addSourceRequestUseCase = addSourceRequestUseCase,
        super(AddRequestDialogState(request: RequestComponent.empty()));

  Future<void> init({
    required String sourceName,
    required RequestComponent? request,
  }) async {
    final components = _getSwaggerComponentsUseCase();

    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final componentNames = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    )..insert(0, 'Select body component');

    emit(
      state.copyWith(
        sourceName: sourceName,
        components: componentNames,
        request: request ?? state.request,
      ),
    );
  }

  void addRequest(RequestComponent request) {
    final addResult = _addSourceRequestUseCase(
      sourceName: state.sourceName,
      requestComponent: request,
    );

    if (addResult.isError) {
      onFailure(addResult.error.failure);
      return;
    }
  }

  void addBody({
    required String name,
    bool isRequired = false,
  }) {
    final body = RequestBodyComponent(
      name: 'requestBody',
      type: SwaggerReference(name),
      isRequired: isRequired,
    );

    final request = state.request.copyWith(
      requestBody: body,
    );

    emit(
      state.copyWith(
        request: request,
      ),
    );
  }
}
