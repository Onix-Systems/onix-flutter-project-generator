import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';

class DefaultColors {
  static List<AppColorStyle> call({
    required File file,
    required bool projectExists,
  }) {
    if (!projectExists) {
      return DefaultColors()._defaultColors;
    }

    final existingColors = <AppColorStyle>[];

    final content = file.readAsStringSync();

    final lines = content.split('\n');

    for (var line in lines) {
      if (line.contains('static const Color ')) {
        line = line.replaceAll('static const Color ', '').replaceAll(';', '');

        final name = line.split('=')[0].trim();
        final color = line
            .split('=')[1]
            .trim()
            .replaceFirst('Color(', '')
            .replaceFirst(')', '');

        existingColors.add(
          AppColorStyle(
            id: '',
            name: name,
            color: Color(int.parse(color.replaceAll('0x', ''), radix: 16)),
          ),
        );
      }
    }

    return existingColors;
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
