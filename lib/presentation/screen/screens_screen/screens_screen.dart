import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/domain/entity/screen/screen.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/bloc/project_settings_screen_models.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/bloc/screens_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/add_screen_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/screens_screen/widgets/screen_table.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';

class ScreensScreen extends StatefulWidget {
  final ScreensScreenExtra extra;

  const ScreensScreen({
    required this.extra,
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
            stateListener: (state) => _buildMainContainer(context, state),
          ),
        ),
      ),
      onSR: _onSingleResult,
    );
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: state.screens.isNotEmpty
                  ? ScreenTable(
                      screens: state.screens,
                      onModifyScreen: (screen) => blocOf(context).add(
                        const ScreensScreenEventOnScreenModify(),
                      ),
                      onDeleteScreen: (screen) => blocOf(context).add(
                        ScreensScreenEventOnScreenDelete(
                          screen: screen,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            const Delimiter.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const Delimiter.width(20),
                AppFilledButton(
                  label: S.of(context).continueLabel,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScreensScreenExtra {
  final String projectPath;
  final String projectName;
  final String organization;
  final PlatformsList platformsList;
  final bool flavorize;
  final String flavors;
  final bool generateSigningKey;
  final bool useSonar;
  final ProjectRouter router;
  final ProjectLocalization localization;
  final ProjectTheming theming;
  final bool integrateDevicePreview;
  final List<String> signingVars;

  const ScreensScreenExtra({
    required this.projectPath,
    required this.projectName,
    required this.organization,
    required this.platformsList,
    required this.flavorize,
    required this.flavors,
    required this.generateSigningKey,
    required this.useSonar,
    required this.router,
    required this.localization,
    required this.theming,
    required this.integrateDevicePreview,
    required this.signingVars,
  });
}
