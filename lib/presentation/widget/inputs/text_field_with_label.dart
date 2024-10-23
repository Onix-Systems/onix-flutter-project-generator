import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final String? subLabel;
  final List<TextInputFormatter>? inputFormatters;
  final bool centered;
  final VoidCallback onChanged;
  final VoidCallback? onEditingComplete;
  final bool error;
  final bool expanded;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final bool? autofocus;
  final MainAxisSize? mainAxisSize;

  const TextFieldWithLabel({
    required this.label,
    required this.textController,
    required this.onChanged,
    this.inputFormatters,
    this.error = false,
    this.centered = false,
    this.subLabel,
    this.expanded = false,
    this.focusNode,
    this.autofocus,
    this.onEditingComplete,
    this.mainAxisSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
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
                  style: context.appTextStyles.fs18?.copyWith(
                    color: context.appColors.textColor,
                    fontSize: 13,
                  ),
                ),
            ],
          )
        else
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$label: ',
                  maxLines: 1,
                  style: context.appTextStyles.fs18,
                ),
                if (subLabel != null)
                  Text(
                    subLabel ?? '',
                    style: context.appTextStyles.fs18?.copyWith(
                      color: context.appColors.textColor,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(width: 10),
        if (expanded)
          Expanded(
            child: CupertinoTextField(
              focusNode: focusNode,
              autofocus: autofocus ?? false,
              style: TextStyle(
                color: error
                    ? context.appColors.alarmColor
                    : context.appColors.textColor,
              ),
              controller: textController,
              keyboardType: TextInputType.text,
              inputFormatters: inputFormatters,
              onChanged: (_) => onChanged(),
              onEditingComplete: () => onEditingComplete?.call(),
            ),
          )
        else
          SizedBox(
            width: 300,
            child: CupertinoTextField(
              focusNode: focusNode,
              autofocus: autofocus ?? false,
              style: context.appTextStyles.fs18?.copyWith(
                color: error
                    ? context.appColors.alarmColor
                    : context.appColors.textColor,
              ),
              controller: textController,
              keyboardType: TextInputType.text,
              inputFormatters: inputFormatters,
              onChanged: (_) => onChanged(),
              onEditingComplete: () => onEditingComplete?.call(),
            ),
          ),
      ],
    );
  }
}
