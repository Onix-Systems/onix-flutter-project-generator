import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';

class DefaultTextStyles {
  static List<AppTextStyle> call({
    required File file,
    required bool projectExists,
  }) {
    if (!projectExists) {
      return _defaultTextStyles;
    }

    final existingTextStyles = <AppTextStyle>[];

    final content = file.readAsStringSync();

    final lines = content.split('\n');

    for (var line in lines) {
      if (line.contains('static List<TextStyle> ')) {
        final startLine = line
          ..replaceAll('static List<TextStyle> ', '')
          ..replaceAll(';', '');

        final name = startLine
            .split(' = ')[0]
            .trim()
            .replaceFirst('static List<TextStyle> ', '');

        String styleContent = '';

        var lineIndex = lines.indexOf(startLine) + 1;

        while (lines[lineIndex].trim() != '];') {
          styleContent += lines[lineIndex].trim();
          lineIndex++;
        }

        final stylesLines = styleContent
            .split(',),')
            .where((element) => element != '')
            .toList();

        for (var line in stylesLines) {
          final styleLine = line.replaceAll('TextStyle(', '');

          Map<String, String> styleMap = {};

          for (final part in styleLine.split(',')) {
            final key = part.split(':')[0].trim();
            final value = part.split(':')[1].trim();
            styleMap[key] = value;
          }

          existingTextStyles.add(
            AppTextStyle(
              id: '',
              name: name,
              fontFamily: '',
              fontSize: double.tryParse(
                      (styleMap['fontSize'] ?? '').replaceAll('.sp', '')) ??
                  18,
              fontWeight: int.tryParse((styleMap['fontWeight'] ?? '')
                      .replaceAll('FontWeight.w', '')) ??
                  600,
              letterSpacing:
                  double.tryParse(styleMap['letterSpacing'] ?? '') ?? 0,
              color: styleMap['color'] ?? '',
            ),
          );
        }
      }
    }

    logger.f(existingTextStyles);

    return existingTextStyles;
  }

  static final _defaultTextStyles = <AppTextStyle>[
    AppTextStyle(
      id: '',
      name: 'text',
      fontFamily: '',
      fontSize: 18,
      fontWeight: 600,
      letterSpacing: 0,
      color: 'AppColors.textColor',
    ),
    AppTextStyle(
      id: '',
      name: 'button',
      fontFamily: '',
      fontSize: 18,
      fontWeight: 600,
      letterSpacing: 0,
      color: 'AppColors.buttonColor',
    ),
  ];
}
