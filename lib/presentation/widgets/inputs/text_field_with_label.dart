import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final String? subLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool centered;
  final VoidCallback onChanged;
  final bool error;
  final bool expanded;
  final TextEditingController textController;

  const TextFieldWithLabel({
    required this.label,
    required this.textController,
    this.inputFormatters,
    this.error = false,
    this.centered = false,
    this.subLabel,
    this.expanded = false,
    required this.onChanged,
    super.key,
  });



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
                style: context.appTextStyles.fs18,
              ),
              if (subLabel != null)
                Text(
                  subLabel ?? '',
                  textAlign: TextAlign.left,
                  style: context.appTextStyles.fs18
                      ?.copyWith(color: AppColors.white, fontSize: 13),
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
                  style: context.appTextStyles.fs18,
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
              onChanged: (_) => onChanged(),
            ),
          )
        else
          SizedBox(
            width: 300,
            child: CupertinoTextField(
              style: context.appTextStyles.fs18?.copyWith(
                  color:
                      error ? CupertinoColors.destructiveRed : AppColors.white),
              controller: textController,
              keyboardType: TextInputType.text,
              inputFormatters: inputFormatters,
              onChanged: (_) => onChanged(),
            ),
          ),
      ],
    );
  }
}
