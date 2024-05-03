import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';

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

  @override
  void onBlocCreated(BuildContext context, PlatformsScreenBloc bloc) {
    bloc.add(PlatformsScreenEvent.init(config: widget.config));
    super.onBlocCreated(context, bloc);
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
                initialValue: state.config.platformsList.android,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.config.platformsList
                      .copyWith(android: !state.config.platformsList.android),
                )),
              ),
              PlatformCheckbox(
                label: 'iOS',
                assetPath: 'assets/platform_logo/ios_logo.svg',
                initialValue: state.config.platformsList.ios,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.config.platformsList
                      .copyWith(ios: !state.config.platformsList.ios),
                )),
              ),
              PlatformCheckbox(
                label: 'Web',
                assetPath: 'assets/platform_logo/www_logo.svg',
                initialValue: state.config.platformsList.web,
                onAction: () =>
                    blocOf(context).add(PlatformsScreenEvent.onPlatformsChange(
                  platformsList: state.config.platformsList
                      .copyWith(web: !state.config.platformsList.web),
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
                  initialValue: state.config.platformsList.windows,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.config.platformsList.copyWith(
                            windows: !state.config.platformsList.windows),
                      ))),
              PlatformCheckbox(
                  label: 'MacOS',
                  assetPath: 'assets/platform_logo/macos_logo.svg',
                  initialValue: state.config.platformsList.macos,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.config.platformsList
                            .copyWith(macos: !state.config.platformsList.macos),
                      ))),
              PlatformCheckbox(
                  label: 'Linux',
                  assetPath: 'assets/platform_logo/linux_logo.svg',
                  initialValue: state.config.platformsList.linux,
                  onAction: () => blocOf(context)
                          .add(PlatformsScreenEvent.onPlatformsChange(
                        platformsList: state.config.platformsList
                            .copyWith(linux: !state.config.platformsList.linux),
                      ))),
            ],
          ),
          const Delimiter.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFilledButton(
                  label: S.of(context).goBack,
                  icon: Icons.arrow_back_ios_rounded,
                  onPressed: () => context.go(AppRouter.projectNameScreen,
                      extra: widget.config.copyWith(
                          platformsList: state.config.platformsList))),
              const Delimiter.width(10),
              AppFilledButton(
                  label: S.of(context).continueLabel,
                  icon: Icons.arrow_forward_ios_rounded,
                  iconLeft: false,
                  active: state.config.platformsList.selected,
                  onPressed: () => context.go(
                        AppRouter.projectSettingsScreen,
                        extra: widget.config.copyWith(
                          platformsList: state.config.platformsList,
                          flavorize: state.config.platformsList.webOnly
                              ? false
                              : state.config.flavorize,
                          flavors: state.config.platformsList.webOnly
                              ? ''
                              : state.config.flavors,
                          generateSigningKey: state.config.platformsList.webOnly
                              ? false
                              : state.config.generateSigningKey,
                        ),
                      )),
            ],
          ),
        ],
      ),
    );
  }
}
