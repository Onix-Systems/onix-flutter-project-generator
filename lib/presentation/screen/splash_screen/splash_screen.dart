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
  const SplashScreen({
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
      onContinue: () => context.go(
        AppRouter.procedureSelectionScreen,
        extra: Config(
          localVersion: blocOf(context).state.localVersion,
          remoteVersion: blocOf(context).state.remoteVersion,
        ),
      ),
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
                opacity: state.logoVisible ? 0.5 : 0.49,
                duration: const Duration(milliseconds: 2000),
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
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
        if (state.remoteVersion != state.localVersion)
          Positioned(
            right: 10,
            bottom: 10,
            child: Text(
              state.localVersion.isNotEmpty ? 'v ${state.localVersion}' : '',
              style: context.appTextStyles.fs18?.copyWith(
                decoration: TextDecoration.none,
                color: AppColors.red,
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
}
