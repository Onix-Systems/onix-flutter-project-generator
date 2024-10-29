import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:recase/recase.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.appTextStyles.fs18?.copyWith(
              color: context.appColors.textColor,
            ),
          ),
          SizedBox(
            width: 280,
            child: CupertinoSegmentedControl<String>(
              padding: EdgeInsets.zero,
              groupValue: selectedValue,
              selectedColor: context.appColors.contrastColor,
              unselectedColor: context.appColors.darkContrastColor,
              borderColor: context.appColors.contrastColor,
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
    final result = <String, Widget>{};
    for (final value in values) {
      result.addAll(
        {
          value: Text(
            value.titleCase,
            style: context.appTextStyles.fs18?.copyWith(
              color: selectedValue == value
                  ? context.appColors.textColor
                  : context.appColors.fadedColor,
            ),
          ),
        },
      );
    }
    return result;
  }
}
