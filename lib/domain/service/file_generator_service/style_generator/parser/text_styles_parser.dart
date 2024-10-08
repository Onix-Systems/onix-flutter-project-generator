import 'dart:io';

import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/util/enum/project_theming.dart';

class TextStylesParser {
  List<AppTextStyle> parseFromFile({
    required File file,
    required bool projectExists,
    required ProjectTheming theming,
  }) {
    if (!projectExists) {
      return _defaultTextStyles;
    }

    final existingTextStyles = <AppTextStyle>[];

    final content = file.readAsStringSync();

    final lines = content.split('\n');

    if (theming == ProjectTheming.themeTailor) {
      _parseTailor(lines, existingTextStyles);
    } else {
      _parseManual(lines, existingTextStyles);
    }

    logger.f(existingTextStyles);

    return existingTextStyles;
  }

  static void _parseTailor(
    List<String> lines,
    List<AppTextStyle> existingTextStyles,
  ) {
    for (final line in lines) {
      if (line.contains('static List<TextStyle> ')) {
        final startLine = line
          ..replaceAll('static List<TextStyle> ', '')
          ..replaceAll(';', '');

        final name = startLine
            .split(' = ')[0]
            .trim()
            .replaceFirst('static List<TextStyle> ', '');

        if (existingTextStyles.any((element) => element.name == name)) {
          continue;
        }

        var styleContent = '';

        var lineIndex = lines.indexOf(startLine) + 1;

        while (lines[lineIndex].trim() != '];') {
          styleContent += lines[lineIndex].trim();
          lineIndex++;
        }

        final stylesLines = styleContent
            .split(',),')
            .where((element) => element != '')
            .toList();

        for (final line in stylesLines) {
          final styleLine =
              line.replaceAll('TextStyle(', '').replaceAll('//', '');

          final styleMap = <String, String>{};

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
                    (styleMap['fontSize'] ?? '').replaceAll('.sp', ''),
                  ) ??
                  18,
              fontWeight: int.tryParse(
                    (styleMap['fontWeight'] ?? '')
                        .replaceAll('FontWeight.w', ''),
                  ) ??
                  600,
              letterSpacing:
                  double.tryParse(styleMap['letterSpacing'] ?? '') ?? 0,
              color: styleMap['color'] ?? '',
            ),
          );
        }
      }
    }
  }

  static void _parseManual(
    List<String> lines,
    List<AppTextStyle> existingTextStyles,
  ) {
    for (final line in lines) {
      if (line.contains(': TextStyle(')) {
        final startLine = line;

        final name = startLine.split(': TextStyle(')[0].trim();

        if (existingTextStyles.any((element) => element.name == name)) {
          continue;
        }

        var styleContent = '';

        var lineIndex = lines.indexOf(startLine) + 1;

        while (lines[lineIndex].trim() != '),') {
          styleContent += lines[lineIndex].trim();
          lineIndex++;
        }

        final stylesLines = styleContent
            .split(',),')
            .where((element) => element != '')
            .toList();

        logger.f(stylesLines);

        for (final line in stylesLines) {
          final styleMap = <String, String>{};

          final parts = line
              .replaceAll('//', '')
              .split(',')
              .where((element) => element != '')
              .toList();

          for (final part in parts) {
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
                    (styleMap['fontSize'] ?? '').replaceAll('.sp', ''),
                  ) ??
                  18,
              fontWeight: int.tryParse(
                    (styleMap['fontWeight'] ?? '')
                        .replaceAll('FontWeight.w', ''),
                  ) ??
                  600,
              letterSpacing:
                  double.tryParse(styleMap['letterSpacing'] ?? '') ?? 0,
              color: styleMap['color'] ?? '',
            ),
          );
        }
      }
    }
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
