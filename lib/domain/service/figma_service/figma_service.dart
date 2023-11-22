import 'dart:convert';

import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:http/http.dart' as http;
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:recase/recase.dart';

class FigmaService {
  Future<List<AppStyle>> getStyles(String figmaId, String token) async {
    final Set<AppStyle> figmaStyles = {};

    try {
      final fileResponse = await http.get(
          Uri.parse('${AppConsts.figmaBaseUrl}/files/$figmaId/'),
          headers: {
            'X-Figma-Token': token,
          });
      if (fileResponse.statusCode != 200) {
        throw Exception('Error getting styles');
      }
      final styles =
          (jsonDecode(fileResponse.body) as Map<String, dynamic>)['styles'];
      if (styles != null) {
        final keys = styles.keys
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '')
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
            figmaStyles.add(AppTextStyle(
                fontFamily: textStyle['fontFamily'],
                fontSize: textStyle['fontSize'],
                fontWeight: textStyle['fontWeight'],
                letterSpacing: textStyle['letterSpacing'],
                id: key.toString(),
                name: styles[key]['name'].toString().camelCase));
          } else {
            final fill = node['document']['fills'][0];
            final color = (AppColorStyle(
                id: key.toString(),
                alpha: ((fill['color']['a'] * 255) as double).toInt(),
                r: ((fill['color']['r'] * 255) as double).toInt(),
                g: ((fill['color']['g'] * 255) as double).toInt(),
                b: ((fill['color']['b'] * 255) as double).toInt(),
                opacity: fill['opacity'] ?? 1,
                name: styles[key]['name'].toString().camelCase));
            figmaStyles.add(color);
          }
        }
      }

      return figmaStyles.toList();
    } catch (e) {
      figmaStyles.add(AppTextStyle(
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
