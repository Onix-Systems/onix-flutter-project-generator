import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class LabeledSegmentedControl extends StatelessWidget {
  final String label;
  final List<String> values;
  final ValueSetter<String> onChange;
  final String selectedValue;

  const LabeledSegmentedControl({
    required this.label,
    required this.values,
    required this.onChange,
    required this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.appTextStyles.fs18?.copyWith(color: AppColors.white),
          ),
          SizedBox(
            width: 280,
            child: CupertinoSegmentedControl<String>(
              padding: EdgeInsets.zero,
              groupValue: selectedValue,
              selectedColor: AppColors.green,
              unselectedColor: AppColors.bgDark,
              borderColor: AppColors.white,
              children: _mapValues(context),
              onValueChanged: (value) {
                onChange.call(selectedValue);
              },
            ),
          ),
        ],
      ),
    );
  }

  Map<String, Widget> _mapValues(BuildContext context) {
    Map<String, Widget> result = {};
    for (String value in values) {
      result.addAll({
        value: Text(
          value,
          style: context.appTextStyles.fs18?.copyWith(
            color: selectedValue == value
                ? CupertinoColors.black
                : AppColors.inactiveText,
          ),
        )
      });
    }
    return result;
  }
}
