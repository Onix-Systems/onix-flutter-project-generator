import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/services.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_color_style.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_text_style.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_action_button.dart';
import 'package:recase/recase.dart';

class FigmaStylesDialog extends StatefulWidget {
  final String figmaFile;
  final String figmaToken;

  const FigmaStylesDialog({
    required this.figmaFile,
    required this.figmaToken,
    super.key,
  });

  @override
  State<FigmaStylesDialog> createState() => _FigmaStylesDialogState();
}

class _FigmaStylesDialogState extends State<FigmaStylesDialog> {
  final List<AppStyle> _styles = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: FutureBuilder<List<AppStyle>>(
          future: figmaService.getStyles(widget.figmaFile, widget.figmaToken),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }
            final data = snapshot.data;

            if (data != null) {
              _styles.addAll(data);
              final colorStyles = data.whereType<AppColorStyle>().toList();
              final textStyles = data.whereType<AppTextStyle>().toList();

              if (colorStyles.isEmpty &&
                  (textStyles.isEmpty ||
                      textStyles.first.fontFamily == 'Error')) {
                context.pop(textStyles);
                return const SizedBox();
              }

              return Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: MediaQuery.sizeOf(context).height * 0.7,
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Delimiter.height(20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomScrollView(
                          shrinkWrap: true,
                          slivers: [
                            const SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'Color styles:',
                                  textAlign: TextAlign.center,
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
                                    colorStyles.length,
                                    (index) => Container(
                                      width: 100,
                                      height: 100,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorStyles[index].color,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        colorStyles[index]
                                            .name
                                            .sentenceCase
                                            .toLowerCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: colorStyles[index].color,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            const SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  'Text styles:',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => Text(
                                  textStyles[index].name.sentenceCase,
                                  style: textStyles[index].getFontStyle(),
                                ),
                                childCount: textStyles.length,
                              ),
                            ),
                            const SliverToBoxAdapter(
                              child: Delimiter.height(20),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: ColoredBox(
                        color: AppColors.inactiveText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppActionButton(
                            label: S.of(context).ok,
                            onPressed: () => context.pop(_styles),
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                          width: 1,
                          child: ColoredBox(
                            color: AppColors.inactiveText,
                          ),
                        ),
                        Expanded(
                          child: AppActionButton(
                            label: S.of(context).cancel,
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
