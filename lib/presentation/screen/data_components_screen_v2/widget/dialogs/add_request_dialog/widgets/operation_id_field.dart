import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/app/util/formatters/method_name_formatter.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class OperationIdField extends StatelessWidget {
  final VoidCallback onChanged;
  final VoidCallback onSubmitted;
  final TextEditingController idController;

  const OperationIdField({
    required this.onChanged,
    required this.idController,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: idController,
      onChanged: (_) => onChanged(),
      onSubmitted: (_) => onSubmitted(),
      inputFormatters: const [
        FirstCharacterNotDigitFormatter(),
        MethodNameFormatter(),
      ],
      decoration: InputDecoration(
        hintText: 'OperationId',
        hintStyle: context.appTextStyles.fs18?.copyWith(
          color: context.appColors.controlColor.withAlpha(100),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        fillColor: context.appColors.darkContrastColor,
        hoverColor: context.appColors.darkContrastColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
      style: context.appTextStyles.fs18,
    );
  }
}
