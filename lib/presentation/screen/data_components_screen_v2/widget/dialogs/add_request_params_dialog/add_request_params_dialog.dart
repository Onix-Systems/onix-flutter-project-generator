import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/domain/entity/failure/swagger_parser_failure.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/bloc/add_request_params_dialog_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/widgets/add_param_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_params_dialog/widgets/params_preview.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';

class AddRequestParamsDialog<T extends RequestParamComponent>
    extends StatefulWidget {
  final List<T> params;
  final String paramType;

  const AddRequestParamsDialog({
    required this.params,
    required this.paramType,
    super.key,
  });

  @override
  State<AddRequestParamsDialog> createState() =>
      _AddRequestParamsDialogState<T>();
}

class _AddRequestParamsDialogState<T extends RequestParamComponent>
    extends BaseCubitState<
        AddRequestParamsDialogState,
        AddRequestParamsDialogCubit,
        AddRequestParamsDialogSR,
        AddRequestParamsDialog> {
  @override
  AddRequestParamsDialogCubit createCubit() =>
      GetIt.I.get<AddRequestParamsDialogCubit>();

  @override
  void onCubitCreated(BuildContext context, AddRequestParamsDialogCubit cubit) {
    super.onCubitCreated(context, cubit);
    cubit.init<T>(params: widget.params);
  }

  @override
  void onFailure(BuildContext context, Failure failure) {
    super.onFailure(context, failure);
    if (failure is SwaggerParserFailure) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).addParamFailureTitle,
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
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        decoration: BoxDecoration(
          color: context.appColors.darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            Text(
              S.of(context).addParams(widget.paramType),
              style: context.appTextStyles.fs18,
            ),
            const Gap(20),
            blocBuilder(
              builder: (context, state) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Column(
                      spacing: 20,
                      children: [
                        AppFilledButton(
                          label: S.of(context).addParam,
                          icon: Icons.add,
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (ctx) => AddParamDialog<T>(
                                types: state.types,
                                process: (type, name, isList) {
                                  cubitOf(context).addParam<T>(
                                    name: name,
                                    type: type,
                                    isList: isList,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ParamsPreview(
                        params: state.params,
                        onEdit: (param) {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (ctx) => AddParamDialog(
                              param: param,
                              types: state.types,
                              process: (type, name, isList) {
                                cubitOf(context).editParam<T>(
                                  name: name,
                                  type: type,
                                  index: state.params.indexOf(param),
                                  isList: isList,
                                );
                              },
                            ),
                          );
                        },
                        onDelete: (param) {
                          cubitOf(context)
                              .deleteParam(state.params.indexOf(param));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Divider(
              color: context.appColors.controlColor,
              height: 0,
              thickness: 0.2,
            ),
            blocBuilder(
              builder: (context, state) => DialogActionButtons(
                leftButtonLabel: S.of(context).ok,
                rightButtonLabel: S.of(context).cancel,
                leftButtonOnPressed: () {
                  Navigator.of(context)
                      .pop(state.params.map((param) => param as T).toList());
                },
                rightButtonOnPressed: () {
                  Navigator.of(context).pop();
                },
                isLeftButtonActive: state.params.isNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
