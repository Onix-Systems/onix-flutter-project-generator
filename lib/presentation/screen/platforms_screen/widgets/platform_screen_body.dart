import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/domain/entity/platforms_list/platforms_list.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/bloc/platforms_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/platforms_screen/widgets/platform_checkbox.dart';

class PlatformScreenBody extends StatelessWidget {
  final PlatformsList platformsList;
  final ValueChanged<AvailablePlatforms> onAction;

  const PlatformScreenBody({
    required this.platformsList,
    required this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: AvailablePlatforms.values.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 40,
              mainAxisExtent: 150,
            ),
            itemBuilder: (context, index) {
              final platform = AvailablePlatforms.values[index];

              return PlatformCheckbox(
                label: platform.name,
                assetPath: platform.asset,
                initialValue: _getPlatformState(
                  context,
                  platform: platform,
                ),
                onAction: () => onAction(platform),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  bool _getPlatformState(
    BuildContext context, {
    required AvailablePlatforms platform,
  }) {
    return switch (platform) {
      AvailablePlatforms.mobile => platformsList.android && platformsList.ios,
      AvailablePlatforms.web => platformsList.web,
      AvailablePlatforms.windows => platformsList.windows,
      AvailablePlatforms.macos => platformsList.macos,
      AvailablePlatforms.linux => platformsList.linux,
    };
  }
}
