import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/repository.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';

class ScreensScreen extends StatefulWidget {
  final Config config;
  final Function(Set<Screen>)? onChange;
  final VoidCallback? onGenerate;

  const ScreensScreen({
    required this.config,
    this.onChange,
    this.onGenerate,
    super.key,
  });

  @override
  State<ScreensScreen> createState() => _ScreensScreenState();
}

class _ScreensScreenState extends BaseState<ScreensScreenState,
    ScreensScreenBloc, ScreensScreenSR, ScreensScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return srObserver(
      context: context,
      child: CupertinoPageScaffold(
        child: SizedBox.expand(
          child: blocConsumer(
            stateListener: (state) {
              widget.onChange?.call(state.config.screens);
              return _buildMainContainer(context, state);
            },
          ),
        ),
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
          content: S.of(context).screenAlreadyExistsContent,
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
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.systemGrey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: ScreenTable(
                  screens: state.config.screens
                      .toList()
                      .sorted((a, b) => a.name.compareTo(b.name))
                      .toSet(),
                  onModifyScreen: (screen, name) => blocOf(context).add(
                    ScreensScreenEventOnScreenModify(
                        screen: screen, oldName: name),
                  ),
                  onDeleteScreen: (screen) => blocOf(context).add(
                    ScreensScreenEventOnScreenDelete(
                      screen: screen,
                    ),
                  ),
                ),
              ),
            ),
            const Delimiter.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  label: S.of(context).goBack,
                  icon: Icons.arrow_back_ios_rounded,
                  onPressed: () => _onBack(context, state),
                ),
                const Delimiter.width(10),
                AppFilledButton(
                  label: S.of(context).addScreen,
                  icon: Icons.add,
                  onPressed: () => showCupertinoModalPopup<Screen>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const AddScreenDialog(),
                  ).then((screen) {
                    if (screen != null) {
                      blocOf(context).add(
                        ScreensScreenEventOnScreenAdd(screen: screen),
                      );
                    }
                  }),
                ),
                const Delimiter.width(10),
                AppFilledButton(
                  label: S.of(context).continueLabel,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconLeft: false,
                  active: widget.config.projectExists
                      ? sourceRepository.containsNewComponents() ||
                          dataComponentRepository.containsNewComponents() ||
                          screenRepository.containsNewComponents()
                      : true,
                  onPressed: () => _onContinue(context, state),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onBack(BuildContext context, ScreensScreenState state) {
    widget.config.projectExists
        ? context.go(AppRouter.procedureSelectionScreen,
            extra: Config(
              projectPath: widget.config.projectPath,
            ))
        : context.go(
            AppRouter.projectSettingsScreen,
            extra: widget.config,
          );
  }

  void _onContinue(BuildContext context, ScreensScreenState state) {
    widget.config.projectExists
        ? widget.onGenerate?.call()
        : context.go(
            AppRouter.swaggerParserScreen,
            extra: widget.config,
          );
  }
}
