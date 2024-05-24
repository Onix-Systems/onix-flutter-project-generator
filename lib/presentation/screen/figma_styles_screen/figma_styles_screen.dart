import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/app_styles/app_styles.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/bloc/figma_styles_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/figma_styles_screen/widgets/styles_widget.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class FigmaStylesScreen extends StatefulWidget {
  final ValueChanged<List<AppStyle>>? onContinue;
  final ValueChanged<List<AppStyle>>? onBack;
  final Config config;

  const FigmaStylesScreen({
    this.onContinue,
    this.onBack,
    required this.config,
    super.key,
  });

  @override
  State<FigmaStylesScreen> createState() => _FigmaStylesScreenState();
}

class _FigmaStylesScreenState extends BaseState<FigmaStylesScreenState,
    FigmaStylesScreenBloc, FigmaStylesScreenSR, FigmaStylesScreen> {
  final TextEditingController _figmaFileController = TextEditingController();
  final TextEditingController _figmaTokenController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        navigationBar: TitleBar(
          title: S.of(context).importStyles,
        ),
        child: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
  }

  @override
  void onBlocCreated(BuildContext context, FigmaStylesScreenBloc bloc) {
    bloc.add(FigmaStylesScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(BuildContext context, FigmaStylesScreenSR singleResult) {
    singleResult.when(
      loadFinished: () => context.go(AppRouter.modifyProjectScreen,
          extra: blocOf(context).state.config),
      error: (error) => _showError(context, error),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    FigmaStylesScreenState state,
  ) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.config.styles.isEmpty) const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: _figmaFileController,
                    style: context.appTextStyles.fs18,
                    placeholder: S.of(context).figmaFileKey,
                  ),
                ),
                const Delimiter.width(10),
                Expanded(
                  child: CupertinoTextField(
                    controller: _figmaTokenController,
                    style: context.appTextStyles.fs18,
                    placeholder: S.of(context).figmaToken,
                  ),
                ),
              ],
            ),
            const Delimiter.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200,
                        child: AppFilledButton(
                          label: S.of(context).getStyles,
                          icon: Icons.download_rounded,
                          onPressed: () => blocOf(context).add(
                            FigmaStylesScreenEventOnGetStyles(
                              figmaId: _figmaFileController.text,
                              token: _figmaTokenController.text,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Delimiter.width(10),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: AppFilledButton(
                          label: S.of(context).clear,
                          icon: Icons.delete_rounded,
                          active: true,
                          color: CupertinoColors.destructiveRed,
                          onPressed: () => blocOf(context)
                              .add(const FigmaStylesScreenEventOnClear()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (state.config.styles.isEmpty)
              const Spacer()
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: StylesWidget(
                    styles: state.config.styles,
                  ),
                ),
              ),
            NavigationButtonBar(
              nextText: S.of(context).continueLabel,
              prevText: S.of(context).goBack,
              onNextPressed: () {
                _onContinue(context, state);
              },
              onPrevPressed: () {
                _onBack(context, state);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue(BuildContext context, FigmaStylesScreenState state) {
    widget.config.projectExists
        ? widget.onContinue?.call(state.config.styles)
        : context.go(
            AppRouter.swaggerParserScreen,
            extra: widget.config.copyWith(
              styles: state.config.styles,
            ),
          );
  }

  void _onBack(BuildContext context, FigmaStylesScreenState state) {
    state.config.projectExists
        ? widget.onBack?.call(state.config.styles)
        : context.go(
            AppRouter.screensScreen,
            extra: widget.config.copyWith(
              styles: state.config.styles,
            ),
          );
  }

  void _showError(BuildContext context, String error) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(S.of(context).error),
        content: Text(error),
        actions: [
          CupertinoDialogAction(
            child: Text(S.of(context).ok),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
