import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/widgets/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widgets/dialogs/dialog.dart';

class ProcedureSelectionScreen extends StatefulWidget {
  final Config config;

  const ProcedureSelectionScreen({required this.config, Key? key})
      : super(key: key);

  @override
  State<ProcedureSelectionScreen> createState() =>
      _ProcedureSelectionScreenState();
}

class _ProcedureSelectionScreenState extends BaseState<
    ProcedureSelectionScreenState,
    ProcedureSelectionScreenBloc,
    ProcedureSelectionScreenSR,
    ProcedureSelectionScreen> {
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

  @override
  void onBlocCreated(BuildContext context, ProcedureSelectionScreenBloc bloc) {
    bloc.add(ProcedureSelectionScreenEventInit(config: widget.config));
    super.onBlocCreated(context, bloc);
  }

  void _onSingleResult(
      BuildContext context, ProcedureSelectionScreenSR singleResult) {
    singleResult.when(
      loadFinished: () => context.go(AppRouter.modifyProjectScreen,
          extra: blocOf(context).state.config),
      emptyConfig: () => Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).emptyConfigTitle,
        content: S.of(context).emptyConfigContent,
      ),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProcedureSelectionScreenState state,
  ) {
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
                      extra: Config(
                        projectPath: widget.config.projectPath,
                      ),
                    );
                  },
                  icon: Icons.create_new_folder_outlined,
                ),
              ),
              if (widget.config.projectExists &&
                  widget.config.projectName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppFilledButton(
                    label: S
                        .of(context)
                        .modifyGeneratedProject(widget.config.projectName),
                    big: true,
                    onPressed: () {
                      context.go(AppRouter.modifyProjectScreen,
                          extra: widget.config.copyWith(projectExists: true));
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
                    getDirectoryPath().then(
                      (value) {
                        if (value != null) {
                          blocOf(context)
                              .add(ProcedureSelectionScreenEventOnProjectOpen(
                            projectURI: value,
                          ));
                        }
                      },
                    );
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
