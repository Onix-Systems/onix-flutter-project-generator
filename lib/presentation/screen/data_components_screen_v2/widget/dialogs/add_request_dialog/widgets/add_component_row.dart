import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/component/component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_edit_component_dialog/add_edit_component_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/dialogs/add_request_dialog/bloc/add_request_dialog_models.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:recase/recase.dart';

class AddComponentRow extends StatefulWidget {
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
  State<AddComponentRow> createState() => _AddComponentRowState();
}

class _AddComponentRowState extends State<AddComponentRow> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final components = widget.state.components.toSet().toList()
      ..insert(0, 'Empty');

    if (widget.selectedComponentName != null) {
      components
        ..remove(widget.selectedComponentName)
        ..insert(0, widget.selectedComponentName!);
    }

    final componentRef = components.first;

    final buttonPrefix = widget.editComponent != null ? 'Edit' : 'Add';

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
                widget.onComponentSelected(value);
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
            dropdownSearchData: DropdownSearchData(
              searchController: _searchController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: _searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an item...',
                    hintStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toUpperCase()
                    .contains(searchValue.toUpperCase());
              },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                _searchController.clear();
              }
            },
          ),
        ),
        Text(
          'or',
          style: context.appTextStyles.fs18,
        ),
        SizedBox(
          width: 200,
          child: AppFilledButton(
            label:
                widget.body ? '$buttonPrefix body' : '$buttonPrefix response',
            onPressed: () => showCupertinoModalPopup<Component>(
              context: context,
              builder: (ctx) {
                return AddEditComponentDialog(
                  name: widget.componentName,
                  requestComponent: true,
                  component: widget.editComponent,
                );
              },
            ).then((value) {
              if (value != null) {
                if (context.mounted) {
                  widget.onComponentCreated(value);
                }
              }
            }),
          ),
        ),
      ],
    );
  }
}
