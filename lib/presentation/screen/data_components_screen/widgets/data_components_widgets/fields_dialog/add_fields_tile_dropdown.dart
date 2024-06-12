import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/data_component/property.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/util/type_matcher.dart';

class AddFieldsTileDropDown extends StatefulWidget {
  final Property property;
  final List<String> values;

  final ValueChanged<String> onChanged;

  const AddFieldsTileDropDown({
    required this.property,
    required this.values,
    required this.onChanged,
    super.key,
  });

  @override
  State<AddFieldsTileDropDown> createState() => _AddFieldsTileDropDownState();
}

class _AddFieldsTileDropDownState extends State<AddFieldsTileDropDown> {
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
              color: context.appColors.contrastColor,
            ),
          ),
          style: context.appTextStyles.fs18?.copyWith(
            color: context.appColors.textColor,
            fontWeight: FontWeight.w500,
          ),
          dropdownStyleData: DropdownStyleData(
            elevation: 0,
            offset: const Offset(0, -2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: context.appColors.contrastColor,
            ),
          ),
          iconStyleData:  IconStyleData(
            iconEnabledColor: context.appColors.darkColor,
            openMenuIcon: Icon(
              Icons.arrow_drop_up,
              color: context.appColors.darkColor,
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
