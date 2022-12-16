import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:onix_flutter_bricks/presentation/themes/app_colors.dart';
import 'package:recase/recase.dart';

import '../../core/di/di.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    Key? key,
    required this.label,
    required this.value,
    required this.focusNode,
    required this.textController,
    required this.inputFormatters,
    this.error = false,
    this.subLabel,
  }) : super(key: key);

  final String label;
  final String? subLabel;
  final String value;
  final List<TextInputFormatter> inputFormatters;

  final FocusNode focusNode;

  final bool error;

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 300,
          child: CupertinoTextField(
            style: TextStyle(
                color:
                    error ? CupertinoColors.destructiveRed : AppColors.white),
            controller: textController,
            focusNode: focusNode,
            keyboardType: TextInputType.text,
            inputFormatters: inputFormatters,
          ),
        ),
      ],
    );
  }
}
