import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';

class ProcedureSelectionScreen extends StatelessWidget {
  final Config config;

  const ProcedureSelectionScreen({required this.config, Key? key})
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
                  big: true,
                  onPressed: () {
                    context.go(
                      AppRouter.projectNameScreen,
                      extra: config.copyWith(
                        projectName:
                            config.projectExists ? '' : config.projectName,
                        projectExists: false,
                      ),
                    );
                  },
                  icon: Icons.create_new_folder_outlined,
                ),
              ),
              if (config.projectExists && config.projectName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppFilledButton(
                    label: S
                        .of(context)
                        .modifyGeneratedProject(config.projectName),
                    big: true,
                    onPressed: () {
                      //context.go(AppRouter.projectNameScreen, extra: config);
                    },
                    icon: Icons.create_new_folder_outlined,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppFilledButton(
                  label: S.of(context).openExistingProject,
                  big: true,
                  onPressed: () {
                    //TODO: implement open existing project
                    logger.f('Open existing project');
                  },
                  icon: Icons.folder_open_outlined,
                ),
              ),
            ],
          ),
          const Delimiter.height(40),
          AppFilledButton(
              label: S.of(context).goBack,
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => context.go(AppRouter.splashScreen, extra: true)),
          const Spacer(),
        ],
      )),
    );
  }
}
