import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class LabeledSegmentedControl extends StatelessWidget {
  const LabeledSegmentedControl(
      {Key? key,
      required this.label,
      required this.values,
      required this.onChange,
      required this.selectedValue})
      : super(key: key);

  final String label;
  final List<String> values;
  final ValueSetter<String> onChange;

  final String selectedValue;

  Map<String, Widget> mapValues(BuildContext context) {
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
              children: mapValues(context),
              onValueChanged: (value) {
                onChange.call(selectedValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
