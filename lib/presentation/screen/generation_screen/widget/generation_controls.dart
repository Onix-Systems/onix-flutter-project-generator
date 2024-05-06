import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';

class GenerationControls extends StatelessWidget {
  final VoidCallback onOpenAndroidStudio;
  final Config config;

  const GenerationControls({
    required this.onOpenAndroidStudio,
    required this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          // color: CupertinoColors.activeOrange,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onOpenAndroidStudio,
          child: Text(
            S.of(context).openInAndroidStudio,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          child: const Icon(
            CupertinoIcons.clear,
            color: CupertinoColors.white,
            size: 20,
          ),
          onPressed: () {
            _onCloseGeneration(context);
          },
        ),
      ],
    );
  }

  void _onCloseGeneration(BuildContext context) {
    if (config.projectExists) {
      context.go(
        AppRouter.modifyProjectScreen,
        extra: config.copyWith(
          projectExists: true,
        ),
      );
    } else {
      context.go(
        AppRouter.procedureSelectionScreen,
        extra: config.copyWith(
          projectExists: true,
        ),
      );
    }
  }
}
