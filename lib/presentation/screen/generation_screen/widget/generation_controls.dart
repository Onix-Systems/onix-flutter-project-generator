import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/app/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';

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
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: onOpenAndroidStudio,
          child: Text(
            S.of(context).openInAndroidStudio,
            style: TextStyle(
              color: context.appColors.textColor,
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          child: Icon(
            CupertinoIcons.clear,
            color: context.appColors.controlColor,
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
    context.go(
      AppRouter.procedureSelectionScreen,
      extra: config.copyWith(
        projectExists: true,
      ),
    );
  }
}
