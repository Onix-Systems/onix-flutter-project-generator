import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/splash_screen/bloc/splash_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  final bool skipSplash;

  const SplashScreen({
    this.skipSplash = false,
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreenState, SplashScreenBloc,
    SplashScreenSR, SplashScreen> {
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

  void _onSingleResult(BuildContext context, SplashScreenSR singleResult) {
    singleResult.when(
      onShowPathSelector: () => _onShowPathSelector(context),
      onNeedUpdate: () => _onNeedUpdate(context),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    SplashScreenState state,
  ) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: !widget.skipSplash
                    ? state.logoVisible
                        ? 0.5
                        : 0
                    : state.logoVisible
                        ? 0.5
                        : 0.49,
                duration: Duration(milliseconds: widget.skipSplash ? 0 : 2000),
                child: Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onEnd: () {
                  blocOf(context)
                      .add(const SplashScreenEvent.onAnimationFinished());
                },
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Text(
            state.localVersion.isNotEmpty ? 'v${state.localVersion}' : '',
            style: context.appTextStyles.fs18?.copyWith(
              decoration: TextDecoration.none,
              color: state.remoteVersion == state.localVersion
                  ? AppColors.orange
                  : AppColors.red,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl() async {
    final url = Uri.parse(AppConsts.releaseUri);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
    exit(0);
  }

  _onShowPathSelector(BuildContext context) {
    getDirectoryPath().then(
      (value) {
        if (value != null) {
          context.go(AppRouter.procedureSelectionScreen,
              extra: Config(projectPath: value));
        } else {
          Dialogs.showOkDialog(
            context: context,
            isError: true,
            title: S.of(context).pathNotSelectedTitle,
            content: S.of(context).pathNotSelectedContent,
            onOk: () => blocOf(context)
                .addSr(const SplashScreenSR.onShowPathSelector()),
          );
        }
      },
    );
  }

  _onNeedUpdate(BuildContext context) {
    Dialogs.showOkCancelDialog(
      context: context,
      title: S.of(context).newVersionAvailableTitle,
      content: Text(
        S.of(context).newVersionAvailableContent,
        style: context.appTextStyles.fs18?.copyWith(
          fontSize: 16,
        ),
      ),
      onOk: _launchUrl,
      onCancel: () {
        blocOf(context).addSr(const SplashScreenSR.onShowPathSelector());
      },
    );
  }
}
