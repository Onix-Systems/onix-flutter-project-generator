import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_checkbox.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class PlatformScreenBody extends StatelessWidget {
  final Config config;
  final void Function(AvailablePlatforms platforms) onAction;

  const PlatformScreenBody({
    required this.config,
    required this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: AvailablePlatforms.values.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 40,
            mainAxisExtent: 150,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final platform = AvailablePlatforms.values[index];

            return PlatformCheckbox(
              label: platform.name,
              assetPath: platform.asset,
              initialValue: _getPlatformState(
                context,
                config: config,
                platform: platform,
              ),
              onAction: () => onAction(platform),
            );
          },
        ),
        const Delimiter.height(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppFilledButton(
              label: S.of(context).goBack,
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => context.go(
                AppRouter.projectNameScreen,
                extra: config,
              ),
            ),
            const Delimiter.width(10),
            AppFilledButton(
              label: S.of(context).continueLabel,
              icon: Icons.arrow_forward_ios_rounded,
              iconLeft: false,
              active: config.platformsList.selected,
              onPressed: () => context.go(
                AppRouter.projectSettingsScreen,
                extra: config.copyWith(
                  platformsList: config.platformsList,
                  flavorize:
                      config.platformsList.webOnly ? false : config.flavorize,
                  flavors: config.platformsList.webOnly ? '' : config.flavors,
                  generateSigningKey: config.platformsList.webOnly
                      ? false
                      : config.generateSigningKey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _getPlatformState(
    BuildContext context, {
    required AvailablePlatforms platform,
    required Config config,
  }) {
    return switch (platform) {
      AvailablePlatforms.mobile =>
        config.platformsList.android && config.platformsList.ios,
      AvailablePlatforms.web => config.platformsList.web,
      AvailablePlatforms.windows => config.platformsList.windows,
      AvailablePlatforms.macos => config.platformsList.macos,
      AvailablePlatforms.linux => config.platformsList.linux,
    };
  }
}
