import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onix_flutter_bricks/core/app/app_consts.dart';
import 'package:onix_flutter_bricks/core/app/localization/generated/l10n.dart';
import 'package:onix_flutter_bricks/core/arch/bloc/base_block_state.dart';
import 'package:onix_flutter_bricks/core/arch/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/router/app_router.dart';
import 'package:onix_flutter_bricks/domain/entity/config/config.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/bloc/procedure_selection_screen_bloc_imports.dart';
import 'package:onix_flutter_bricks/presentation/screen/procedure_selection_screen/widget/tools_popup_button.dart';
import 'package:onix_flutter_bricks/presentation/screen/project_settings_screen/widgets/signing_dialog.dart';
import 'package:onix_flutter_bricks/presentation/style/app_colors.dart';
import 'package:onix_flutter_bricks/presentation/style/theme/theme_extension/ext.dart';
import 'package:onix_flutter_bricks/presentation/widget/buttons/app_filled_button.dart';
import 'package:onix_flutter_bricks/presentation/widget/dialogs/dialog.dart';
import 'package:onix_flutter_bricks/util/enum/tool_type.dart';
import 'package:onix_flutter_bricks/util/extension/directory_extension.dart';

class ProcedureSelectionScreen extends StatefulWidget {
  final Config config;

  const ProcedureSelectionScreen({
    required this.config,
    super.key,
  });

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
        content: Text(S.of(context).emptyConfigContent,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            )),
      ),
      onNewProject: () => context.go(
        AppRouter.projectNameScreen,
        extra: blocOf(context)
            .state
            .config
            .copyWith(projectPath: blocOf(context).state.config.projectPath),
      ),
      onAndroidSigningCreated: (success) {
        Dialogs.showOkDialog(
          context: context,
          isError: !success,
          title: S.of(context).signingToolTitle,
          content: Text(
            success
                ? S.of(context).signingToolSuccessText
                : S.of(context).signingToolErrorText,
            style: context.appTextStyles.fs18?.copyWith(
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ProcedureSelectionScreenState state,
  ) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Delimiter.height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: 120,
                        child: CupertinoSegmentedControl<String>(
                          padding: EdgeInsets.zero,
                          groupValue: state.language,
                          selectedColor: AppColors.white,
                          unselectedColor: AppColors.bgDark,
                          borderColor: AppColors.white,
                          children: _mapValues(context),
                          onValueChanged: (value) {
                            blocOf(context).add(
                              ProcedureSelectionScreenEventOnLocaleChange(
                                  language: value),
                            );
                          },
                        ),
                      ),
                    ),
                    const Delimiter.width(20),
                    ToolsPopupButton(
                      onSelected: (value) {
                        switch (value) {
                          case ToolType.generateAndroidSigning:
                            _onGenerateSigningSelected(context);
                            break;
                        }
                      },
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppFilledButton(
                        label: S.of(context).generateNewProject,
                        big: true,
                        onPressed: () {
                          getDirectoryPath().then(
                            (value) {
                              if (value != null) {
                                blocOf(context).add(
                                    ProcedureSelectionScreenEventOnNewProject(
                                  projectPath: value,
                                ));
                              } else {
                                Dialogs.showOkDialog(
                                  context: context,
                                  isError: true,
                                  title: S.of(context).pathNotSelectedTitle,
                                  content: Text(
                                      S.of(context).pathNotSelectedContent,
                                      style:
                                          context.appTextStyles.fs18?.copyWith(
                                        fontSize: 16,
                                      )),
                                  onOk: () {},
                                );
                              }
                            },
                          );
                        },
                        icon: Icons.create_new_folder_outlined,
                      ),
                    ),
                    if (state.config.projectExists &&
                        state.config.projectName.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppFilledButton(
                          label: S
                              .of(context)
                              .modifyGeneratedProject(state.config.projectName),
                          big: true,
                          onPressed: () {
                            blocOf(context)
                                .add(ProcedureSelectionScreenEventOnProjectOpen(
                              projectURI:
                                  '${state.config.projectPath}/${state.config.projectName}',
                            ));
                          },
                          icon: Icons.create_new_folder_outlined,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: AppFilledButton(
                        label: S.of(context).openExistingProject,
                        big: true,
                        onPressed: () {
                          getDirectoryPath().then(
                            (value) {
                              if (value != null) {
                                blocOf(context).add(
                                    ProcedureSelectionScreenEventOnProjectOpen(
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
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Text(
              (state.config.localVersion.isNotEmpty &&
                      state.config.remoteVersion.isNotEmpty)
                  ? 'v${state.config.localVersion} (Remote: v${state.config.remoteVersion})'
                  : '',
              style: context.appTextStyles.fs18?.copyWith(
                decoration: TextDecoration.none,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, Widget> _mapValues(BuildContext context) {
    Map<String, Widget> result = {};
    for (String value
        in S.delegate.supportedLocales.map((e) => e.languageCode)) {
      result.addAll({
        value: Text(
          value.toUpperCase(),
          style: context.appTextStyles.fs18?.copyWith(
            color: blocOf(context).state.language == value
                ? CupertinoColors.black
                : AppColors.inactiveText,
          ),
        )
      });
    }
    return result;
  }

  Future<void> _onGenerateSigningSelected(BuildContext context) async {
    final directoryPath = await getDirectoryPath();
    if (!context.mounted) {
      return;
    }
    if (directoryPath == null) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).pathNotSelectedTitle,
        content: Text(
          S.of(context).pathNotSelectedContent,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
      return;
    }
    final directory = Directory(directoryPath);
    final isFlutterProject = directory.isFlutterProjectDirectory();
    if (!isFlutterProject) {
      Dialogs.showOkDialog(
        context: context,
        isError: true,
        title: S.of(context).projectSelectErrorTitle,
        content: Text(
          S.of(context).projectSelectErrorMessage,
          style: context.appTextStyles.fs18?.copyWith(
            fontSize: 16,
          ),
        ),
      );
      return;
    }
    final signingVars = await showCupertinoModalPopup<List<String>>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const SigningDialog(
        signingVars: AppConsts.defaultSigningVars,
      ),
    );
    if (!context.mounted) {
      return;
    }
    if (signingVars != null) {
      blocOf(context).add(
        ProcedureSelectionScreenEvent.onGenerateAndroidSigning(
          directory: directory,
          signingVars: signingVars,
        ),
      );
    }
  }
}
