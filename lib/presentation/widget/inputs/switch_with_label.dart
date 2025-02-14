import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class SwitchWithLabel extends StatelessWidget {
  final String label;
  final String? subLabel;
  final bool initialValue;
  final ValueSetter<bool> valueSetter;
  final bool expanded;

  const SwitchWithLabel({
    required this.label,
    required this.valueSetter,
    required this.initialValue,
    this.expanded = true,
    this.subLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: expanded ? 0 : 8),
      child: SizedBox(
        width: expanded ? double.maxFinite : 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            CupertinoSwitch(
              value: initialValue,
              activeTrackColor: context.appColors.contrastColor,
              onChanged: valueSetter.call,
            ),
          ],
        ),
      ),
    );
  }
}
