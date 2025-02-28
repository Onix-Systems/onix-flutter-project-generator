import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/app_consts.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/enum/data_file_type.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/data/model/swagger/types/swagger_type.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_variable_component.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog_action_buttons.dart';
import 'package:onix_flutter_bricks/presentation/widget/inputs/labeled_checkbox.dart';

class AddEditVariableDialog extends StatefulWidget {
  final DataVariableComponent? variable;
  final bool parentIsEnum;
  final List<String> types;
  final Function(
    String type,
    String name,
    bool isList,
  ) process;

  const AddEditVariableDialog({
    required this.types,
    required this.process,
    required this.parentIsEnum,
    this.variable,
    super.key,
  });

  @override
  State<AddEditVariableDialog> createState() => _AddEditVariableDialogState();
}

class _AddEditVariableDialogState extends State<AddEditVariableDialog> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  var _selectedType = '';
  bool isList = false;
  bool nullable = false;

  @override
  void initState() {
    super.initState();
    if (widget.variable != null) {
      _controller.text = widget.variable!.name;
      if (widget.variable!.type is SwaggerArray) {
        isList = true;
        _selectedType = (widget.variable!.type as SwaggerArray)
            .itemType
            .type
            .getTypeDeclaration(DataFileType.entity);
      } else {
        _selectedType =
            widget.variable!.type.getTypeDeclaration(DataFileType.entity);
      }
    } else {
      _selectedType = widget.types.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        decoration: BoxDecoration(
          color: context.appColors.darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(20),
              Text(
                S.of(context).addVariable,
                style: context.appTextStyles.fs18,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  spacing: 10,
                  children: [
                    if (!widget.parentIsEnum)
                      LabeledCheckbox(
                        label: 'List',
                        initialValue: isList,
                        onAction: () {
                          setState(() {
                            isList = !isList;
                          });
                        },
                      ),
                    Expanded(
                      child: DropdownButton2<String>(
                        value: _selectedType,
                        items: widget.types
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: widget.parentIsEnum
                            ? null
                            : (type) {
                                setState(() {
                                  _selectedType = type!;
                                });
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
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (_) {
                          setState(() {});
                        },
                        inputFormatters: [
                          const FirstCharacterNotDigitFormatter(),
                          FilteringTextInputFormatter.allow(
                            AppConsts.digitsAndLatinLetters,
                          ),
                        ],
                        decoration: InputDecoration(
                          hintText: S.of(context).variableName,
                          hintStyle: context.appTextStyles.fs18?.copyWith(
                            color:
                                context.appColors.controlColor.withAlpha(100),
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
              ),
              const Gap(20),
              Divider(
                color: context.appColors.controlColor,
                height: 0,
                thickness: 0.2,
              ),
              DialogActionButtons(
                leftButtonLabel: S.of(context).ok,
                rightButtonLabel: S.of(context).cancel,
                leftButtonOnPressed: () {
                  widget.process(
                    _selectedType,
                    _controller.text,
                    isList,
                  );
                  Navigator.of(context).pop();
                },
                isLeftButtonActive: _controller.text.isNotEmpty,
                rightButtonOnPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
