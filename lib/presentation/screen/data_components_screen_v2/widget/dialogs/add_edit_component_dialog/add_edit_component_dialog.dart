import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_cubit.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/bloc/component_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/widgets/add_edit_variable_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/widgets/class_preview.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/switch_with_label.dart';

class AddEditComponentDialog extends StatefulWidget {
  final String? componentName;
  final Components components;

  const AddEditComponentDialog({
    required this.components,
    this.componentName,
    super.key,
  });

  @override
  State<AddEditComponentDialog> createState() => _AddEditComponentDialogState();
}

class _AddEditComponentDialogState extends BaseCubitState<ComponentDialogState,
    ComponentDialogCubit, ComponentDialogSR, AddEditComponentDialog> {
  final TextEditingController _controller = TextEditingController();
  bool isEnum = false;

  @override
  ComponentDialogCubit createCubit() => GetIt.I.get<ComponentDialogCubit>();

  @override
  void onCubitCreated(BuildContext context, ComponentDialogCubit cubit) {
    cubit.init(widget.components);
    super.onCubitCreated(context, cubit);
  }

  @override
  void initState() {
    super.initState();
    if (widget.componentName != null) {
      _controller.text = widget.componentName!;
    }
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
              S.of(context).addComponent,
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
                        CupertinoTextField(
                          controller: _controller,
                          placeholder: S.of(context).componentName,
                          style: context.appTextStyles.fs18,
                          onChanged: (_) {
                            setState(() {});
                          },
                          inputFormatters: [
                            const FirstCharacterNotDigitFormatter(),
                            FilteringTextInputFormatter.allow(
                              AppConsts.digitsAndLatinLetters,
                            ),
                          ],
                        ),
                        SwitchWithLabel(
                          label: 'Enum',
                          initialValue: isEnum,
                          valueSetter: (value) {
                            setState(() {
                              isEnum = value;
                            });
                          },
                        ),
                        AppFilledButton(
                          label: S.of(context).addVariable,
                          icon: Icons.add,
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (ctx) => AddEditVariableDialog(
                                types: cubitOf(context).state.components,
                                process: (type, name) {
                                  cubitOf(context).addVariable(
                                    name: name,
                                    type: type,
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
                        return ClassPreview(
                          className: _controller.text,
                          isEnum: isEnum,
                          variables: state.variables,
                          onEdit: (variable) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (ctx) => AddEditVariableDialog(
                                variable: variable,
                                types: cubitOf(context).state.components,
                                process: (type, name) {
                                  cubitOf(context).editVariable(
                                    name: name,
                                    type: type,
                                    index: state.variables.indexOf(variable),
                                  );
                                },
                              ),
                            );
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
            Row(
              children: [
                Expanded(
                  child: AppActionButton(
                    label: S.of(context).ok,
                    onPressed: () {
                      onOk();
                      Navigator.of(context).pop();
                    },
                    active: _controller.text.isNotEmpty,
                  ),
                ),
                Container(
                  color: context.appColors.controlColor,
                  height: 50,
                  width: 0.2,
                ),
                Expanded(
                  child: AppActionButton(
                    label: S.of(context).cancel,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onOk() {
    // if (_controller.text.isEmpty) {
    //   return;
    // }
    // if (widget.componentName != null) {
    //   widget.bloc.add(
    //     DataComponentsScreenV2Event.editSourceName(
    //       sourceName: widget.componentName!,
    //       newName: _controller.text,
    //     ),
    //   );
    // } else {
    //   widget.bloc.add(
    //     DataComponentsScreenV2Event.addSource(
    //       sourceName: _controller.text,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
