import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';

class AddVariableDialog extends StatefulWidget {
  final List<String> types;
  final Function(String, String) onAdd;

  const AddVariableDialog({
    required this.types,
    required this.onAdd,
    super.key,
  });

  @override
  State<AddVariableDialog> createState() => _AddVariableDialogState();
}

class _AddVariableDialogState extends State<AddVariableDialog> {
  final TextEditingController _controller = TextEditingController();
  var _selectedType = '';

  @override
  void initState() {
    super.initState();
    _selectedType = widget.types.first;
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
                        onChanged: (type) {
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
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (_) {
                          setState(() {});
                        },
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
              Row(
                children: [
                  Expanded(
                    child: AppActionButton(
                      label: S.of(context).ok,
                      onPressed: () {
                        widget.onAdd(_selectedType, _controller.text);
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
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
