import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/figma_styles_dialog/bloc/figma_styles_dialog_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/figma_styles_dialog/widget/color_styles_wrap.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_action_button.dart';
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

class _FigmaStylesDialogState extends BaseState<FigmaStylesDialogState,
    FigmaStylesDialogBloc, FigmaStylesDialogSR, FigmaStylesDialog> {
  @override
  void onBlocCreated(BuildContext context, FigmaStylesDialogBloc bloc) {
    bloc.add(
      FigmaStylesDialogEvent.getStyles(
          figmaId: widget.figmaFile, token: widget.figmaToken),
    );
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: blocBuilder(builder: (context, state) {
          if (state is FigmaStylesDialogStateError) {
            return const SizedBox();
          }
          final dataState = (state as FigmaStylesDialogStateData);
          if (dataState.isLoading) {
            return const CupertinoActivityIndicator();
          }

          return Container(
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: MediaQuery.sizeOf(context).height * 0.7,
            decoration: BoxDecoration(
              color: context.appColors.darkColor,
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
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              S.of(context).colorStyles,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ColorStylesWrap(
                            styles: dataState.colorStyles,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              S.of(context).textStyles,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SliverList.builder(
                          itemBuilder: (context, index) => Text(
                            dataState.textStyles[index].name.sentenceCase,
                            style: dataState.textStyles[index].getFontStyle(),
                          ),
                          itemCount: dataState.textStyles.length,
                        ),
                        const SliverToBoxAdapter(
                          child: Delimiter.height(20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: context.appColors.fadedColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppActionButton(
                        label: S.of(context).ok,
                        onPressed: () => context.pop(
                          [dataState.textStyles, dataState..colorStyles],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 1,
                      child: ColoredBox(
                        color: context.appColors.fadedColor,
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
        }),
      ),
    );
  }
}
