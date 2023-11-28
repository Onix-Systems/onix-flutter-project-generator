import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class FigmaService {
  Future<List<AppStyle>> getStyles(String figmaId, String token) async {
    final Set<AppStyle> figmaStyles = {};
    final Set<AppTextStyle> figmaTextStyles = {};
    final Set<AppColorStyle> figmaColorStyles = {};

    try {
      final fileResponse = await http.get(
          Uri.parse('${AppConsts.figmaBaseUrl}/files/$figmaId/'),
          headers: {
            'X-Figma-Token': token,
          });
      if (fileResponse.statusCode != 200) {
        throw Exception('Error getting styles');
      }
      final styles = (jsonDecode(fileResponse.body)
          as Map<String, dynamic>)['styles'] as Map<String, dynamic>;
      if (styles.isNotEmpty) {
        final keys = styles.keys
            .toList()
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll(' ', '');
        final styleResponse = await http.get(
            Uri.parse(
                '${AppConsts.figmaBaseUrl}/files/$figmaId/nodes?ids=$keys'),
            headers: {
              'X-Figma-Token': token,
            });

        final nodes =
            (jsonDecode(styleResponse.body) as Map<String, dynamic>)['nodes'];

        for (final key in nodes.keys) {
          final node = nodes[key];

          if (styles[key]['styleType'] == 'TEXT') {
            final textStyle = node['document']['style'];
            figmaTextStyles.add(
              AppTextStyle(
                fontFamily: textStyle['fontFamily'],
                fontSize: textStyle['fontSize'],
                fontWeight: textStyle['fontWeight'],
                letterSpacing: textStyle['letterSpacing'],
                id: key.toString(),
                name: styles[key]['name'].toString().camelCase,
                color: '',
              ),
            );
          } else {
            final fill = node['document']['fills'][0];
            if (fill['type'] != 'SOLID') {
              continue;
            }
            final color = AppColorStyle(
                id: key.toString(),
                name: styles[key]['name'].toString().camelCase,
                color: Color.fromARGB(
                  ((fill['color']['a'] * 255) as double).toInt(),
                  ((fill['color']['r'] * 255) as double).toInt(),
                  ((fill['color']['g'] * 255) as double).toInt(),
                  ((fill['color']['b'] * 255) as double).toInt(),
                ));
            color.validate();
            if (figmaColorStyles.map((e) => e.name).contains(color.name) ||
                figmaColorStyles
                    .map((e) => e.name)
                    .contains('${color.name}Dark') ||
                figmaColorStyles
                    .map((e) => e.name)
                    .contains('${color.name}Light')) {
              final nameParts = color.name.sentenceCase.split(' ');
              nameParts.insert(1, '${color.id.hashCode}');
              color.name = nameParts.join(' ').camelCase;
            }
            if (!color.name.endsWith('Dark') && !color.name.endsWith('Light')) {
              figmaColorStyles
                  .add(color.copyWithName(name: '${color.name}Dark'.camelCase));
              figmaColorStyles.add(
                  color.copyWithName(name: '${color.name}Light'.camelCase));
            } else {
              figmaColorStyles
                  .add(color.copyWithName(name: color.name.camelCase));
            }
          }
        }
      }

      for (final color in List<AppColorStyle>.from(figmaColorStyles)) {
        if (color.name.endsWith('Dark')) {
          final colorName = color.name.replaceLast('Dark', '');
          if (!figmaColorStyles
              .map((e) => e.name)
              .contains('${colorName}Light')) {
            figmaColorStyles
                .add(color.copyWithName(name: '${colorName}Light'.camelCase));
          }
        }
        if (color.name.endsWith('Light')) {
          final colorName = color.name.replaceLast('Light', '');
          if (!figmaColorStyles
              .map((e) => e.name)
              .contains('${colorName}Dark')) {
            figmaColorStyles
                .add(color.copyWithName(name: '${colorName}Dark'.camelCase));
          }
        }
      }

      figmaStyles.addAll(figmaTextStyles);
      figmaStyles.addAll(figmaColorStyles);

      return figmaStyles.toList();
    } catch (e) {
      logger.f(e);
      figmaStyles.add(AppTextStyle(
          color: '',
          fontFamily: 'Error',
          fontSize: 25,
          fontWeight: 400,
          letterSpacing: 0,
          id: '1',
          name: 'Error'));
      return figmaStyles.toList();
    }
  }
}
