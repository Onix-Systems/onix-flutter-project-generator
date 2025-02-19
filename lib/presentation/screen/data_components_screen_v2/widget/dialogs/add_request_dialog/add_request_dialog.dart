import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/enum/swagger_path_request_type.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/variable_name_extension.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/response_param_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/add_edit_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
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

  var _requestType = SwaggerPathRequestType.get;

  @override
  AddRequestDialogCubit createCubit() => GetIt.I.get<AddRequestDialogCubit>();

  @override
  void onCubitCreated(BuildContext context, AddRequestDialogCubit cubit) {
    cubit.init(request: widget.request, sourceName: widget.sourceName);
    super.onCubitCreated(context, cubit);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
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
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).addRequest,
                        style: context.appTextStyles.fs18,
                      ),
                      const Gap(20),
                      Row(
                        spacing: 10,
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
                            child: TextField(
                              controller: _pathController,
                              onChanged: (_) {
                                setState(() {});
                              },
                              inputFormatters: const [
                                FirstCharacterNotDigitFormatter(),
                              ],
                              decoration: InputDecoration(
                                hintText: S.of(context).path,
                                hintStyle: context.appTextStyles.fs18?.copyWith(
                                  color: context.appColors.controlColor
                                      .withAlpha(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                fillColor: context.appColors.darkContrastColor,
                                hoverColor: context.appColors.darkContrastColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: context.appTextStyles.fs18,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _idController,
                              onChanged: (_) {
                                setState(() {});
                              },
                              inputFormatters: const [
                                FirstCharacterNotDigitFormatter(),
                              ],
                              decoration: InputDecoration(
                                hintText: 'OperationId',
                                hintStyle: context.appTextStyles.fs18?.copyWith(
                                  color: context.appColors.controlColor
                                      .withAlpha(100),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                fillColor: context.appColors.darkContrastColor,
                                hoverColor: context.appColors.darkContrastColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: context.appTextStyles.fs18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                // RequestItem(
                //   request: state.request,
                // ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    AppFilledButton(
                      label: 'Add body',
                      onPressed: () => showCupertinoModalPopup<String>(
                        context: context,
                        builder: (ctx) {
                          final name =
                              '${_idController.text.isNotEmpty ? _idController.text : '${_requestType.name}_${_pathController.text.clearPathToName()}'.camelCase}RequestBody';
                          return AddEditComponentDialog(
                            name: name,
                            requestBodyComponent: true,
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          if (context.mounted) {
                            cubitOf(context).addBody(name: value);
                          }
                        }
                      }),
                    ),
                  ],
                ),
                const Gap(20),
                DialogActionButtons(
                  leftButtonLabel: S.of(context).ok,
                  leftButtonOnPressed: () {
                    Navigator.of(context).pop(
                      state.request.copyWith(
                        operationId: _idController.text,
                        path: _pathController.text,
                        type: _requestType,
                        description: '',
                        requestBody: null,
                        multipartBody: [],
                        queryParams: [],
                        pathParams: [],
                        response: ResponseParamComponent(
                          name: 'response',
                          type: SwaggerReference('reference'),
                          isRequired: true,
                        ),
                      ),
                    );
                  },
                  isLeftButtonActive: _pathController.text.isNotEmpty,
                  rightButtonLabel: S.of(context).cancel,
                  rightButtonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
