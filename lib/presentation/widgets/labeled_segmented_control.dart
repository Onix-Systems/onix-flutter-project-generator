import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

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

  Map<String, Widget> mapValues() {
    Map<String, Widget> result = {};
    for (String value in values) {
      result.addAll({
        value: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            value,
            style: TextStyle(
              color: selectedValue == value
                  ? CupertinoColors.black
                  : AppColors.inactiveText,
            ),
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
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          CupertinoSegmentedControl<String>(
            padding: EdgeInsets.zero,
            groupValue: selectedValue,
            selectedColor: AppColors.green,
            borderColor: AppColors.white,
            children: mapValues(),
            onValueChanged: (value) {
              onChange.call(selectedValue);
            },
          ),
        ],
      ),
    );
  }
}
