import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bloc/onix_flutter_bloc.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_screen_body.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/navigation_button_bar.dart';
import 'package:onix_flutter_bricks/presentation/widget/title_bar.dart';

class PlatformsScreen extends StatefulWidget {
  const PlatformsScreen({
    super.key,
  });

  @override
  State<PlatformsScreen> createState() => _PlatformsScreenState();
}

class _PlatformsScreenState extends BaseState<PlatformsScreenState,
    PlatformsScreenBloc, PlatformsScreenSR, PlatformsScreen> {
  @override
  PlatformsScreenBloc createBloc() => GetIt.I.get<PlatformsScreenBloc>();

  @override
  void onBlocCreated(BuildContext context, PlatformsScreenBloc bloc) {
    bloc.add(const PlatformsScreenEvent.init());
    super.onBlocCreated(context, bloc);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TitleBar(
        title: S.of(context).selectProjectPlatforms,
      ),
      child: SizedBox.expand(
        child: blocBuilder(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: PlatformScreenBody(
                    platformsList: state.config.platformsList,
                    onAction: (platform) {
                      blocOf(context).add(
                        PlatformsScreenEvent.onPlatformsChange(item: platform),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: NavigationButtonBar(
                    nextText: S.of(context).continueLabel,
                    prevText: S.of(context).goBack,
                    isActive: state.config.platformsList.selected,
                    onNextPressed: () {
                      context.go(
                        AppRouter.projectSettingsScreen,
                      );
                    },
                    onPrevPressed: () {
                      context.go(
                        AppRouter.projectNameScreen,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
