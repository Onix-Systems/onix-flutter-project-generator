import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/util/formatters/first_character_is_not_digit_formatter.dart';
import 'package:onix_flutter_bricks/app/util/formatters/path_formatter.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class PathField extends StatelessWidget {
  final TextEditingController pathController;
  final List<String> pathParams;
  final VoidCallback onChanged;
  final VoidCallback onSubmitted;

  const PathField({
    required this.pathController,
    required this.pathParams,
    required this.onChanged,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final unusedParams = _unusedParams();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: pathController,
          onChanged: (_) => onChanged(),
          onSubmitted: (_) => onSubmitted(),
          inputFormatters: const [
            FirstCharacterNotDigitFormatter(),
            PathFormatter(),
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
        ),
        const Gap(3),
        Text(
          unusedParams.isNotEmpty
              ? '${S.of(context).unUsed}: $unusedParams'
              : '',
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 11,
            color: context.appColors.alarmColor,
          ),
        ),
      ],
    );
  }

  List<String> _unusedParams() {
    return pathParams
        .where((element) => !pathController.text.contains('{$element}'))
        .toList();
  }
}
