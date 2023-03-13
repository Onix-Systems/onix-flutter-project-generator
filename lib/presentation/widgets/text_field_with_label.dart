import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.value,
    required this.textController,
    required this.inputFormatters,
    this.error = false,
    this.centered = false,
    this.subLabel,
    this.expanded = false,
  }) : super(key: key);

  final String label;
  final String? subLabel;
  final String value;
  final List<TextInputFormatter> inputFormatters;
  final bool centered;

  final bool error;

  final bool expanded;

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (expanded)
          Column(
            crossAxisAlignment:
                centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: AppColors.white),
              ),
              if (subLabel != null)
                Text(
                  subLabel ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: AppColors.white, fontSize: 13),
                ),
            ],
          )
        else
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: centered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: AppColors.white),
                ),
                if (subLabel != null)
                  Text(
                    subLabel ?? '',
                    textAlign: TextAlign.left,
                    style:
                        const TextStyle(color: AppColors.white, fontSize: 13),
                  ),
              ],
            ),
          ),
        const SizedBox(width: 10),
        if (expanded)
          Expanded(
            child: CupertinoTextField(
              style: TextStyle(
                  color:
                      error ? CupertinoColors.destructiveRed : AppColors.white),
              controller: textController,
              keyboardType: TextInputType.text,
              inputFormatters: inputFormatters,
            ),
          )
        else
          SizedBox(
            width: 300,
            child: CupertinoTextField(
              style: TextStyle(
                  color:
                      error ? CupertinoColors.destructiveRed : AppColors.white),
              controller: textController,
              keyboardType: TextInputType.text,
              inputFormatters: inputFormatters,
            ),
          ),
      ],
    );
  }
}
