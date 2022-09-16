import 'package:flutter/cupertino.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class SwitchWithLabel extends StatefulWidget {
  const SwitchWithLabel({Key? key, required this.label, this.subLabel})
      : super(key: key);

  final String label;
  final String? subLabel;

  @override
  State<SwitchWithLabel> createState() => _SwitchWithLabelState();
}

class _SwitchWithLabelState extends State<SwitchWithLabel> {
  bool switchValue = false;

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
                  widget.label,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: AppColors.white),
                ),
                if (widget.subLabel != null)
                  Text(
                    widget.subLabel ?? '',
                    textAlign: TextAlign.left,
                    style:
                        const TextStyle(color: AppColors.white, fontSize: 13),
                  ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
