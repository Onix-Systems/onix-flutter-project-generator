import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/enum/dart_types.dart';
import 'package:onix_flutter_bricks/domain/entity/component/request_param_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_path_query_dialog/bloc/add_path_query_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_path_query_dialog/bloc/add_path_query_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_path_query_dialog/widgets/add_param_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_path_query_dialog/widgets/params_preview.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';

class AddPathQueryDialog<T extends RequestParamComponent>
    extends StatefulWidget {
  final List<T> params;

  const AddPathQueryDialog({
    required this.params,
    super.key,
  });

  @override
  State<AddPathQueryDialog> createState() => _AddPathQueryDialogState<T>();
}

class _AddPathQueryDialogState<T extends RequestParamComponent>
    extends BaseCubitState<AddPathQueryDialogState, AddPathQueryDialogCubit,
        AddPathQueryDialogSR, AddPathQueryDialog> {
  @override
  AddPathQueryDialogCubit createCubit() =>
      GetIt.I.get<AddPathQueryDialogCubit>();

  @override
  void onCubitCreated(BuildContext context, AddPathQueryDialogCubit cubit) {
    super.onCubitCreated(context, cubit);
    cubit.init(widget.params);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: context.appColors.darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            Text(
              S.of(context).addParams('Path'),
              style: context.appTextStyles.fs18,
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 20,
                      children: [
                        AppFilledButton(
                          label: S.of(context).addParam,
                          icon: Icons.add,
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (ctx) => AddParamDialog(
                                types: DartTypes.types,
                                process: (type, name, isList) {
                                  cubitOf(context).addParam(
                                    requestParamComponentType: T,
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
                  ),
                  Expanded(
                    child: blocBuilder(
                      builder: (context, state) {
                        return ParamsPreview(
                          params: state.params,
                          onEdit: (param) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (ctx) => AddParamDialog(
                                param: param,
                                types: DartTypes.types,
                                process: (type, name, isList) {
                                  cubitOf(context).editParam(
                                    name: name,
                                    type: type,
                                    index: state.params.indexOf(param),
                                    isList: isList,
                                  );
                                },
                              ),
                            );
                          },
                          onDelete: (variable) {
                            // cubitOf(context).deleteVariable(variable);
                          },
                        );
                      },
                    ),
                  ),
                ],
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
                leftButtonOnPressed: () async {
                  ///TODO: implement

                  // if (widget.component != null) {
                  //   component = await cubitOf(context)
                  //       .editDataObject(name: _controller.text);
                  // } else {
                  //   component = await cubitOf(context).addDataObject(
                  //     name: _controller.text,
                  //     isEnum: isEnum,
                  //     addToRepository: !widget.requestComponent,
                  //   );
                  // }
                  // if (context.mounted) {
                  //   Navigator.of(context).pop(component);
                  // }
                  Navigator.of(context).pop();
                },
                rightButtonOnPressed: () {
                  Navigator.of(context).pop();
                },
                isLeftButtonActive: false,
                // _controller.text.isNotEmpty && state.variables.isNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
