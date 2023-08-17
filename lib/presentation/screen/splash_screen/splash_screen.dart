import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      onNeedUpdate: () => _onNeedUpdate(context),
      onContinue: () =>
          context.go(AppRouter.procedureSelectionScreen, extra: const Config()),
      onPermissions: () => _onPermissions(context),
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

  Future<void> _launchUrl({required String url, bool exitAfter = true}) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
    if (exitAfter) {
      exit(0);
    }
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
      onOk: () => _launchUrl(
        url: AppConsts.releaseUri,
      ),
      onCancel: () {
        blocOf(context).addSr(const SplashScreenSR.onContinue());
      },
    );
  }

  _onPermissions(BuildContext context) {
    Dialogs.showOkCancelDialog(
      context: context,
      title: S.of(context).gitPermissionsTitle,
      content: Column(
        children: [
          Text(
            S.of(context).gitPermissionsContent,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            ),
          ),
          TextButton(
              onPressed: () => _launchUrl(
                    url: AppConsts.sshPermissionsTutorialUri,
                    exitAfter: false,
                  ),
              child: Text(
                S.of(context).alsoReadThis,
                style: context.appTextStyles.fs18?.copyWith(
                  color: CupertinoColors.activeBlue,
                ),
              )),
        ],
      ),
      okLabel: S.of(context).retry,
      onOk: () =>
          blocOf(context).add(const SplashScreenEventOnAnimationFinished()),
      cancelLabel: S.of(context).exitLabel,
      onCancel: () => exit(0),
    );
  }
}
