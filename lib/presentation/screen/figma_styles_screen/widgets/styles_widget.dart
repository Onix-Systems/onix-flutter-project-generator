import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/widgets/color_style_item.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/widgets/text_style_item.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

class StylesWidget extends StatelessWidget {
  final List<AppStyle> styles;

  const StylesWidget({required this.styles, super.key});

  @override
  Widget build(BuildContext context) {
    final colorStyles = styles.whereType<AppColorStyle>().toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    final textStyles = styles.whereType<AppTextStyle>().toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return Material(
      color: Colors.transparent,
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.appColors.fadedColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Color styles:',
                      textAlign: TextAlign.center,
                      style: context.appTextStyles.fs18,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: List.generate(
                      colorStyles.where((e) => e.validate()).length,
                      (index) => ColorStyleItem(
                        colorStyle: colorStyles
                            .where((e) => e.validate())
                            .toList()[index],
                      ),
                    ),
                  ),
                ),
                if (colorStyles.where((e) => !e.validate()).isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: context.appColors.alarmColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Invalid color styles:',
                              textAlign: TextAlign.center,
                              style: context.appTextStyles.fs18?.copyWith(
                                color: context.appColors.alarmColor,
                              ),
                            ),
                            const Delimiter.height(10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: List.generate(
                                colorStyles.where((e) => !e.validate()).length,
                                (index) => ColorStyleItem(
                                  colorStyle: colorStyles
                                      .where((e) => !e.validate())
                                      .toList()[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Text styles:',
                      textAlign: TextAlign.center,
                      style: context.appTextStyles.fs18,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.only(top: index > 0 ? 8 : 0),
                      child: TextStyleItem(
                        textStyle: textStyles
                            .where((e) => e.validate())
                            .toList()[index],
                      ),
                    ),
                    childCount: textStyles.where((e) => e.validate()).length,
                  ),
                ),
                if (textStyles.where((e) => !e.validate()).isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: context.appColors.alarmColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Invalid text styles:',
                              textAlign: TextAlign.center,
                              style: context.appTextStyles.fs18?.copyWith(
                                color: context.appColors.alarmColor,
                              ),
                            ),
                            const Delimiter.height(10),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    EdgeInsets.only(top: index > 0 ? 8 : 0),
                                child: TextStyleItem(
                                  textStyle: textStyles
                                      .where((e) => !e.validate())
                                      .toList()[index],
                                ),
                              ),
                              itemCount:
                                  textStyles.where((e) => !e.validate()).length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(child: Delimiter.height(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
