import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:recase/recase.dart';

class AddRequestDialogCubit
    extends BaseCubit<AddRequestDialogState, AddRequestDialogSR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;
  final AddSourceRequestUseCase _addSourceRequestUseCase;
  final AddComponentUseCase _addComponentUseCase;

  AddRequestDialogCubit({
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
    required AddSourceRequestUseCase addSourceRequestUseCase,
    required AddComponentUseCase addComponentUseCase,
  })  : _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        _addSourceRequestUseCase = addSourceRequestUseCase,
        _addComponentUseCase = addComponentUseCase,
        super(AddRequestDialogState(request: RequestComponent.empty()));

  Future<void> init({
    required String sourceName,
    required RequestComponent? request,
  }) async {
    final componentNames = _getComponentNames()
      ..insert(0, 'Select body component');

    emit(
      state.copyWith(
        sourceName: sourceName,
        components: componentNames,
        request: request ?? state.request,
      ),
    );
  }

  void addRequest(RequestComponent request) {
    if (state.bodyComponent != null) {
      final addBodyComponentResult = _addComponentUseCase(
        component: state.bodyComponent!,
      );

      if (addBodyComponentResult.isError) {
        onFailure(addBodyComponentResult.error.failure);
        return;
      }
    }

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
    Component? bodyComponent,
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

    final components = _getComponentNames();

    if (bodyComponent == null) {
      components.remove(name.pascalCase);
    }

    components.insert(0, name.pascalCase);

    emit(
      state.copyWith(
        request: request,
        components: components,
        bodyComponent: bodyComponent,
      ),
    );
  }

  List<String> _getComponentNames() {
    final components = _getSwaggerComponentsUseCase();

    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    return [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    );
  }
}
