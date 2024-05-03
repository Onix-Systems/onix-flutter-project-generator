import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/service/file_generator_service/style_generator/style_generator_const.dart';

class ColorsParser {
  List<AppColorStyle> parseFromFile({
    required File file,
    required bool projectExists,
  }) {
    if (!projectExists) {
      return ColorsParser()._defaultColors;
    }

    final existingColors = <AppColorStyle>[];

    final content = file.readAsStringSync();

    final lines = content.split('\n');

    for (var line in lines) {
      if (line.contains('static const Color ')) {
        line = line.replaceAll('static const Color ', '').replaceAll(';', '');

        final name = line.split('=')[0].trim();

        final colorParams = line.split('=')[1].trim();

        Color parsedColor;

        if (colorParams.contains('.fromRGBO')) {
          parsedColor = _parseRGBO(colorParams);
        } else if (colorParams.contains('.fromARGB')) {
          parsedColor = _parseARGB(colorParams);
        } else {
          parsedColor = _parseHex(colorParams);
        }

        if (!name.endsWith(StyleGeneratorConst.darkColorSuffix) &&
            !name.endsWith(StyleGeneratorConst.lightColorSuffix)) {
          existingColors.addAll([
            AppColorStyle(
              id: '',
              name: '${name}Dark',
              color: parsedColor,
            ),
            AppColorStyle(
              id: '',
              name: '${name}Light',
              color: parsedColor,
            ),
          ]);
        } else {
          existingColors.add(AppColorStyle(
            id: '',
            name: name,
            color: parsedColor,
          ));
        }
      }
    }

    return existingColors;
  }

  static Color _parseRGBO(String color) {
    final parts = color
        .replaceFirst('Color.fromRGBO(', '')
        .replaceFirst(')', '')
        .split(',')
        .map((e) => double.parse(e.trim()))
        .toList();

    logger.f('parts: $parts');

    return Color.fromRGBO(
        parts[0].toInt(), parts[1].toInt(), parts[2].toInt(), parts[3]);
  }

  static Color _parseARGB(String color) {
    final parts = color
        .replaceFirst('Color.fromARGB(', '')
        .replaceFirst(')', '')
        .split(',')
        .map((e) => int.parse(e.trim()))
        .toList();

    logger.f('parts: $parts');

    return Color.fromARGB(parts[0], parts[1], parts[2], parts[3]);
  }

  static Color _parseHex(String color) {
    final value = color
        .replaceFirst('Color(', '')
        .replaceFirst(')', '')
        .replaceFirst('0x', '');

    return Color(int.parse(value, radix: 16));
  }

  final _defaultColors = <AppColorStyle>[
    AppColorStyle(
      id: '',
      name: 'scaffoldBackgroundLight',
      color: const Color(0xFFF5F5F5),
    ),
    AppColorStyle(
      id: '',
      name: 'buttonLight',
      color: const Color(0xFF5DFF00),
    ),
    AppColorStyle(
      id: '',
      name: 'textLight',
      color: const Color(0xFF3D3D3D),
    ),
    AppColorStyle(
      id: '',
      name: 'buttonDisabledLight',
      color: const Color(0xFFA3A3A3),
    ),
    AppColorStyle(
      id: '',
      name: 'scaffoldBackgroundDark',
      color: const Color(0xFF434E65),
    ),
    AppColorStyle(
      id: '',
      name: 'buttonDark',
      color: const Color(0xFF669900),
    ),
    AppColorStyle(
      id: '',
      name: 'textDark',
      color: const Color(0xFFE8E8E8),
    ),
    AppColorStyle(
      id: '',
      name: 'buttonDisabledDark',
      color: const Color(0xFF363D52),
    ),
  ];
}
