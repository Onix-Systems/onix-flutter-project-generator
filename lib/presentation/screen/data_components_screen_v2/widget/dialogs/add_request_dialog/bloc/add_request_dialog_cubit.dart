import 'package:collection/collection.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_data_object_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/add_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/edit_source_request_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_component_by_name_use_case.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/get_swagger_components_usecase.dart';
import 'package:onix_flutter_bricks/domain/usecase/swagger/is_component_exists_use_case.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class AddRequestDialogCubit
    extends BaseCubit<AddRequestDialogState, AddRequestDialogSR> {
  final GetSwaggerComponentsUseCase _getSwaggerComponentsUseCase;
  final AddSourceRequestUseCase _addSourceRequestUseCase;
  final EditSourceRequestUseCase _editSourceRequestUseCase;
  final AddComponentUseCase _addComponentUseCase;
  final GetComponentByNameUseCase _getComponentByNameUseCase;
  final IsComponentExistsUseCase _isComponentExistsUseCase;

  AddRequestDialogCubit({
    required GetSwaggerComponentsUseCase getSwaggerComponentsUseCase,
    required AddSourceRequestUseCase addSourceRequestUseCase,
    required EditSourceRequestUseCase editSourceRequestUseCase,
    required AddComponentUseCase addComponentUseCase,
    required GetComponentByNameUseCase getComponentByNameUseCase,
    required IsComponentExistsUseCase isComponentExistsUseCase,
  })  : _getSwaggerComponentsUseCase = getSwaggerComponentsUseCase,
        _addSourceRequestUseCase = addSourceRequestUseCase,
        _editSourceRequestUseCase = editSourceRequestUseCase,
        _addComponentUseCase = addComponentUseCase,
        _getComponentByNameUseCase = getComponentByNameUseCase,
        _isComponentExistsUseCase = isComponentExistsUseCase,
        super(
          AddRequestDialogState(
            request: RequestComponent.empty(),
          ),
        );

  Future<void> init({
    required String sourceName,
    required RequestComponent? request,
  }) async {
    final componentNames = _getComponentNames();

    final body = request != null && request.requestBody != null
        ? _getComponentByName(request.requestBody!.type.getName())
        : null;

    final response = request != null &&
            request.response != ResponseParamComponent.operationDefault()
        ? _getComponentByName(request.response.type.getName())
        : null;

    emit(
      state.copyWith(
        sourceName: sourceName,
        components: componentNames,
        request: request ?? state.request,
        bodyComponent: body,
        responseComponent: response,
      ),
    );
  }

  void addRequest({required RequestComponent request, bool edit = false}) {
    if (state.bodyComponent != null) {
      final componentExists = _isComponentExistsUseCase(
        state.bodyComponent!.name,
      );

      if (!componentExists) {
        final addBodyComponentResult = _addComponentUseCase(
          component: state.bodyComponent!,
        );

        if (addBodyComponentResult.isError) {
          onFailure(addBodyComponentResult.error.failure);
          return;
        }
      }
    }

    if (state.responseComponent != null &&
        state.responseComponent != state.bodyComponent) {
      final componentExists = _isComponentExistsUseCase(
        state.responseComponent!.name,
      );

      if (!componentExists) {
        final addResponseComponentResult = _addComponentUseCase(
          component: state.responseComponent!,
        );

        if (addResponseComponentResult.isError) {
          onFailure(addResponseComponentResult.error.failure);
          return;
        }
      }
    }

    Result result;

    if (edit) {
      result = _editSourceRequestUseCase(
        sourceName: state.sourceName,
        oldComponent: state.request,
        requestComponent: request,
      );
    } else {
      result = _addSourceRequestUseCase(
        sourceName: state.sourceName,
        requestComponent: request,
      );
    }

    if (result.isError) {
      onFailure(result.error.failure);
    }
  }

  void addBody({
    required String name,
    Component? bodyComponent,
    bool isRequired = false,
  }) {
    final components = _getComponentNames();

    if (name == 'Empty') {
      emit(
        state.copyWith(
          components: components,
          bodyComponent: null,
          request: state.request.copyWith(requestBody: null),
        ),
      );
      return;
    }

    Component? component;

    if (bodyComponent == null) {
      component = _getComponentByName(name);
    }

    final body = RequestBodyComponent(
      name: 'requestBody',
      type: SwaggerReference(name),
      isRequired: isRequired,
      fromSwagger: component?.fromSwagger ?? false,
    );

    final request = state.request.copyWith(
      requestBody: body,
    );

    emit(
      state.copyWith(
        request: request,
        components: components,
        bodyComponent: bodyComponent ?? component,
        tempBodyComponent: bodyComponent ?? state.tempBodyComponent,
      ),
    );
  }

  void addResponse({
    required String name,
    Component? responseComponent,
    bool isRequired = false,
  }) {
    final components = _getComponentNames();

    if (name == 'Empty') {
      emit(
        state.copyWith(
          responseComponent: null,
          components: components,
          request: state.request.copyWith(
            response: ResponseParamComponent.operationDefault(),
          ),
        ),
      );
      return;
    }

    Component? component;

    if (responseComponent == null) {
      component = _getComponentByName(name);
    }

    final response = ResponseParamComponent(
      name: 'response',
      type: SwaggerReference(name),
      isRequired: isRequired,
      fromSwagger: component?.fromSwagger ?? false,
    );

    final request = state.request.copyWith(
      response: response,
    );

    emit(
      state.copyWith(
        request: request,
        components: components,
        responseComponent: responseComponent ?? component,
        tempResponseComponent: responseComponent ?? state.tempResponseComponent,
      ),
    );
  }

  List<String> _getComponentNames() {
    final components = _getSwaggerComponentsUseCase();

    final enums = components.enums.map((e) => e.name).toList();
    final dataObjects =
        components.dataObjects.map((e) => e.fileReference.reference).toList();

    final sortedComponents = [...enums, ...dataObjects].sorted(
      (a, b) => a.compareTo(b),
    );

    if (state.tempResponseComponent != null) {
      sortedComponents.insert(0, state.tempResponseComponent!.name);
    }

    if (state.tempBodyComponent != null) {
      sortedComponents.insert(0, state.tempBodyComponent!.name);
    }

    return sortedComponents;
  }

  Component? _getComponentByName(String name) {
    Component? component;

    if (name == state.tempBodyComponent?.name) {
      component = state.tempBodyComponent;
    } else if (name == state.tempResponseComponent?.name) {
      component = state.tempResponseComponent;
    } else {
      final componentResult = _getComponentByNameUseCase(name);

      if (componentResult.isError) {
        onFailure(componentResult.error.failure);
        return null;
      }

      component = componentResult.data;
    }

    return component;
  }
}
