import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class PlatformsScreen extends StatefulWidget {
  final Config config;

  const PlatformsScreen({
    required this.config,
    super.key,
  });

  @override
  State<PlatformsScreen> createState() => _PlatformsScreenState();
}

class _PlatformsScreenState extends BaseState<PlatformsScreenState,
    PlatformsScreenBloc, PlatformsScreenSR, PlatformsScreen> {
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

  void _onSingleResult(BuildContext context, PlatformsScreenSR singleResult) {
    singleResult.when(
      loadFinished: () {},
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    PlatformsScreenState state,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlatformCheckbox(
                label: 'Android',
                assetPath: 'assets/platform_logo/android_logo.svg',
                initialValue: state.platformsList.android,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.platformsList
                      .copyWith(android: !state.platformsList.android),
                )),
              ),
              PlatformCheckbox(
                label: 'iOS',
                assetPath: 'assets/platform_logo/ios_logo.svg',
                initialValue: state.platformsList.ios,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.platformsList
                      .copyWith(ios: !state.platformsList.ios),
                )),
              ),
              PlatformCheckbox(
                label: 'Web',
                assetPath: 'assets/platform_logo/www_logo.svg',
                initialValue: state.platformsList.web,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.platformsList
                      .copyWith(web: !state.platformsList.web),
                )),
              ),
            ],
          ),
          const Delimiter.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlatformCheckbox(
                  label: 'Windows',
                  assetPath: 'assets/platform_logo/win_logo.svg',
                  initialValue: state.platformsList.windows,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.platformsList
                            .copyWith(windows: !state.platformsList.windows),
                      ))),
              PlatformCheckbox(
                  label: 'MacOS',
                  assetPath: 'assets/platform_logo/macos_logo.svg',
                  initialValue: state.platformsList.macos,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.platformsList
                            .copyWith(macos: !state.platformsList.macos),
                      ))),
              PlatformCheckbox(
                  label: 'Linux',
                  assetPath: 'assets/platform_logo/linux_logo.svg',
                  initialValue: state.platformsList.linux,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.platformsList
                            .copyWith(linux: !state.platformsList.linux),
                      ))),
            ],
          ),
          const Delimiter.height(40),
          Visibility(
            visible: state.platformsList.selected,
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
            child: AppFilledButton(
                label: S.of(context).continueLabel,
                onPressed: () => context.go(
                      AppRouter.projectSettingsScreen,
                      extra: widget.config.copyWith(
                        platformsList: state.platformsList,
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
