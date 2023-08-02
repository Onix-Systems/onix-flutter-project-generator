import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class ProcedureSelectionScreen extends StatelessWidget {
  final String projectPath;

  const ProcedureSelectionScreen({required this.projectPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppFilledButton(
                  label: S.of(context).generateNewProject,
                  onPressed: () {
                    context.go(AppRouter.projectNameScreen, extra: projectPath);
                  },
                  icon: Icons.create_new_folder_outlined,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppFilledButton(
                  label: S.of(context).openExistingProject,
                  onPressed: () {
                    //TODO: implement open existing project
                    logger.f('Open existing project');
                  },
                  icon: Icons.folder_open_outlined,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
