import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class PathField extends StatelessWidget {
  final TextEditingController pathController;
  final VoidCallback onChanged;

  const PathField({
    required this.pathController,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pathController,
      onChanged: (_) => onChanged(),
      inputFormatters: const [
        FirstCharacterNotDigitFormatter(),
      ],
      decoration: InputDecoration(
        hintText: S.of(context).path,
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
