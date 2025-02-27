import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/add_edit_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:recase/recase.dart';

class AddComponentRow extends StatelessWidget {
  final AddRequestDialogState state;
  final String? selectedComponentName;
  final String componentName;
  final Component? editComponent;
  final ValueChanged<String> onComponentSelected;
  final ValueChanged<Component> onComponentCreated;
  final bool body;

  const AddComponentRow({
    required this.state,
    required this.componentName,
    required this.onComponentSelected,
    required this.onComponentCreated,
    required this.body,
    this.selectedComponentName,
    this.editComponent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final components = state.components.toSet().toList()..insert(0, 'Empty');

    if (selectedComponentName != null) {
      components
        ..remove(selectedComponentName)
        ..insert(0, selectedComponentName!);
    }

    final componentRef = components.first;

    final buttonPrefix = editComponent != null ? 'Edit' : 'Add';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Expanded(
          child: DropdownButton2<String>(
            items: components.map(
              (e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e.pascalCase,
                    style: context.appTextStyles.fs18,
                  ),
                );
              },
            ).toList(),
            value: componentRef,
            onChanged: (value) {
              if (value != null && value != componentRef) {
                onComponentSelected(value);
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
        Text(
          'or',
          style: context.appTextStyles.fs18,
        ),
        SizedBox(
          width: 200,
          child: AppFilledButton(
            label: body ? '$buttonPrefix body' : '$buttonPrefix response',
            onPressed: () => showCupertinoModalPopup<Component>(
              context: context,
              builder: (ctx) {
                return AddEditComponentDialog(
                  name: componentName,
                  requestComponent: true,
                  component: editComponent,
                );
              },
            ).then((value) {
              if (value != null) {
                if (context.mounted) {
                  onComponentCreated(value);
                }
              }
            }),
          ),
        ),
      ],
    );
  }
}
