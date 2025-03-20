import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/widgets/add_component_row.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/widgets/operation_id_field.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/widgets/param_button.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/widgets/path_field.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/add_request_params_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';
import 'package:recase/recase.dart';

class AddEditRequestDialog extends StatefulWidget {
  final String sourceName;
  final RequestComponent? request;

  const AddEditRequestDialog({
    required this.sourceName,
    this.request,
    super.key,
  });

  @override
  State<AddEditRequestDialog> createState() => _AddEditRequestDialogState();
}

class _AddEditRequestDialogState extends BaseCubitState<AddRequestDialogState,
    AddRequestDialogCubit, AddRequestDialogSR, AddEditRequestDialog> {
  final TextEditingController _pathController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final FocusNode _mainFocusNode = FocusNode();

  final _autoSizeGroup = AutoSizeGroup();

  var _requestType = SwaggerPathRequestType.get;

  bool _responseIsList = false;

  @override
  AddRequestDialogCubit createCubit() => GetIt.I.get<AddRequestDialogCubit>();

  @override
  void onCubitCreated(BuildContext context, AddRequestDialogCubit cubit) {
    cubit.init(request: widget.request, sourceName: widget.sourceName);
    super.onCubitCreated(context, cubit);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    super.onFailure(context, failure);
    if (failure is SwaggerParserFailure) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).addVariableFailureTitle,
        content: Text(
          failure.getTranslatedMessage(context),
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pathController.text = widget.request?.path ?? '';
    _idController.text = widget.request?.operationId ?? '';
    _responseIsList = widget.request?.response.type is SwaggerArray;
    _requestType = widget.request?.type ?? SwaggerPathRequestType.get;
    _mainFocusNode.requestFocus();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      onSR: _onSR,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
            color: context.appColors.darkColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Material(
            color: Colors.transparent,
            child: blocBuilder(
              builder: (context, state) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.request != null
                              ? S.of(context).modifyRequest
                              : S.of(context).addRequest,
                          style: context.appTextStyles.fs18,
                        ),
                        const Gap(20),
                        Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: DropdownButton2<String>(
                                items: SwaggerPathRequestType.values
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e.name,
                                        child: Text(e.name.pascalCase),
                                      ),
                                    )
                                    .toList(),
                                value: _requestType.name,
                                onChanged: (value) {
                                  if (value != null &&
                                      value != _requestType.name) {
                                    setState(() {
                                      _requestType =
                                          SwaggerPathRequestType.fromString(
                                        value,
                                      );
                                    });
                                  }
                                },
                                isExpanded: true,
                                underline: const SizedBox(),
                                buttonStyleData: ButtonStyleData(
                                  decoration: BoxDecoration(
                                    color: context.appColors.darkContrastColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: PathField(
                                pathController: _pathController,
                                pathParams: state.request.pathParams
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: () => setState(() {}),
                              ),
                            ),
                            Expanded(
                              child: OperationIdField(
                                idController: _idController,
                                onChanged: () => setState(() {}),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        AddComponentRow(
                          state: state,
                          body: true,
                          editComponent: state.bodyComponent != null &&
                                  !state.bodyComponent!.fromSwagger
                              ? state.bodyComponent
                              : null,
                          componentName: _getComponentName('RequestBody'),
                          selectedComponentName: state.bodyComponent?.name,
                          onComponentSelected: (value) =>
                              cubitOf(context).addBody(name: value),
                          onComponentCreated: (value) =>
                              cubitOf(context).addBody(
                            name: value.name,
                            bodyComponent: value,
                          ),
                          onChildrenPass: (children) =>
                              cubitOf(context).addChildren(children),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            LabeledCheckbox(
                              label: 'List',
                              initialValue: _responseIsList,
                              onAction: () {
                                setState(() {
                                  _responseIsList = !_responseIsList;
                                });
                              },
                            ),
                            Expanded(
                              child: AddComponentRow(
                                state: state,
                                body: false,
                                editComponent: state.responseComponent !=
                                            null &&
                                        !state.responseComponent!.fromSwagger
                                    ? state.responseComponent
                                    : null,
                                componentName: _getComponentName('Response'),
                                selectedComponentName:
                                    state.responseComponent?.name,
                                onComponentSelected: (value) =>
                                    cubitOf(context).addResponse(
                                  name: value,
                                  isList: _responseIsList,
                                ),
                                onComponentCreated: (value) {
                                  cubitOf(context).addResponse(
                                    name: value.name,
                                    responseComponent: value,
                                  );
                                },
                                onChildrenPass: (children) =>
                                    cubitOf(context).addChildren(children),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: ParamButton(
                                paramType: 'multipart',
                                edit: state.request.multipartBody.isNotEmpty,
                                autoSizeGroup: _autoSizeGroup,
                                onPressed: () => showCupertinoModalPopup<
                                    List<RequestMultipartComponent>>(
                                  context: context,
                                  builder: (ctx) => AddRequestParamsDialog<
                                      RequestMultipartComponent>(
                                    params: state.request.multipartBody,
                                    paramType: 'multipart',
                                  ),
                                ).then((value) {
                                  if (context.mounted && value != null) {
                                    cubitOf(context).addMultipartBody(value);
                                  }
                                }),
                                onDelete: () =>
                                    cubitOf(context).removeMultipartBody(),
                              ),
                            ),
                            Expanded(
                              child: ParamButton(
                                paramType: 'path',
                                edit: state.request.pathParams.isNotEmpty,
                                autoSizeGroup: _autoSizeGroup,
                                onPressed: () => showCupertinoModalPopup<
                                    List<RequestPathComponent>>(
                                  context: context,
                                  builder: (ctx) => AddRequestParamsDialog<
                                      RequestPathComponent>(
                                    params: state.request.pathParams,
                                    paramType: 'path',
                                  ),
                                ).then((value) {
                                  if (context.mounted && value != null) {
                                    cubitOf(context).addPathParams(value);
                                  }
                                }),
                                onDelete: () =>
                                    cubitOf(context).removePathParams(),
                              ),
                            ),
                            Expanded(
                              child: ParamButton(
                                paramType: 'query',
                                edit: state.request.queryParams.isNotEmpty,
                                autoSizeGroup: _autoSizeGroup,
                                onPressed: () => showCupertinoModalPopup<
                                    List<RequestQueryComponent>>(
                                  context: context,
                                  builder: (ctx) => AddRequestParamsDialog<
                                      RequestQueryComponent>(
                                    params: state.request.queryParams,
                                    paramType: 'query',
                                  ),
                                ).then((value) {
                                  if (context.mounted && value != null) {
                                    cubitOf(context).addQueryParams(value);
                                  }
                                }),
                                onDelete: () =>
                                    cubitOf(context).removeQueryParams(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  DialogActionButtons(
                    focusNode: _mainFocusNode,
                    leftButtonLabel: S.of(context).ok,
                    leftButtonOnPressed: () => _onOk(context, state),
                    isLeftButtonActive: _valid(),
                    rightButtonLabel: S.of(context).cancel,
                    rightButtonOnPressed: () => pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSR(BuildContext context, AddRequestDialogSR sr) {
    sr.when(
      success: () {
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  void pop(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  bool _valid() {
    return _pathController.text.isNotEmpty;
  }

  String _getComponentName(String suffix) {
    return '${_idController.text.isNotEmpty ? _idController.text : '${_requestType.name}_${_pathController.text.clearPathToName()}'.camelCase}$suffix';
  }

  Future<void> _onOk(BuildContext context, AddRequestDialogState state) async {
    if (state.request.requestBody != null &&
        state.request.multipartBody.isNotEmpty) {
      await Dialogs.showOkDialog(
        context: context,
        title: S.of(context).warning,
        content: Text(
          S.of(context).requestBodyMultipartConflict,
        ),
      );
    }

    if (context.mounted) {
      _onAddRequest(context, state);
    }
  }

  void _onAddRequest(BuildContext context, AddRequestDialogState state) {
    final edit = widget.request != null;

    var request = state.request;

    if (edit) {
      final switched = cubitOf(context)
          .switchResponseIsList(responseIsList: _responseIsList);
      if (switched != null) {
        request = switched;
      }
    }

    cubitOf(context).addRequest(
      edit: edit,
      request: request.copyWith(
        operationId: _idController.text.isNotEmpty
            ? _idController.text
            : '${_requestType.name}_${_pathController.text.clearPathToName()}'
                .camelCase,
        path: _pathController.text,
        type: _requestType,
        description: '',
      ),
    );
  }
}
