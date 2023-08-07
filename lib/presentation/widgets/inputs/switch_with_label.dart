import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class SwitchWithLabel extends StatelessWidget {
  const SwitchWithLabel(
      {Key? key,
      required this.label,
      this.subLabel,
      required this.valueSetter,
      required this.initialValue})
      : super(key: key);

  final String label;
  final String? subLabel;
  final bool initialValue;

  final ValueSetter<bool> valueSetter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
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
                      ?.copyWith(color: AppColors.white),
                ),
                if (subLabel != null)
                  Text(
                    subLabel ?? '',
                    textAlign: TextAlign.left,
                    style: context.appTextStyles.fs18
                        ?.copyWith(color: AppColors.white, fontSize: 13),
                  ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: initialValue,
            onChanged: (value) {
              valueSetter.call(value);
            },
          ),
        ],
      ),
    );
  }
}
