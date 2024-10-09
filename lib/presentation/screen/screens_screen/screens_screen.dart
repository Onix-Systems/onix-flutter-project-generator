import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class ScreensScreen extends StatefulWidget {
  final Config config;
  final VoidCallback? onContinue;

  const ScreensScreen({
    required this.config,
    this.onContinue,
    super.key,
  });

  @override
  State<ScreensScreen> createState() => _ScreensScreenState();
}

class _ScreensScreenState extends BaseState<ScreensScreenState,
    ScreensScreenBloc, ScreensScreenSR, ScreensScreen> {
  @override
  ScreensScreenBloc createBloc() => GetIt.I.get<ScreensScreenBloc>();

  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: blocBuilder(
        builder: (context, state) {
          return CupertinoPageScaffold(
            navigationBar: TitleBar(
              title: S.of(context).selectProjectScreens,
              actions: [
                AppFilledButton(
                  label: S.of(context).addScreen,
                  icon: Icons.add,
                  onPressed: () => showCupertinoModalPopup<Screen>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AddScreenDialog(
                      stateManagers:
                          state.config.stateManager.strategy.variants,
                    ),
                  ).then(
                    (screen) {
                      if (!context.mounted) return;

                      if (screen != null) {
                        if (state.config.screens.isEmpty) {
                          screen.initial = true;
                        }
                        blocOf(context).add(
                          ScreensScreenEventOnScreenAdd(screen: screen),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            child: _buildMainContainer(context, state),
          );
        },
      ),
      onSR: _onSingleResult,
    );
  }

  @override
  void onBlocCreated(BuildContext context, ScreensScreenBloc bloc) {
    bloc.add(ScreensScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(BuildContext context, ScreensScreenSR singleResult) {
    singleResult.when(
      existsError: () {
        Dialogs.showOkDialog(
          context: context,
          isError: true,
          title: S.of(context).screenAlreadyExistsTitle,
          content: Text(
            S.of(context).screenAlreadyExistsContent,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ScreensScreenState state,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Delimiter.height(100),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.appColors.fadedColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: ScreenTable(
                  screens: state.config.screens
                      .toList()
                      .sorted((a, b) => a.name.compareTo(b.name))
                      .toSet(),
                  stateManagers: state.config.stateManager.strategy.variants,
                  onModifyScreen: (screen, name) => blocOf(context).add(
                    ScreensScreenEventOnScreenModify(
                      screen: screen,
                      oldName: name,
                    ),
                  ),
                  onDeleteScreen: (screen) => blocOf(context).add(
                    ScreensScreenEventOnScreenDelete(
                      screenName: screen.name,
                    ),
                  ),
                  onChangeInitial: (screen) => blocOf(context).add(
                    ScreensScreenEventOnScreenChangeInitial(
                      screen: screen,
                    ),
                  ),
                ),
              ),
            ),
            const Delimiter.height(10),
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

  void _onBack(BuildContext context, ScreensScreenState state) {
    widget.config.projectExists
        ? context.go(
            AppRouter.procedureSelectionScreen,
            extra: Config(
              projectPath: widget.config.projectPath,
              localVersion: widget.config.localVersion,
              remoteVersion: widget.config.remoteVersion,
            ),
          )
        : context.go(
            AppRouter.projectSettingsScreen,
            extra: state.config,
          );
  }

  void _onContinue(BuildContext context, ScreensScreenState state) {
    widget.config.projectExists
        ? widget.onContinue?.call()
        : context.go(
            AppRouter.stylesScreen,
            extra: state.config,
          );
  }
}
