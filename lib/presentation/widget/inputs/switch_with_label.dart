import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SwitchWithLabel extends StatelessWidget {
  final String label;
  final String? subLabel;
  final bool initialValue;
  final ValueSetter<bool> valueSetter;

  const SwitchWithLabel({
    required this.label,
    required this.valueSetter,
    required this.initialValue,
    this.subLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.left,
                  style: context.appTextStyles.fs18
                      ?.copyWith(color: context.appColors.textColor),
                ),
                if (subLabel != null)
                  Text(
                    subLabel ?? '',
                    textAlign: TextAlign.left,
                    style: context.appTextStyles.fs18?.copyWith(
                      color: context.appColors.textColor,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: initialValue,
            activeColor: context.appColors.contrastColor,
            onChanged: valueSetter.call,
          ),
        ],
      ),
    );
  }
}
