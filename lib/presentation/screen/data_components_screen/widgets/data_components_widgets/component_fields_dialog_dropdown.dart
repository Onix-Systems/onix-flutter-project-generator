import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

class ComponentFieldsDialogDropDown extends StatefulWidget {
  final Property property;
  final List<String> values;

  final ValueChanged<String> onChanged;

  const ComponentFieldsDialogDropDown({
    required this.property,
    required this.values,
    required this.onChanged,
    super.key,
  });

  @override
  State<ComponentFieldsDialogDropDown> createState() =>
      _ComponentFieldsDialogDropDownState();
}

class _ComponentFieldsDialogDropDownState
    extends State<ComponentFieldsDialogDropDown> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DropdownButton2<String>(
          underline: const SizedBox(),
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.orange,
            ),
          ),
          style: context.appTextStyles.fs18?.copyWith(
            color: AppColors.bgDark,
            fontWeight: FontWeight.w500,
          ),
          dropdownStyleData: const DropdownStyleData(
            elevation: 0,
            offset: Offset(0, -2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: AppColors.orange,
            ),
          ),
          iconStyleData: const IconStyleData(
            iconEnabledColor: AppColors.bgDark,
            openMenuIcon: Icon(
              Icons.arrow_drop_up,
              color: AppColors.bgDark,
            ),
          ),
          items: widget.values.map((e) {
            return DropdownMenuItem<String>(
              value: TypeMatcher.getDartType(e),
              child: Text(e),
            );
          }).toList(),
          value: TypeMatcher.getDartType(widget.property.type),
          onChanged: (value) => widget.onChanged(
                widget.property.type = value!,
              )),
    );
  }
}
