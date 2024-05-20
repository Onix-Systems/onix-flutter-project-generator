import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/node/fill_paints_node.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/nodes/text_node/text_node_entity.dart';
import 'package:onix_flutter_bricks/domain/entity/figma/properties/paint_property/paint_property.dart';
import 'package:onix_flutter_bricks/domain/repository/figma_repository.dart';
import 'package:onix_flutter_bricks/domain/service/figma_service/params/figma_generation_params.dart';
import 'package:onix_flutter_bricks/util/extension/swagger_extensions.dart';
import 'package:recase/recase.dart';

class FigmaService {
  final FigmaRepository _figmaRepository;
  final _colorLightSuffix = 'Light';
  final _colorDarkSuffix = 'Dark';

  const FigmaService({
    required FigmaRepository figmaRepository,
  }) : _figmaRepository = figmaRepository;

  Future<List<AppStyle>> getStylesFromFigma(
      FigmaGenerationParams params) async {
    final Set<AppStyle> figmaStyles = {};
    final Set<AppTextStyle> figmaTextStyles = {};
    final Set<AppColorStyle> figmaColorStyles = {};

    try {
      final figmaResult = await _figmaRepository.getFigmaFiles(
        figmaId: params.figmaId,
        token: params.token,
      );

      if (figmaResult.isNotEmpty) {
        final keys = figmaResult.keys.map((e) => e).join(',');

        final nodes = await _figmaRepository.getFigmaNodes(
          figmaId: params.figmaId,
          token: params.token,
          nodeIds: keys,
        );

        ///Iterate all nodes and extract TextStyles and Colors
        for (final node in nodes) {
          ///Process TextNode
          if (node is TextNodeEntity) {
            final textStyle = _processTextNode(node);
            final figmaTextStyleNames = figmaTextStyles.map(
              (e) => e.name,
            );
            if (!figmaTextStyleNames.contains(textStyle.name)) {
              figmaTextStyles.add(textStyle);
            }

            ///Process paints node
          } else if (node is FillPaintsNode) {
            final colorStyle = _processFillNode(node);
            if (colorStyle == null) {
              continue;
            }

            colorStyle.validate();
            final colorNames = figmaColorStyles.map(
              (e) => e.name,
            );
            if (colorNames.contains(colorStyle.name) ||
                colorNames.contains('${colorStyle.name}$_colorDarkSuffix') ||
                colorNames.contains('${colorStyle.name}$_colorLightSuffix')) {
              final nameParts = colorStyle.name.sentenceCase.split(' ');
              nameParts.insert(1, '${colorStyle.id.hashCode}');
              colorStyle.name = nameParts.join(' ').camelCase;
            }
            if (!colorStyle.name.endsWith(_colorDarkSuffix) &&
                !colorStyle.name.endsWith(_colorLightSuffix)) {
              figmaColorStyles.add(colorStyle.copyWithName(
                  name: '${colorStyle.name}$_colorDarkSuffix'.camelCase));
              figmaColorStyles.add(colorStyle.copyWithName(
                  name: '${colorStyle.name}$_colorLightSuffix'.camelCase));
            } else {
              figmaColorStyles.add(
                  colorStyle.copyWithName(name: colorStyle.name.camelCase));
            }
          }
        }
      }

      for (final color in List<AppColorStyle>.from(figmaColorStyles)) {
        final figmaColorNames = figmaColorStyles.map(
          (e) => e.name,
        );
        if (color.name.endsWith(_colorDarkSuffix)) {
          final colorName = color.name.replaceLast(_colorDarkSuffix, '');
          if (!figmaColorNames.contains('$colorName$_colorLightSuffix')) {
            figmaColorStyles.add(color.copyWithName(
                name: '$colorName$_colorLightSuffix'.camelCase));
          }
        }
        if (color.name.endsWith(_colorLightSuffix)) {
          final colorName = color.name.replaceLast(_colorLightSuffix, '');
          if (!figmaColorNames.contains('$colorName$_colorDarkSuffix')) {
            figmaColorStyles.add(color.copyWithName(
                name: '$colorName$_colorDarkSuffix'.camelCase));
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

  AppTextStyle _processTextNode(TextNodeEntity node) {
    final textStyle = node.style;
    return AppTextStyle(
      fontFamily: textStyle.fontFamily,
      fontSize: textStyle.fontSize.toDouble(),
      fontWeight: textStyle.fontWeight.toInt(),
      letterSpacing: textStyle.letterSpacing.toDouble(),
      id: node.id,
      name: node.name.camelCase,
      color: '',
    );
  }

  AppColorStyle? _processFillNode(FillPaintsNode node) {
    final fills = node.fills;
    if (fills.isEmpty || fills.first.type != PaintPropertyType.solid) {
      return null;
    }
    return AppColorStyle(
      id: node.id,
      name: node.name,
      color: Color.fromARGB(
        (fills.first.color.a * 255).toInt(),
        (fills.first.color.r * 255).toInt(),
        (fills.first.color.g * 255).toInt(),
        (fills.first.color.b * 255).toInt(),
      ),
    );
  }
}
